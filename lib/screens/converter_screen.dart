// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:io';

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit_config.dart';
import 'package:ffmpeg_kit_flutter_new/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

import '../models/quality_option.dart';
import '../models/video_metadata.dart';
import '../widgets/convert_section.dart';
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
  double _progress = 0.0;
  bool _isConverting = false;
  double _estimatedSizeMb = 0.0;

  VideoPlayerController? _playerController;

  @override
  void dispose() {
    _playerController?.dispose();
    super.dispose();
  }

  // -------------------------------------------------------------------------
  // Video auswählen
  // -------------------------------------------------------------------------

  Future<void> _pickVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4', 'mkv', 'mov', 'avi', 'webm', '3gp', 'm4v', 'wmv', 'ts', 'flv'],
    );
    if (result == null || result.files.single.path == null) return;

    final path = result.files.single.path!;

    final meta = await _extractMetadata(path);

    if (meta.durationMs == 0 || meta.width == 0 || meta.height == 0) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Bitte eine gültige Videodatei auswählen.'),
          backgroundColor: Colors.red,
        ));
      }
      return;
    }

    await _playerController?.dispose();

    final VideoPlayerController controller;
    if (path.startsWith('content://')) {
      controller = VideoPlayerController.contentUri(Uri.parse(path));
    } else {
      controller = VideoPlayerController.file(File(path));
    }

    try {
      await controller.initialize();
    } catch (_) {
      await controller.dispose();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Die Datei konnte nicht geladen werden. Bitte eine Videodatei auswählen.'),
          backgroundColor: Colors.red,
        ));
      }
      return;
    }
    controller.setLooping(true);
    controller.play();

    setState(() {
      _videoPath = path;
      _metadata = meta;
      _trimStart = 0.0;
      _trimEnd = 1.0;
      _selectedQualityIndex = 0;
      _isMuted = false;
      _progress = 0.0;
      _isConverting = false;
      _playerController = controller;
    });

    _updateEstimatedSize();
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
    final quality = qualityOptions[_selectedQualityIndex];
    final durationSec = (_trimEnd - _trimStart) * _metadata!.durationMs / 1000.0;
    final audioBitrate = _isMuted ? 0 : 128000;
    final estimatedBytes = ((quality.estimatedBitrateBps + audioBitrate) / 8) * durationSec;
    setState(() => _estimatedSizeMb = estimatedBytes / (1024 * 1024));
  }

  /// Berechnet Ausgabe-Dimensionen. Rundet auf gerade Zahlen (Pflicht für libx264).
  (int, int) _calculateOutputDimensions(QualityOption quality) {
    final w = _metadata!.width;
    final h = _metadata!.height;

    if (quality.maxDimension == 0) {
      return ((w ~/ 2) * 2, (h ~/ 2) * 2);
    }

    final sourceMaxDim = w > h ? w : h;
    final targetMaxDim =
        quality.maxDimension > sourceMaxDim ? sourceMaxDim : quality.maxDimension;

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

  Future<void> _convertVideo() async {
    if (_videoPath == null || _metadata == null) return;

    setState(() {
      _isConverting = true;
      _progress = 0.0;
    });

    final quality = qualityOptions[_selectedQualityIndex];
    final tmpDir = await getTemporaryDirectory();
    final outputPath =
        '${tmpDir.path}/converted_${DateTime.now().millisecondsSinceEpoch}.mp4';

    final (targetW, targetH) = _calculateOutputDimensions(quality);

    final vfFilter = quality.maxDimension != 0 ? '-vf scale=$targetW:$targetH' : '';
    final audioOpt = _isMuted ? '-an' : '-c:a aac -b:a 128k';
    final startSec = _trimStart * _metadata!.durationMs / 1000.0;
    final endSec = _trimEnd * _metadata!.durationMs / 1000.0;
    final totalDurationMs = _metadata!.durationMs.toDouble();

    final inputArg = '"$_videoPath"';
    final outputArg = '"$outputPath"';

    final command =
        '-i $inputArg -ss $startSec -to $endSec $vfFilter '
        '-c:v libx264 -crf ${quality.crf} -r 60 $audioOpt -y $outputArg';

    FFmpegKitConfig.enableStatisticsCallback((stats) {
      final p = (stats.getTime() / totalDurationMs).clamp(0.0, 1.0);
      if (mounted) setState(() => _progress = p);
    });

    FFmpegKit.executeAsync(command, (session) async {
      FFmpegKitConfig.enableStatisticsCallback(null);

      final rc = await session.getReturnCode();
      if (!mounted) return;

      if (ReturnCode.isSuccess(rc)) {
        setState(() {
          _isConverting = false;
          _progress = 1.0;
        });

        final originalName = _videoPath!.split('/').last;
        final baseName = originalName.contains('.')
            ? originalName.substring(0, originalName.lastIndexOf('.'))
            : originalName;
        final defaultFileName = '${baseName}_konvertiert.mp4';

        String? moviesDir;
        try {
          final dirs = await getExternalStorageDirectories(type: StorageDirectory.movies);
          if (dirs != null && dirs.isNotEmpty) moviesDir = dirs.first.path;
        } catch (_) {}

        final bytes = await File(outputPath).readAsBytes();
        final savedPath = await FilePicker.platform.saveFile(
          dialogTitle: 'Video speichern',
          fileName: defaultFileName,
          initialDirectory: moviesDir,
          bytes: bytes,
        );

        if (!mounted) return;

        if (savedPath != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Gespeichert!'),
              action: SnackBarAction(
                label: 'Öffnen',
                onPressed: () => OpenFilex.open(savedPath),
              ),
              duration: const Duration(seconds: 20),
            ),
          );
        }
      } else {
        final log = await session.getFailStackTrace();
        setState(() => _isConverting = false);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Konvertierung fehlgeschlagen: $log'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    });
  }

  // -------------------------------------------------------------------------
  // UI
  // -------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final hasVideo = _videoPath != null && _metadata != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Video Converter'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.video_library),
              label: const Text('Video auswählen'),
              onPressed: _isConverting ? null : _pickVideo,
            ),

            if (hasVideo) ...[
              const SizedBox(height: 16),

              VideoPreview(controller: _playerController!),
              const SizedBox(height: 8),

              TrimSlider(
                trimStart: _trimStart,
                trimEnd: _trimEnd,
                isConverting: _isConverting,
                metadata: _metadata!,
                onChanged: (values) {
                  setState(() {
                    _trimStart = values.start;
                    _trimEnd = values.end;
                  });
                  _playerController?.seekTo(Duration(
                    milliseconds: (values.start * _metadata!.durationMs).toInt(),
                  ));
                  _updateEstimatedSize();
                },
              ),
              const SizedBox(height: 16),

              QualitySelector(
                selectedIndex: _selectedQualityIndex,
                isConverting: _isConverting,
                onChanged: (val) {
                  setState(() => _selectedQualityIndex = val);
                  _updateEstimatedSize();
                },
              ),
              const SizedBox(height: 8),

              ConvertSection(
                isMuted: _isMuted,
                isConverting: _isConverting,
                progress: _progress,
                estimatedSizeMb: _estimatedSizeMb,
                onMuteChanged: (val) {
                  setState(() => _isMuted = val);
                  _updateEstimatedSize();
                },
                onConvert: _convertVideo,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
