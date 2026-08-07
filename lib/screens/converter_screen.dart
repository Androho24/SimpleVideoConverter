// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:disk_space_plus/disk_space_plus.dart';
import 'package:ffmpeg_kit_flutter_new/ffprobe_kit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

import '../l10n/app_localizations.dart';
import '../models/expert_settings.dart';
import '../models/quality_option.dart';
import '../models/video_metadata.dart';
import '../screens/conversion_screen.dart';
import '../screens/settings_screen.dart';
import '../services/ffmpeg_codec_options.dart';
import '../services/media_format_compatibility.dart';
import '../services/native_ad_preloader.dart';
import '../services/output_size_estimator.dart';
import '../services/preferences_service.dart';
import '../services/pro_prompt_service.dart';
import '../services/review_service.dart';
import '../services/video_quality_scale.dart';
import '../services/video_scale_service.dart';
import '../widgets/app_header.dart';
import '../widgets/convert_section.dart';
import '../widgets/expert_controls.dart';
import '../widgets/quality_selector.dart';
import '../widgets/trim_slider.dart';
import '../widgets/video_preview.dart';

class VideoConverterApp extends StatefulWidget {
  const VideoConverterApp({super.key});

  @override
  State<VideoConverterApp> createState() => _VideoConverterAppState();
}

class _VideoConverterAppState extends State<VideoConverterApp> {
  // State
  String? _videoPath;
  VideoMetadata? _metadata;
  double _trimStart = 0.0;
  double _trimEnd = 1.0;
  int _selectedQualityIndex = 0;
  bool _isMuted = false;
  double _estimatedSizeMb = 0.0;

  bool _isAudioOnly = false;
  bool _isLoading = false;
  bool _isConverting = false;
  bool _isExpertMode = false;
  int _selectedNavIndex = 0;
  bool _cpuWarningDismissed = false;
  String _videoCodec = PreferencesService.videoCodecH264;
  bool _av1Experimental = false;
  ExpertSettings _expertSettings = const ExpertSettings();
  VideoPlayerController? _playerController;
  Timer? _seekDebounce;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
    _cleanAppCache();
    // Fallback: Falls die Prompts nach einer Konvertierung nicht gezeigt wurden
    // (App vorher geschlossen), spätestens beim nächsten Start nachholen.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _maybeShowEngagementPrompts();
    });
  }

  /// Zeigt – falls fällig – nacheinander den Review-Dialog (ab 10 Konvertierungen)
  /// und den Pro-Hinweis (ab 20). Wird bei Rückkehr aus der Konvertierung und als
  /// Start-Fallback aufgerufen; jeder Prompt erscheint dank „shown"-Flag nur einmal.
  Future<void> _maybeShowEngagementPrompts() async {
    await ReviewService.maybeShowReview();
    if (!mounted) return;
    await ProPromptService.maybeShowProHint(context);
  }

  /// Bereinigt beim App-Start den Cache:
  /// - conversions/-Ordner (unsere Output-Dateien)
  /// - UUID-Ordner im Cache-Root (Temp-Dateien von image_picker)
  Future<void> _cleanAppCache() async {
    try {
      // Unseren conversions/-Ordner bereinigen
      await ConversionScreen.cleanCacheDir();

      // image_picker hinterlässt UUID-Ordner direkt im Cache-Root
      final cacheRoot = await getTemporaryDirectory();
      final entries = cacheRoot.listSync();
      for (final entry in entries) {
        if (entry is Directory &&
            entry.path != '${cacheRoot.path}/conversions') {
          try {
            await entry.delete(recursive: true);
          } catch (_) {}
        }
      }
    } catch (_) {}
  }

  Future<void> _loadPreferences() async {
    final expert = await PreferencesService.getExpertMode();
    final dismissed = await PreferencesService.getCpuWarningDismissed();
    final quality = await PreferencesService.getLastQualityIndex();
    final videoCodec = await PreferencesService.getVideoCodec();
    final av1Experimental = await PreferencesService.getAv1Experimental();
    if (mounted) {
      setState(() {
        _isExpertMode = expert;
        _selectedNavIndex = expert ? 1 : 0;
        _cpuWarningDismissed = dismissed;
        _selectedQualityIndex = quality;
        _videoCodec = videoCodec;
        _av1Experimental = av1Experimental;
        _expertSettings = _expertSettings.copyWith(videoCodec: videoCodec);
      });
    }
  }

  Future<void> _refreshCodecPreferences() async {
    final videoCodec = await PreferencesService.getVideoCodec();
    final av1Experimental = await PreferencesService.getAv1Experimental();
    if (!mounted) return;
    if (_videoCodec == videoCodec && _av1Experimental == av1Experimental) {
      return;
    }
    setState(() {
      _videoCodec = videoCodec;
      _av1Experimental = av1Experimental;
      // AV1 wurde gerade abgeschaltet: die Expertenauswahl darf nicht auf einem
      // nicht mehr angebotenen Codec stehen bleiben.
      if (!av1Experimental &&
          _expertSettings.videoCodec ==
              MediaFormatCompatibility.videoCodecAv1) {
        _expertSettings = _fallbackFromAv1(_expertSettings);
      }
    });
    _updateEstimatedSize();
  }

  /// Ersetzt AV1 durch H.264 und rechnet CRF sowie Container mit.
  ExpertSettings _fallbackFromAv1(ExpertSettings settings) {
    const target = MediaFormatCompatibility.videoCodecH264;
    return settings.copyWith(
      videoCodec: target,
      crf: VideoQualityScale.convertCrf(
        settings.crf,
        fromCodec: settings.videoCodec,
        toCodec: target,
      ),
      container: MediaFormatCompatibility.preferredContainer(
        videoCodec: target,
        audioCodec: settings.audioCodec,
        currentContainer: settings.container,
      ),
    );
  }

  Future<void> _requestNotificationPermission() async {
    if (!Platform.isAndroid) return;
    final status = await Permission.notification.status;
    if (status.isGranted) return;
    if (!mounted) return;
    final l = AppLocalizations.of(context)!;

    if (status.isPermanentlyDenied) return;

    // Rationale-Dialog nur einmal zeigen
    final alreadyShown =
        await PreferencesService.getNotificationRationaleDismissed();
    if (alreadyShown) {
      await Permission.notification.request();
      return;
    }

    if (!mounted) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.notificationPermissionTitle),
        content: Text(l.notificationPermissionContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l.notificationPermissionNotNow),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l.notificationPermissionAllow),
          ),
        ],
      ),
    );
    await PreferencesService.setNotificationRationaleDismissed();
    if (confirmed == true) await Permission.notification.request();
  }

  @override
  void dispose() {
    _seekDebounce?.cancel();
    _playerController?.dispose();
    super.dispose();
  }

  // -------------------------------------------------------------------------
  // Video auswählen
  // -------------------------------------------------------------------------

  Future<void> _pickVideo() async {
    setState(() => _isLoading = true);

    final XFile? picked;
    try {
      picked = await ImagePicker().pickVideo(source: ImageSource.gallery);
    } catch (_) {
      // image_picker kann auf manchen Geräten (z. B. Chromebooks, exotische SAF-URIs)
      // PlatformException(no_valid_video_uri) werfen, wenn das vom System gelieferte
      // Video-URI nicht in einen lesbaren Pfad aufgelöst werden kann.
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.invalidVideoFile),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }
    if (picked == null) {
      setState(() => _isLoading = false);
      return;
    }

    final path = picked.path;

    final meta = await _extractMetadata(path);

    if (meta.durationMs == 0 || meta.width == 0 || meta.height == 0) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.invalidVideoFile),
            backgroundColor: Colors.red,
          ),
        );
      }
      return;
    }

    final oldController = _playerController;
    setState(() => _playerController = null);
    await oldController?.dispose();

    // platformView (SurfaceView) statt des Default-textureView: Screen
    // Recordings laufen mit 60 fps, und der Texture-Pfad schickt jeden Frame
    // durch Flutters Raster-Pipeline. Das schafft der Compositor bei 1080p60
    // nicht — ExoPlayer verwirft dann Frames, während die Audiouhr weiterläuft
    // (Bild wie 10 fps, Ton über eine Sekunde voraus). Die SurfaceView gibt
    // die Frames direkt an die Display-Pipeline, wie es andere Player tun.
    // Nur Android: auf iOS ist der Texture-Pfad unauffällig.
    final viewType = Platform.isAndroid
        ? VideoViewType.platformView
        : VideoViewType.textureView;

    final VideoPlayerController controller;
    if (path.startsWith('content://')) {
      controller = VideoPlayerController.contentUri(
        Uri.parse(path),
        viewType: viewType,
      );
    } else {
      controller = VideoPlayerController.file(File(path), viewType: viewType);
    }

    bool previewFailed = false;
    try {
      await controller.initialize();
      controller.setLooping(true);
    } catch (_) {
      await controller.dispose();
      previewFailed = true;
    }

    if (!mounted) return;

    final videoShortSide = VideoScaleService.sourceShortSide(
      meta.width,
      meta.height,
    );
    final selectableShortSide = max(
      videoShortSide,
      qualityOptions.last.shortSide,
    );
    int adjustedQualityIndex = _selectedQualityIndex;
    if (qualityOptions[_selectedQualityIndex].shortSide > selectableShortSide) {
      final firstValid = qualityOptions.indexWhere(
        (q) => q.shortSide <= selectableShortSide,
      );
      if (firstValid != -1) adjustedQualityIndex = firstValid;
    }
    if (adjustedQualityIndex != _selectedQualityIndex) {
      PreferencesService.setLastQualityIndex(adjustedQualityIndex);
    }

    setState(() {
      _isLoading = false;
      _videoPath = path;
      _metadata = meta;
      _trimStart = 0.0;
      _trimEnd = 1.0;
      _isMuted = false;
      _selectedQualityIndex = adjustedQualityIndex;
      _playerController = previewFailed ? null : controller;
    });

    _updateEstimatedSize();
    await _maybeShowCpuWarning(_metadata!.durationMs);

    if (previewFailed && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.previewNotAvailable),
          backgroundColor: Colors.orange,
        ),
      );
    }

    await _maybeShowHdrCodecHint(meta);
  }

  // -------------------------------------------------------------------------
  // CPU-Warndialog bei großen Eingabedateien
  // -------------------------------------------------------------------------

  Future<void> _maybeShowCpuWarning(int durationMs) async {
    const thresholdMs = 5 * 60 * 1000; // 5 Minuten
    if (durationMs < thresholdMs || _cpuWarningDismissed) return;
    if (!mounted) return;

    final l = AppLocalizations.of(context)!;
    bool dontShowAgain = false;

    await showDialog<void>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text(l.cpuWarningTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l.cpuWarningContent),
              const SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(
                    value: dontShowAgain,
                    onChanged: (v) =>
                        setDialogState(() => dontShowAgain = v ?? false),
                  ),
                  Expanded(child: Text(l.cpuWarningCheckbox)),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Erst den Dialog schließen — sonst kann ein zwischengeschalteter
                // Back-Press die Route entfernen, bevor der await zurückkommt.
                final remember = dontShowAgain;
                Navigator.pop(ctx);
                if (remember) {
                  PreferencesService.setCpuWarningDismissed();
                  if (mounted) setState(() => _cpuWarningDismissed = true);
                }
              },
              child: Text(l.ok),
            ),
          ],
        ),
      ),
    );
  }

  // -------------------------------------------------------------------------
  // Metadaten extrahieren (via FFprobeKit)
  // -------------------------------------------------------------------------

  Future<VideoMetadata> _extractMetadata(String path) async {
    final session = await FFprobeKit.getMediaInformation(path);
    final info = session.getMediaInformation();
    final streams = info?.getStreams();

    dynamic videoStream;
    if (streams != null && streams.isNotEmpty) {
      try {
        videoStream = streams.firstWhere(
          (s) => s.getType() == 'video',
          orElse: () => streams.first,
        );
      } catch (_) {
        videoStream = streams.first;
      }
    }

    dynamic audioStream;
    try {
      audioStream = streams?.firstWhere((s) => s.getType() == 'audio');
    } catch (_) {}
    final channelsRaw = audioStream?.getAllProperties()?['channels'];
    final audioChannels = channelsRaw is int
        ? channelsRaw
        : int.tryParse(channelsRaw?.toString() ?? '0') ?? 0;

    final durationSec = double.tryParse(info?.getDuration() ?? '0') ?? 0.0;
    final rawWidth = videoStream?.getWidth();
    final rawHeight = videoStream?.getHeight();
    final encodedWidth = rawWidth is int
        ? rawWidth
        : int.tryParse(rawWidth?.toString() ?? '0') ?? 0;
    final encodedHeight = rawHeight is int
        ? rawHeight
        : int.tryParse(rawHeight?.toString() ?? '0') ?? 0;
    final videoProperties = videoStream?.getAllProperties();
    final rotationDegrees = VideoScaleService.probeRotationDegrees(
      videoProperties,
    );
    final (displayWidth, displayHeight) = VideoScaleService.displayDimensions(
      encodedWidth: encodedWidth,
      encodedHeight: encodedHeight,
      rotationDegrees: rotationDegrees,
      displayAspectRatio: videoStream?.getDisplayAspectRatio(),
    );

    return VideoMetadata(
      durationMs: (durationSec * 1000).toInt(),
      width: displayWidth,
      height: displayHeight,
      audioChannels: audioChannels,
      hdrTransfer: VideoScaleService.hdrTransfer(
        videoProperties?['color_transfer'],
      ),
    );
  }

  // -------------------------------------------------------------------------
  // HDR
  // -------------------------------------------------------------------------

  /// Der Codec, mit dem im Normal-Modus tatsächlich encodiert wird: bei einer
  /// HDR-Quelle weicht H.264 auf H.265 aus, sonst bliebe nur Tonemapping nach
  /// SDR. Nur für den laufenden Auftrag — die Einstellung wird nicht verändert.
  String _hdrCodecFor(String preferredCodec) {
    if (!_metadata!.isHdr) return preferredCodec;
    if (FfmpegCodecOptions.supportsHdr(preferredCodec)) return preferredCodec;
    return PreferencesService.videoCodecH265;
  }

  /// Bleibt die Quelle bei diesem Codec in HDR, statt getonemappt zu werden?
  bool _keepsHdr(String codec) =>
      _metadata!.isHdr && FfmpegCodecOptions.supportsHdr(codec);

  /// Weist auf den automatischen Codec-Wechsel hin, sobald ein HDR-Video
  /// geladen wird und die Einstellung ihn nicht halten könnte.
  Future<void> _maybeShowHdrCodecHint(VideoMetadata meta) async {
    if (!meta.isHdr || _isExpertMode) return;
    final preferred = await PreferencesService.getVideoCodec();
    if (FfmpegCodecOptions.supportsHdr(preferred)) return;
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context)!.hdrCodecSwitched),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  // -------------------------------------------------------------------------
  // Hilfsmethoden
  // -------------------------------------------------------------------------

  void _updateEstimatedSize() {
    if (_metadata == null) return;
    final durationSec =
        (_trimEnd - _trimStart) * _metadata!.durationMs / 1000.0;

    if (_isExpertMode) {
      setState(
        () => _estimatedSizeMb = OutputSizeEstimator.estimateExpertMegabytes(
          durationSeconds: durationSec,
          metadata: _metadata!,
          settings: _expertSettings,
        ),
      );
      return;
    }

    // Normal-Modus
    if (_isAudioOnly) {
      setState(
        () => _estimatedSizeMb =
            OutputSizeEstimator.estimateNormalAudioOnlyMegabytes(durationSec),
      );
      return;
    }
    final quality = qualityOptions[_selectedQualityIndex];
    setState(
      () => _estimatedSizeMb = OutputSizeEstimator.estimateNormalMegabytes(
        durationSeconds: durationSec,
        metadata: _metadata!,
        quality: quality,
        videoCodec: _videoCodec,
        muted: _isMuted,
      ),
    );
  }

  // -------------------------------------------------------------------------
  // Konvertierung (FFmpegKit)
  // -------------------------------------------------------------------------

  /// Prüft ob genug freier Speicher für die geschätzte Output-Datei vorhanden ist.
  /// Gibt false zurück und zeigt einen Dialog, wenn der Speicher nicht reicht.
  Future<bool> _checkStorage() async {
    if (_estimatedSizeMb <= 0) return true;
    final freeSpaceMb = await DiskSpacePlus().getFreeDiskSpace;
    if (freeSpaceMb == null) return true; // Nicht ermittelbar: nicht blockieren
    final requiredMb = _estimatedSizeMb * 1.5;
    if (freeSpaceMb >= requiredMb) return true;

    if (!mounted) return false;
    final l = AppLocalizations.of(context)!;
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.storageWarningTitle),
        content: Text(
          l.storageWarningContent(
            freeSpaceMb.toStringAsFixed(0),
            requiredMb.toStringAsFixed(0),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l.ok)),
        ],
      ),
    );
    return false;
  }

  Future<void> _convertVideo() async {
    if (_isConverting) return;
    if (_videoPath == null || _metadata == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.noVideoLoaded)),
      );
      return;
    }
    setState(() => _isConverting = true);

    // Native-Ad parallel zum FFmpeg-Setup vorladen, damit sie auf dem
    // Conversion-Screen ohne Ladephase erscheint. Pro-User: skippt intern.
    NativeAdPreloader.preload();

    if (!await _checkStorage()) {
      if (mounted) setState(() => _isConverting = false);
      return;
    }

    if (!mounted) return;
    final convertedPrefix = AppLocalizations.of(context)!.convertedPrefix;

    final cacheDir = await ConversionScreen.getCacheDir();
    // Im Normal-Modus weicht eine HDR-Quelle auf H.265 aus, damit die Farben
    // erhalten bleiben statt nach SDR getonemappt zu werden. Gilt nur für
    // dieses Video — die gespeicherte Codec-Einstellung bleibt unangetastet.
    // Im Expertenmodus zählt die ausdrückliche Wahl des Nutzers.
    final selectedVideoCodec = _hdrCodecFor(
      await PreferencesService.getVideoCodec(),
    );
    final videoEncoder = FfmpegCodecOptions.videoEncoder(selectedVideoCodec);
    final startSec = _trimStart * _metadata!.durationMs / 1000.0;
    final endSec = _trimEnd * _metadata!.durationMs / 1000.0;
    final totalDurationMs = _metadata!.durationMs.toDouble();
    // content://-URIs und Pfade mit Leerzeichen korrekt escapen
    final inputArg = _videoPath!.startsWith('content://')
        ? _videoPath!
        : '"$_videoPath"';

    final String command;
    final String outputPath;

    if (_isExpertMode) {
      final expert = _expertSettings;
      if (expert.audioOnly) {
        // ── Expert: nur Audio extrahieren ─────────────────────────────────
        final ext = FfmpegCodecOptions.audioOnlyExtension(expert.audioCodec);
        outputPath =
            '${cacheDir.path}/converted_${DateTime.now().millisecondsSinceEpoch}.$ext';
        final encoderName = FfmpegCodecOptions.audioEncoder(expert.audioCodec);
        final channelOptAudio = expert.audioChannels > 0
            ? '-ac ${expert.audioChannels}'
            : '';
        command =
            '-i $inputArg -ss $startSec -to $endSec '
            '-vn -c:a $encoderName -b:a ${expert.audioBitrate}k $channelOptAudio -y "$outputPath"';
      } else {
        // ── Expert: Video konvertieren ────────────────────────────────────
        outputPath =
            '${cacheDir.path}/converted_${DateTime.now().millisecondsSinceEpoch}.${expert.container}';
        // scale: W:-2 = Breite fix, Höhe proportional (gerade Zahl)
        //        -2:H = Höhe fix, Breite proportional
        //        W:H  = beide fix
        //        leer = kein Skalieren
        final String scaleGraph;
        if (expert.width != 0 && expert.height != 0) {
          scaleGraph = 'scale=${expert.width}:${expert.height}';
        } else if (expert.width != 0) {
          scaleGraph = 'scale=${expert.width}:-2';
        } else if (expert.height != 0) {
          scaleGraph = 'scale=-2:${expert.height}';
        } else {
          scaleGraph = '';
        }
        final keepsHdr = _keepsHdr(expert.videoCodec);
        final vfFilter = VideoScaleService.filterArgument(
          scaleGraph,
          hdrTransfer: keepsHdr ? null : _metadata!.hdrTransfer,
        );
        final pixelFormatOpt = keepsHdr
            ? FfmpegCodecOptions.hdrArguments(_metadata!.hdrTransfer!)
            : '-pix_fmt yuv420p';
        final fpsOpt = expert.fps != 0 ? '-r ${expert.fps}' : '';
        final encoderName = FfmpegCodecOptions.audioEncoder(expert.audioCodec);
        final channelOpt = expert.audioChannels > 0
            ? '-ac ${expert.audioChannels}'
            : '';
        final audioOpt = expert.audioBitrate == 0
            ? '-an'
            : '-c:a $encoderName -b:a ${expert.audioBitrate}k $channelOpt';
        final videoCodec = FfmpegCodecOptions.videoEncoder(expert.videoCodec);
        final codecTagOpt = FfmpegCodecOptions.codecTagArguments(
          expert.videoCodec,
          expert.container,
        );
        final qualityOpt = FfmpegCodecOptions.videoQualityArguments(
          codec: expert.videoCodec,
          bitrateMode: expert.bitrateMode,
          crf: expert.crf,
          targetBitrateKbps: expert.targetBitrateKbps,
        );
        final encoderOpt = FfmpegCodecOptions.videoEncoderArguments(
          expert.videoCodec,
          hdr: keepsHdr,
        );
        command =
            '-i $inputArg -ss $startSec -to $endSec $vfFilter '
            '-c:v $videoCodec $codecTagOpt $encoderOpt $pixelFormatOpt '
            '$qualityOpt $fpsOpt $audioOpt -y "$outputPath"';
      }
    } else if (_isAudioOnly) {
      // ── Normal: nur Audio extrahieren (MP3 192k) ────────────────────────
      outputPath =
          '${cacheDir.path}/converted_${DateTime.now().millisecondsSinceEpoch}.mp3';
      command =
          '-i $inputArg -ss $startSec -to $endSec '
          '-vn -c:a libmp3lame -b:a 192k -y "$outputPath"';
    } else {
      // ── Normal: Video konvertieren ────────────────────────────────────
      final quality = qualityOptions[_selectedQualityIndex];
      outputPath =
          '${cacheDir.path}/converted_${DateTime.now().millisecondsSinceEpoch}.mp4';
      final keepsHdr = _keepsHdr(selectedVideoCodec);
      final vfFilter = VideoScaleService.standardFilter(
        quality.shortSide,
        hdrTransfer: keepsHdr ? null : _metadata!.hdrTransfer,
      );
      final pixelFormatOpt = keepsHdr
          ? FfmpegCodecOptions.hdrArguments(_metadata!.hdrTransfer!)
          : '-pix_fmt yuv420p';
      final audioOpt = _isMuted ? '-an' : '-c:a aac -b:a 128k';
      // Die CRF-Werte der Qualitätsstufen sind auf x264 geeicht. H.265 braucht
      // rund 5 Stufen mehr für dasselbe Bild, AV1 arbeitet auf einer anderen
      // Skala (0–63) und wird deshalb umgerechnet.
      final videoCrf = switch (selectedVideoCodec) {
        PreferencesService.videoCodecH265 => (quality.crf + 5).clamp(0, 51),
        PreferencesService.videoCodecAv1 => VideoQualityScale.convertCrf(
          quality.crf,
          fromCodec: PreferencesService.videoCodecH264,
          toCodec: PreferencesService.videoCodecAv1,
        ),
        _ => quality.crf,
      };
      final codecTagOpt = FfmpegCodecOptions.codecTagArguments(
        selectedVideoCodec,
        'mp4',
      );
      final qualityOpt = FfmpegCodecOptions.videoQualityArguments(
        codec: selectedVideoCodec,
        bitrateMode: 'crf',
        crf: videoCrf,
        targetBitrateKbps: 0,
      );
      final encoderOpt = FfmpegCodecOptions.videoEncoderArguments(
        selectedVideoCodec,
        hdr: keepsHdr,
      );
      // Bewusst kein -r: die Bildrate der Quelle bleibt erhalten. Ein fester
      // Wert würde bei 30-fps-Material jeden Frame verdoppeln — mehr Rechenzeit
      // und größere Dateien ohne sichtbaren Gewinn.
      command =
          '-i $inputArg -ss $startSec -to $endSec $vfFilter '
          '-c:v $videoEncoder $codecTagOpt $encoderOpt $pixelFormatOpt '
          '$qualityOpt $audioOpt -y "$outputPath"';
    }

    final originalName = _videoPath!.split('/').last;
    final baseName = originalName.contains('.')
        ? originalName.substring(0, originalName.lastIndexOf('.'))
        : originalName;
    final ext = outputPath.split('.').last;
    final defaultFileName = '$convertedPrefix$baseName.$ext';

    await _requestNotificationPermission();

    if (!mounted) return;
    setState(() => _isConverting = false);
    await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => ConversionScreen(
          command: command,
          outputPath: outputPath,
          totalDurationMs: totalDurationMs,
          defaultFileName: defaultFileName,
        ),
      ),
    );
    // Zurück in der Hauptansicht (Konvertierung ist gespeichert/verworfen) →
    // jetzt ggf. Review-/Pro-Prompt zeigen, ohne den Speichern-Flow zu stören.
    if (mounted) await _maybeShowEngagementPrompts();
  }

  // -------------------------------------------------------------------------
  // UI
  // -------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final hasVideo = _videoPath != null && _metadata != null;

    final l = AppLocalizations.of(context)!;
    return PopScope(
      canPop: _selectedNavIndex == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          setState(() {
            _selectedNavIndex = 0;
            _isExpertMode = false;
          });
          PreferencesService.setExpertMode(false);
        }
      },
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedNavIndex,
          onDestinationSelected: (index) async {
            if (index == 2) {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SettingsScreen(
                    onNavigate: (i) {
                      setState(() {
                        _selectedNavIndex = i;
                        _isExpertMode = i == 1;
                      });
                      PreferencesService.setExpertMode(i == 1);
                      _updateEstimatedSize();
                    },
                  ),
                ),
              );
              await _refreshCodecPreferences();
            } else {
              final isExpert = index == 1;
              setState(() {
                _selectedNavIndex = index;
                _isExpertMode = isExpert;
              });
              PreferencesService.setExpertMode(isExpert);
              _updateEstimatedSize();
            }
          },
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.tune),
              label: l.modeNormal,
            ),
            NavigationDestination(
              icon: const Icon(Icons.settings_applications),
              label: l.modeExpert,
            ),
            NavigationDestination(
              icon: const Icon(Icons.settings_outlined),
              label: l.settingsTitle,
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AppHeader(),
                const SizedBox(height: 12),

                ElevatedButton.icon(
                  icon: _isLoading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.video_library),
                  label: Text(
                    _isLoading
                        ? AppLocalizations.of(context)!.videoLoading
                        : AppLocalizations.of(context)!.selectVideo,
                  ),
                  onPressed: _isLoading ? null : _pickVideo,
                ),

                const SizedBox(height: 16),
                if (!hasVideo)
                  // Platzhalter – gleiche Größe wie der Videoplayer, kein Layout-Sprung beim Laden
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: _isLoading ? null : _pickVideo,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.movie_outlined,
                              size: 64,
                              color: Theme.of(
                                context,
                              ).colorScheme.outlineVariant,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              AppLocalizations.of(context)!.selectVideo,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.outlineVariant,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                else ...[
                  if (_playerController != null)
                    VideoPreview(
                      controller: _playerController!,
                      trimStart: _trimStart,
                      trimEnd: _trimEnd,
                    )
                  else
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.videocam_off,
                              size: 48,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              AppLocalizations.of(
                                context,
                              )!.previewNotAvailableLabel,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 8),
                  TrimSlider(
                    trimStart: _trimStart,
                    trimEnd: _trimEnd,
                    isConverting: false,
                    metadata: _metadata!,
                    onChanged: (values) {
                      final seekFraction = values.start != _trimStart
                          ? values.start
                          : values.end;
                      setState(() {
                        _trimStart = values.start;
                        _trimEnd = values.end;
                      });
                      _seekDebounce?.cancel();
                      _seekDebounce = Timer(
                        const Duration(milliseconds: 120),
                        () {
                          _playerController?.seekTo(
                            Duration(
                              milliseconds:
                                  (seekFraction * _metadata!.durationMs)
                                      .toInt(),
                            ),
                          );
                        },
                      );
                      _updateEstimatedSize();
                    },
                  ),
                ],

                const SizedBox(height: 16),

                if (_isExpertMode) ...[
                  ExpertControls(
                    settings: _expertSettings,
                    isConverting: false,
                    av1Enabled: _av1Experimental,
                    metadata: _metadata,
                    onChanged: (s) {
                      setState(() => _expertSettings = s);
                      _updateEstimatedSize();
                    },
                  ),
                  const SizedBox(height: 8),
                  ConvertSection(
                    isMuted: _expertSettings.audioBitrate == 0,
                    showMute: false,
                    isAudioOnly: _expertSettings.audioOnly,
                    audioOnlySwitchEnabled: _expertSettings.audioBitrate != 0,
                    estimatedSizeMb: _estimatedSizeMb,
                    onMuteChanged: (val) => setState(
                      () => _expertSettings = _expertSettings.copyWith(
                        audioBitrate: val ? 0 : 128,
                      ),
                    ),
                    onAudioOnlyChanged: (val) {
                      setState(
                        () => _expertSettings = _expertSettings.copyWith(
                          audioOnly: val,
                        ),
                      );
                      _updateEstimatedSize();
                    },
                    onConvert: _convertVideo,
                  ),
                ] else ...[
                  QualitySelector(
                    selectedIndex: _selectedQualityIndex,
                    isConverting: false,
                    videoShortSide: _metadata != null
                        ? VideoScaleService.sourceShortSide(
                            _metadata!.width,
                            _metadata!.height,
                          )
                        : null,
                    onChanged: (val) {
                      setState(() => _selectedQualityIndex = val);
                      PreferencesService.setLastQualityIndex(val);
                      _updateEstimatedSize();
                    },
                  ),
                  const SizedBox(height: 8),
                  ConvertSection(
                    isMuted: _isMuted,
                    isAudioOnly: _isAudioOnly,
                    estimatedSizeMb: _estimatedSizeMb,
                    onMuteChanged: (val) {
                      setState(() => _isMuted = val);
                      _updateEstimatedSize();
                    },
                    onAudioOnlyChanged: (val) {
                      setState(() => _isAudioOnly = val);
                      _updateEstimatedSize();
                    },
                    onConvert: _convertVideo,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
