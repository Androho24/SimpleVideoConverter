// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit_config.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:gal/gal.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import '../l10n/app_localizations.dart';
import '../services/conversion_service_manager.dart';
import '../services/gallery_service.dart';
import '../services/preferences_service.dart';
import '../services/review_service.dart';
import '../widgets/native_ad_widget.dart';

class ConversionScreen extends StatefulWidget {
  final String command;
  final String outputPath;
  final double totalDurationMs;
  final String defaultFileName;

  const ConversionScreen({
    super.key,
    required this.command,
    required this.outputPath,
    required this.totalDurationMs,
    required this.defaultFileName,
  });

  static Future<Directory> getCacheDir() async {
    final tmpDir = await getTemporaryDirectory();
    final dir = Directory('${tmpDir.path}/conversions');
    if (!dir.existsSync()) await dir.create();
    return dir;
  }

  /// Löscht und recreiert den conversions/-Ordner. Aufrufbar von außen (z.B. App-Start).
  static Future<void> cleanCacheDir() async {
    try {
      final dir = await getCacheDir();
      await dir.delete(recursive: true);
      await dir.create();
    } catch (_) {}
  }

  @override
  State<ConversionScreen> createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> with WidgetsBindingObserver {
  double _progress = 0.0;
  double _speed = 0.0;    // Encoding-Geschwindigkeit (z.B. 1.8 = 1.8× Echtzeit)
  int _outputSizeBytes = 0;
  bool _isDone = false;
  bool _isCancelled = false;
  bool _isSaved = false;
  late String _currentOutputPath;

  static const _audioExtensions = {'mp3', 'm4a', 'opus', 'aac', 'ogg'};

  bool get _isAudioOutput {
    final ext = widget.defaultFileName.split('.').last.toLowerCase();
    return _audioExtensions.contains(ext);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _currentOutputPath = widget.outputPath;
    _init();
  }

  Future<void> _init() async {
    await _cleanCache();
    _startConversion();
    _maybeShowNotificationDeniedHint();
  }

  Future<void> _maybeShowNotificationDeniedHint() async {
    if (!Platform.isAndroid) return;
    final count = await PreferencesService.getNotificationDeniedHintCount();
    if (count >= 3) return;
    if (!(await Permission.notification.status).isPermanentlyDenied) return;
    await PreferencesService.incrementNotificationDeniedHintCount();
    if (!mounted) return;
    final l = AppLocalizations.of(context)!;
    final controller = ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(l.notificationPermissionDenied),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: l.notificationPermissionOpenSettings,
        onPressed: openAppSettings,
      ),
    ));
    Future.delayed(const Duration(seconds: 3), controller.close);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    FFmpegKitConfig.enableStatisticsCallback(null);
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Cache-Verwaltung
  // ---------------------------------------------------------------------------

  Future<void> _cleanCache() => ConversionScreen.cleanCacheDir();

  Future<void> _deleteOutput() async {
    try {
      await File(_currentOutputPath).delete();
    } catch (_) {}
  }

  // ---------------------------------------------------------------------------
  // Stats-Anzeige
  // ---------------------------------------------------------------------------

  String _buildStatsLine() {
    final parts = <String>[];

    // Geschwindigkeit
    if (_speed > 0) parts.add('${_speed.toStringAsFixed(1)}×');

    // Verbleibende Zeit
    if (_speed > 0 && _progress > 0 && _progress < 1.0) {
      final remainingMs = widget.totalDurationMs * (1.0 - _progress);
      final remainingSec = (remainingMs / 1000 / _speed).round();
      if (remainingSec >= 5) {
        if (remainingSec < 60) {
          parts.add('~${remainingSec}s');
        } else {
          final min = remainingSec ~/ 60;
          final sec = remainingSec % 60;
          parts.add(sec > 0 ? '~${min}m ${sec}s' : '~${min}m');
        }
      }
    }

    // Ausgabegröße
    if (_outputSizeBytes > 0) {
      if (_outputSizeBytes < 1024 * 1024) {
        parts.add('${(_outputSizeBytes / 1024).toStringAsFixed(0)} KB');
      } else {
        parts.add('${(_outputSizeBytes / (1024 * 1024)).toStringAsFixed(1)} MB');
      }
    }

    return parts.join(' · ');
  }

  // ---------------------------------------------------------------------------
  // Konvertierung
  // ---------------------------------------------------------------------------

  void _startConversion() {
    unawaited(ConversionServiceManager.startService(widget.defaultFileName));

    FFmpegKitConfig.enableStatisticsCallback((stats) {
      final p = (stats.getTime() / widget.totalDurationMs).clamp(0.0, 1.0);
      if (mounted) {
        setState(() {
          _progress = p;
          _speed = stats.getSpeed();
          _outputSizeBytes = stats.getSize();
        });
      }
      unawaited(ConversionServiceManager.updateProgress(
        (p * 100).round(),
        _buildStatsLine(),
      ));
    });

    FFmpegKit.executeAsync(widget.command, (session) async {
      FFmpegKitConfig.enableStatisticsCallback(null);
      final rc = await session.getReturnCode();
      if (!mounted) return;

      if (ReturnCode.isSuccess(rc)) {
        setState(() {
          _isDone = true;
          _progress = 1.0;
        });
        final isBackground =
            WidgetsBinding.instance.lifecycleState != AppLifecycleState.resumed;
        if (isBackground) {
          await ConversionServiceManager.showCompletion(widget.defaultFileName);
        } else {
          await ConversionServiceManager.stopService();
        }
        unawaited(ReviewService.maybeRequestReview());

        // Auto-Save: nur Videos. Bei Fehler fällt der User auf den manuellen
        // Save-Button zurück (saveError-SnackBar wird in _saveVideoToGallery gezeigt).
        if (!_isAudioOutput && await PreferencesService.getAutoSaveVideos()) {
          if (!mounted) return;
          await _saveVideoToGallery();
        }
      } else if (_isCancelled || ReturnCode.isCancel(rc)) {
        await ConversionServiceManager.stopService();
        await _deleteOutput();
        if (mounted) Navigator.pop(context);
      } else {
        await ConversionServiceManager.stopService();
        await _deleteOutput();
        final log = await session.getLogsAsString();
        unawaited(FirebaseCrashlytics.instance.recordError(
          Exception('FFmpeg conversion failed'),
          null,
          reason: log,
        ));
        if (mounted) {
          final l = AppLocalizations.of(context)!;
          final shortLog = log.substring(0, min(300, log.length));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l.conversionFailed(shortLog)),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.pop(context);
        }
      }
    });
  }

  // ---------------------------------------------------------------------------
  // Button-Aktionen
  // ---------------------------------------------------------------------------

  Future<void> _onCancelPressed() async {
    final l = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.cancelConversionTitle),
        content: Text(l.cancelConversionContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l.continueConversion),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l.cancel),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      _isCancelled = true;
      await FFmpegKit.cancel();
      // Navigator.pop kommt vom Completion-Callback
    }
  }

  Future<void> _onDiscardPressed() async {
    final l = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.discardVideoTitle),
        content: Text(l.discardVideoContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l.keep),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l.discard),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ConversionServiceManager.stopService();
      await _deleteOutput();
      if (mounted) Navigator.pop(context);
    }
  }

  Future<void> _onSavePressed() async {
    if (_isAudioOutput) {
      await _saveAudioViaFilePicker();
    } else {
      await _saveVideoToGallery();
    }
  }

  /// Video direkt in die Galerie (MediaStore). Bei Erfolg bleibt der Screen
  /// offen und zeigt die Open-Folder/Open-Video-Buttons (_isSaved=true).
  Future<void> _saveVideoToGallery() async {
    final l = AppLocalizations.of(context)!;
    try {
      await Gal.putVideo(_currentOutputPath, album: 'Video Converter');
      if (!mounted) return;
      await ConversionServiceManager.stopService();
      if (!mounted) return;
      setState(() => _isSaved = true);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l.saveError),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  /// Audio: Bytes in RAM laden und via FilePicker in Ordner nach Wahl speichern.
  /// Bisheriger Flow inkl. SnackBar mit "Öffnen" und Navigator.pop —
  /// "Galerie öffnen" macht für Audio keinen Sinn.
  Future<void> _saveAudioViaFilePicker() async {
    final l = AppLocalizations.of(context)!;
    try {
      final cacheFilePath = _currentOutputPath;
      final Uint8List bytes;
      try {
        bytes = await File(_currentOutputPath).readAsBytes();
      } on OutOfMemoryError {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(l.saveErrorOutOfMemory),
            backgroundColor: Colors.red,
          ));
        }
        return;
      }
      final savedPath = await FilePicker.platform.saveFile(
        bytes: bytes,
        fileName: widget.defaultFileName,
        type: FileType.audio,
      );
      if (savedPath == null) return; // User hat abgebrochen

      if (!mounted) return;
      await ConversionServiceManager.stopService();
      if (!mounted) return;
      final messenger = ScaffoldMessenger.of(context);
      Navigator.pop(context);
      messenger.showSnackBar(
        SnackBar(
          content: Text(l.savedSuccess),
          action: SnackBarAction(
            label: l.open,
            onPressed: () async {
              try {
                await OpenFilex.open(cacheFilePath, type: 'audio/*');
              } catch (_) {}
            },
          ),
          duration: const Duration(seconds: 20),
        ),
      );
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l.saveError),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // ---------------------------------------------------------------------------
  // UI
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _isSaved,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_isDone) {
          _onDiscardPressed();
        } else {
          _onCancelPressed();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Native Ad — kompakter als zuvor (flex 1 statt 2), damit
              // die zwei Open-Buttons nach dem Speichern Platz haben.
              const Expanded(
                flex: 1,
                child: NativeAdWidget(),
              ),

              // Fortschritt
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  children: [
                    Builder(builder: (context) {
                      final l = AppLocalizations.of(context)!;
                      return Text(
                        _isDone
                            ? l.conversionDone
                            : l.conversionProgress((_progress * 100).toStringAsFixed(0)),
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      );
                    }),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(value: _progress),
                    // Stats-Zeile: nur bei Videos > 30s und sobald Speed-Daten vorliegen
                    if (!_isDone &&
                        widget.totalDurationMs > 30000 &&
                        _speed > 0) ...[
                      const SizedBox(height: 8),
                      Text(
                        _buildStatsLine(),
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),

              // Buttons
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                child: Builder(builder: (context) {
                    final l = AppLocalizations.of(context)!;
                    if (_isSaved) {
                      return Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              icon: const Icon(Icons.photo_library_outlined),
                              label: Text(l.openGallery),
                              onPressed: () async {
                                try {
                                  await Gal.open();
                                } catch (_) {}
                              },
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.play_circle_outline),
                              label: Text(l.openVideo),
                              onPressed: () async {
                                // Erst MediaStore-URI per ACTION_VIEW —
                                // System-Galerie zeigt das Video mit Album-Context
                                // (Back-Press landet im "Video Converter"-Album).
                                // Fallback: Cache-Datei direkt im Player öffnen.
                                final fileName = _currentOutputPath.split('/').last;
                                final ok = await GalleryService.viewSavedVideo(fileName);
                                if (ok) return;
                                try {
                                  await OpenFilex.open(_currentOutputPath, type: 'video/*');
                                } catch (_) {}
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.primary,
                                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    if (_isDone) {
                      return Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: _onDiscardPressed,
                              child: Text(l.discard),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.share),
                              label: Text(l.save),
                              onPressed: _onSavePressed,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.primary,
                                foregroundColor: Theme.of(context).colorScheme.onPrimary,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return OutlinedButton(
                      onPressed: _onCancelPressed,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.error,
                        side: BorderSide(color: Theme.of(context).colorScheme.error),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(l.cancel),
                    );
                  }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
