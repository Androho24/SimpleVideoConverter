// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:io';

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit_config.dart';
import 'package:ffmpeg_kit_flutter_new/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

// ---------------------------------------------------------------------------
// Datenklassen
// ---------------------------------------------------------------------------

class VideoMetadata {
  final int durationMs;
  final int width;
  final int height;

  const VideoMetadata({
    required this.durationMs,
    required this.width,
    required this.height,
  });
}

class QualityOption {
  final String name;
  final int maxDimension; // 0 = Original
  final int crf; // libx264 CRF-Wert (18=sehr gut, 23=gut, 27=niedrig, 32=sehr niedrig)
  final int estimatedBitrateBps; // Nur für Größenschätzung

  const QualityOption(this.name, this.maxDimension, this.crf, this.estimatedBitrateBps);
}

// ---------------------------------------------------------------------------
// Qualitäts-Presets (identisch zur Kotlin-App)
// ---------------------------------------------------------------------------

const List<QualityOption> qualityOptions = [
  QualityOption('Original Auflösung (Bester Text!)', 0,   18, 8000000),
  QualityOption('Original Auflösung (Medium)',       0,   23, 5000000),
  QualityOption('1080p High',     1080, 18, 8000000),
  QualityOption('1080p Medium',   1080, 23, 4000000),
  QualityOption('1080p Low',      1080, 27, 2000000),
  QualityOption('1080p Very Low', 1080, 32, 1000000),
  QualityOption('720p High',       720, 18, 4000000),
  QualityOption('720p Medium',     720, 23, 2000000),
  QualityOption('720p Low',        720, 27, 1000000),
  QualityOption('720p Very Low',   720, 32,  500000),
  QualityOption('480p High',       480, 18, 2000000),
  QualityOption('480p Medium',     480, 23, 1000000),
  QualityOption('480p Low',        480, 27,  500000),
  QualityOption('480p Very Low',   480, 32,  250000),
  QualityOption('360p High',       360, 18, 1000000),
  QualityOption('360p Medium',     360, 23,  500000),
  QualityOption('360p Low',        360, 27,  250000),
  QualityOption('360p Very Low',   360, 32,  125000),
];

// ---------------------------------------------------------------------------
// Einstiegspunkt
// ---------------------------------------------------------------------------

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Video Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const VideoConverterApp(),
    );
  }
}

// ---------------------------------------------------------------------------
// Haupt-Widget
// ---------------------------------------------------------------------------

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

    // Metadaten extrahieren
    final meta = await _extractMetadata(path);

    // Validierung: kein gültiges Video (keine Dimension oder Dauer)
    if (meta.durationMs == 0 || meta.width == 0 || meta.height == 0) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Bitte eine gültige Videodatei auswählen.'),
          backgroundColor: Colors.red,
        ));
      }
      return;
    }

    // Alten Controller freigeben
    await _playerController?.dispose();

    // Neuen VideoPlayerController erstellen
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

    // Ersten Video-Stream suchen
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

  /// Berechnet Ausgabe-Dimensionen (identische Logik wie Kotlin-Original).
  /// Rundet auf gerade Zahlen (Pflicht für libx264).
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

  String _formatDuration(double fraction) {
    if (_metadata == null) return '0:00';
    final ms = (fraction * _metadata!.durationMs).toInt();
    final seconds = ms ~/ 1000;
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '$minutes:${secs.toString().padLeft(2, '0')}';
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

    // Eingabepfad mit Anführungszeichen für Pfade mit Leerzeichen
    final inputArg = '"$_videoPath"';
    final outputArg = '"$outputPath"';

    final command =
        '-i $inputArg -ss $startSec -to $endSec $vfFilter '
        '-c:v libx264 -crf ${quality.crf} -r 60 $audioOpt -y $outputArg';

    // Fortschritts-Callback registrieren
    FFmpegKitConfig.enableStatisticsCallback((stats) {
      final p = (stats.getTime() / totalDurationMs).clamp(0.0, 1.0);
      if (mounted) setState(() => _progress = p);
    });

    // Asynchrone Konvertierung starten
    FFmpegKit.executeAsync(command, (session) async {
      // Callback deregistrieren
      FFmpegKitConfig.enableStatisticsCallback(null);

      final rc = await session.getReturnCode();
      if (!mounted) return;

      if (ReturnCode.isSuccess(rc)) {
        setState(() {
          _isConverting = false;
          _progress = 1.0;
        });

        // Dateinamen ableiten: Original + "_konvertiert.mp4"
        final originalName = _videoPath!.split('/').last;
        final baseName = originalName.contains('.')
            ? originalName.substring(0, originalName.lastIndexOf('.'))
            : originalName;
        final defaultFileName = '${baseName}_konvertiert.mp4';

        // Videos-Ordner als Startverzeichnis ermitteln
        String? moviesDir;
        try {
          final dirs = await getExternalStorageDirectories(type: StorageDirectory.movies);
          if (dirs != null && dirs.isNotEmpty) moviesDir = dirs.first.path;
        } catch (_) {}

        // Bytes lesen + nativen Speichern-Dialog öffnen
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
              duration: const Duration(seconds: 5),
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
            // Button: Video auswählen
            ElevatedButton.icon(
              icon: const Icon(Icons.video_library),
              label: const Text('Video auswählen'),
              onPressed: _isConverting ? null : _pickVideo,
            ),

            if (hasVideo) ...[
              const SizedBox(height: 16),

              // Video-Vorschau
              AspectRatio(
                aspectRatio: _playerController!.value.aspectRatio,
                child: VideoPlayer(_playerController!),
              ),
              const SizedBox(height: 4),

              // Play/Pause Steuerung
              Center(
                child: IconButton(
                  icon: Icon(
                    _playerController!.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                  onPressed: () {
                    setState(() {
                      _playerController!.value.isPlaying
                          ? _playerController!.pause()
                          : _playerController!.play();
                    });
                  },
                ),
              ),
              const SizedBox(height: 8),

              // Trim-Slider
              Text(
                'Trim-Bereich',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              RangeSlider(
                values: RangeValues(_trimStart, _trimEnd),
                min: 0.0,
                max: 1.0,
                onChanged: _isConverting
                    ? null
                    : (values) {
                        setState(() {
                          _trimStart = values.start;
                          _trimEnd = values.end;
                        });
                        _playerController?.seekTo(Duration(
                          milliseconds:
                              (values.start * _metadata!.durationMs).toInt(),
                        ));
                        _updateEstimatedSize();
                      },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Anfang: ${_formatDuration(_trimStart)}'),
                  Text('Ende: ${_formatDuration(_trimEnd)}'),
                ],
              ),
              const SizedBox(height: 16),

              // Qualitäts-Dropdown
              DropdownButtonFormField<int>(
                value: _selectedQualityIndex,
                decoration: const InputDecoration(
                  labelText: 'Qualität',
                  border: OutlineInputBorder(),
                ),
                items: qualityOptions.asMap().entries.map((entry) {
                  return DropdownMenuItem<int>(
                    value: entry.key,
                    child: Text(
                      entry.value.name,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }).toList(),
                onChanged: _isConverting
                    ? null
                    : (val) {
                        if (val != null) {
                          setState(() => _selectedQualityIndex = val);
                          _updateEstimatedSize();
                        }
                      },
              ),
              const SizedBox(height: 8),

              // Stummschalten
              SwitchListTile(
                title: const Text('Stummschalten'),
                value: _isMuted,
                onChanged: _isConverting
                    ? null
                    : (val) {
                        setState(() => _isMuted = val);
                        _updateEstimatedSize();
                      },
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 4),

              // Geschätzte Größe
              Text(
                'Geschätzte Größe: ${_estimatedSizeMb.toStringAsFixed(1)} MB',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),

              // Fortschritt oder Konvertieren-Button
              if (_isConverting) ...[
                Text(
                  'Konvertierung: ${(_progress * 100).toStringAsFixed(0)}%',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(value: _progress),
              ] else
                ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text('Speichern & Konvertieren'),
                  onPressed: _convertVideo,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
