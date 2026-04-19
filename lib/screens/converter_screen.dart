// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:async';
import 'dart:io';

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
import '../services/preferences_service.dart';
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
  bool _isExpertMode = false;
  bool _cpuWarningDismissed = false;
  ExpertSettings _expertSettings = const ExpertSettings();
  VideoPlayerController? _playerController;
  Timer? _seekDebounce;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _loadPreferences();
    _cleanAppCache();
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
        if (entry is Directory && entry.path != '${cacheRoot.path}/conversions') {
          try { await entry.delete(recursive: true); } catch (_) {}
        }
      }
    } catch (_) {}
  }

  Future<void> _loadPreferences() async {
    final expert = await PreferencesService.getExpertMode();
    final dismissed = await PreferencesService.getCpuWarningDismissed();
    final quality = await PreferencesService.getLastQualityIndex();
    if (mounted) setState(() {
      _isExpertMode = expert;
      _cpuWarningDismissed = dismissed;
      _selectedQualityIndex = quality;
    });
  }

  Future<void> _requestPermissions() async {
    // Android 13+: READ_MEDIA_VIDEO, darunter: READ_EXTERNAL_STORAGE
    if (await Permission.videos.isDenied) {
      await Permission.videos.request();
    } else if (await Permission.storage.isDenied) {
      await Permission.storage.request();
    }
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

    final picked = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (picked == null) {
      setState(() => _isLoading = false);
      return;
    }

    final path = picked.path;

    final meta = await _extractMetadata(path);

    if (meta.durationMs == 0 || meta.width == 0 || meta.height == 0) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context)!.invalidVideoFile),
          backgroundColor: Colors.red,
        ));
      }
      return;
    }

    final oldController = _playerController;
    setState(() => _playerController = null);
    await oldController?.dispose();

    final VideoPlayerController controller;
    if (path.startsWith('content://')) {
      controller = VideoPlayerController.contentUri(Uri.parse(path));
    } else {
      controller = VideoPlayerController.file(File(path));
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
    setState(() {
      _isLoading = false;
      _videoPath = path;
      _metadata = meta;
      _trimStart = 0.0;
      _trimEnd = 1.0;
      _isMuted = false;
      _playerController = previewFailed ? null : controller;
    });

    _updateEstimatedSize();
    await _maybeShowCpuWarning(_metadata!.durationMs);

    if (previewFailed && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(AppLocalizations.of(context)!.previewNotAvailable),
        backgroundColor: Colors.orange,
      ));
    }
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
                    onChanged: (v) => setDialogState(() => dontShowAgain = v ?? false),
                  ),
                  Expanded(child: Text(l.cpuWarningCheckbox)),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                if (dontShowAgain) {
                  await PreferencesService.setCpuWarningDismissed();
                  if (mounted) setState(() => _cpuWarningDismissed = true);
                }
                if (ctx.mounted) Navigator.pop(ctx);
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

    final durationSec = double.tryParse(info?.getDuration() ?? '0') ?? 0.0;
    final rawWidth = videoStream?.getWidth();
    final rawHeight = videoStream?.getHeight();

    return VideoMetadata(
      durationMs: (durationSec * 1000).toInt(),
      width: rawWidth is int ? rawWidth : int.tryParse(rawWidth?.toString() ?? '0') ?? 0,
      height: rawHeight is int ? rawHeight : int.tryParse(rawHeight?.toString() ?? '0') ?? 0,
    );
  }

  // -------------------------------------------------------------------------
  // Hilfsmethoden
  // -------------------------------------------------------------------------

  void _updateEstimatedSize() {
    if (_metadata == null) return;
    if (_isAudioOnly) {
      setState(() => _estimatedSizeMb = 0.0);
      return;
    }
    final quality = qualityOptions[_selectedQualityIndex];
    final durationSec = (_trimEnd - _trimStart) * _metadata!.durationMs / 1000.0;
    final audioBitrate = _isMuted ? 0 : 128000;
    final estimatedBytes = ((quality.estimatedBitrateBps + audioBitrate) / 8) * durationSec;
    setState(() => _estimatedSizeMb = estimatedBytes / (1024 * 1024));
  }

  /// Berechnet Ausgabe-Dimensionen. Rundet auf gerade Zahlen (Pflicht für libx264).
  (int, int) _calculateOutputDimensions(QualityOption quality) =>
      _calcDimensions(quality.maxDimension);

  (int, int) _calcDimensions(int maxDimension) {
    final w = _metadata!.width;
    final h = _metadata!.height;

    if (maxDimension == 0) {
      return ((w ~/ 2) * 2, (h ~/ 2) * 2);
    }

    final sourceMaxDim = w > h ? w : h;
    final targetMaxDim =
        maxDimension > sourceMaxDim ? sourceMaxDim : maxDimension;

    int targetW, targetH;
    if (w > h) {
      targetW = targetMaxDim;
      targetH = (targetMaxDim.toDouble() / w * h).toInt();
    } else {
      targetH = targetMaxDim;
      targetW = (targetMaxDim.toDouble() / h * w).toInt();
    }

    return ((targetW ~/ 2) * 2, (targetH ~/ 2) * 2);
  }

  // -------------------------------------------------------------------------
  // Konvertierung (FFmpegKit)
  // -------------------------------------------------------------------------

  /// Prüft ob genug freier Speicher für die geschätzte Output-Datei vorhanden ist.
  /// Gibt false zurück und zeigt einen Dialog, wenn der Speicher nicht reicht.
  Future<bool> _checkStorage() async {
    if (_estimatedSizeMb <= 0) return true; // Audio-Only: kein Check nötig
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
        content: Text(l.storageWarningContent(
          freeSpaceMb.toStringAsFixed(0),
          requiredMb.toStringAsFixed(0),
        )),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l.ok)),
        ],
      ),
    );
    return false;
  }

  Future<void> _convertVideo() async {
    if (_videoPath == null || _metadata == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.noVideoLoaded)),
      );
      return;
    }

    if (!await _checkStorage()) return;

    final convertedPrefix = AppLocalizations.of(context)!.convertedPrefix;

    final cacheDir = await ConversionScreen.getCacheDir();
    final startSec = _trimStart * _metadata!.durationMs / 1000.0;
    final endSec = _trimEnd * _metadata!.durationMs / 1000.0;
    final totalDurationMs = _metadata!.durationMs.toDouble();
    // content://-URIs und Pfade mit Leerzeichen korrekt escapen
    final inputArg = _videoPath!.startsWith('content://')
        ? _videoPath!
        : '"$_videoPath"';

    final String command;
    final String outputPath;

    // FFmpeg-Encoder-Namen: 'mp3' → 'libmp3lame', 'opus' → 'libopus'
    const ffmpegCodec = {'mp3': 'libmp3lame', 'opus': 'libopus'};

    if (_isExpertMode) {
      final expert = _expertSettings;
      if (expert.audioOnly) {
        // ── Expert: nur Audio extrahieren ─────────────────────────────────
        const audioExt = {'aac': 'm4a', 'mp3': 'mp3', 'opus': 'opus'};
        final ext = audioExt[expert.audioCodec] ?? 'mp3';
        outputPath = '${cacheDir.path}/converted_${DateTime.now().millisecondsSinceEpoch}.$ext';
        final encoderName = ffmpegCodec[expert.audioCodec] ?? expert.audioCodec;
        command =
            '-i $inputArg -ss $startSec -to $endSec '
            '-vn -c:a $encoderName -b:a ${expert.audioBitrate}k -y "$outputPath"';
      } else {
        // ── Expert: Video konvertieren ────────────────────────────────────
        outputPath =
            '${cacheDir.path}/converted_${DateTime.now().millisecondsSinceEpoch}.${expert.container}';
        // scale: W:-2 = Breite fix, Höhe proportional (gerade Zahl)
        //        -2:H = Höhe fix, Breite proportional
        //        W:H  = beide fix
        //        leer = kein Skalieren
        final String vfFilter;
        if (expert.width != 0 && expert.height != 0) {
          vfFilter = '-vf scale=${expert.width}:${expert.height}';
        } else if (expert.width != 0) {
          vfFilter = '-vf scale=${expert.width}:-2';
        } else if (expert.height != 0) {
          vfFilter = '-vf scale=-2:${expert.height}';
        } else {
          vfFilter = '';
        }
        final fpsOpt = expert.fps != 0 ? '-r ${expert.fps}' : '';
        final encoderName = ffmpegCodec[expert.audioCodec] ?? expert.audioCodec;
        final audioOpt = expert.audioBitrate == 0
            ? '-an'
            : '-c:a $encoderName -b:a ${expert.audioBitrate}k';
        final videoCodec = expert.container == 'avi' ? 'mpeg4' : 'libx264';
        command =
            '-i $inputArg -ss $startSec -to $endSec $vfFilter '
            '-c:v $videoCodec -pix_fmt yuv420p -crf ${expert.crf} $fpsOpt $audioOpt -y "$outputPath"';
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
      final (targetW, targetH) = _calculateOutputDimensions(quality);
      final vfFilter = quality.maxDimension != 0 ? '-vf scale=$targetW:$targetH' : '';
      final audioOpt = _isMuted ? '-an' : '-c:a aac -b:a 128k';
      command =
          '-i $inputArg -ss $startSec -to $endSec $vfFilter '
          '-c:v libx264 -pix_fmt yuv420p -crf ${quality.crf} -r 60 $audioOpt -y "$outputPath"';
    }

    final originalName = _videoPath!.split('/').last;
    final baseName = originalName.contains('.')
        ? originalName.substring(0, originalName.lastIndexOf('.'))
        : originalName;
    final ext = outputPath.split('.').last;
    final defaultFileName = '$convertedPrefix$baseName.$ext';

    if (!mounted) return;
    Navigator.push(
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
  }

  // -------------------------------------------------------------------------
  // UI
  // -------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final hasVideo = _videoPath != null && _metadata != null;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppHeader(),
              const SizedBox(height: 8),

              // Normal / Expert Umschalter
              SegmentedButton<bool>(
                segments: [
                  ButtonSegment(value: false, label: Text(AppLocalizations.of(context)!.modeNormal), icon: const Icon(Icons.tune)),
                  ButtonSegment(value: true, label: Text(AppLocalizations.of(context)!.modeExpert), icon: const Icon(Icons.settings_applications)),
                ],
                selected: {_isExpertMode},
                onSelectionChanged: (selection) {
                  final value = selection.first;
                  setState(() => _isExpertMode = value);
                  PreferencesService.setExpertMode(value);
                },
              ),
              const SizedBox(height: 12),

              ElevatedButton.icon(
                icon: _isLoading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Icon(Icons.video_library),
                label: Text(_isLoading ? AppLocalizations.of(context)!.videoLoading : AppLocalizations.of(context)!.selectVideo),
                onPressed: _isLoading ? null : _pickVideo,
              ),

              const SizedBox(height: 16),
              if (!hasVideo)
                // Platzhalter – gleiche Größe wie der Videoplayer, kein Layout-Sprung beim Laden
                Card(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.movie_outlined, size: 64,
                            color: Theme.of(context).colorScheme.outlineVariant),
                        const SizedBox(height: 8),
                        Text(
                          AppLocalizations.of(context)!.selectVideo,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.outlineVariant),
                        ),
                      ],
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
                          const Icon(Icons.videocam_off, size: 48, color: Colors.grey),
                          const SizedBox(height: 8),
                          Text(
                            AppLocalizations.of(context)!.previewNotAvailableLabel,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
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
                    _seekDebounce = Timer(const Duration(milliseconds: 120), () {
                      _playerController?.seekTo(Duration(
                        milliseconds: (seekFraction * _metadata!.durationMs).toInt(),
                      ));
                    });
                    _updateEstimatedSize();
                  },
                ),
              ],

              const SizedBox(height: 16),

              if (_isExpertMode) ...[
                ExpertControls(
                  settings: _expertSettings,
                  isConverting: false,
                  metadata: _metadata,
                  onChanged: (s) => setState(() => _expertSettings = s),
                ),
                const SizedBox(height: 8),
                ConvertSection(
                  isMuted: _expertSettings.audioBitrate == 0,
                  showMute: false,
                  isAudioOnly: _expertSettings.audioOnly,
                  audioOnlySwitchEnabled: _expertSettings.audioBitrate != 0,
                  estimatedSizeMb: null,
                  onMuteChanged: (val) => setState(() =>
                    _expertSettings = _expertSettings.copyWith(
                      audioBitrate: val ? 0 : 128,
                    )),
                  onAudioOnlyChanged: (val) => setState(() =>
                    _expertSettings = _expertSettings.copyWith(audioOnly: val)),
                  onConvert: _convertVideo,
                ),
              ] else ...[
                QualitySelector(
                  selectedIndex: _selectedQualityIndex,
                  isConverting: false,
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
    );
  }
}
