// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:io';

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit_config.dart';
import 'package:ffmpeg_kit_flutter_new/return_code.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../l10n/app_localizations.dart';
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

class _ConversionScreenState extends State<ConversionScreen> {
  double _progress = 0.0;
  bool _isDone = false;
  bool _isCancelled = false;
  late String _currentOutputPath;

  @override
  void initState() {
    super.initState();
    _currentOutputPath = widget.outputPath;
    _cleanCache();
    _startConversion();
  }

  @override
  void dispose() {
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
  // Konvertierung
  // ---------------------------------------------------------------------------

  void _startConversion() {
    FFmpegKitConfig.enableStatisticsCallback((stats) {
      final p = (stats.getTime() / widget.totalDurationMs).clamp(0.0, 1.0);
      if (mounted) setState(() => _progress = p);
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
      } else if (_isCancelled || ReturnCode.isCancel(rc)) {
        await _deleteOutput();
        if (mounted) Navigator.pop(context);
      } else {
        await _deleteOutput();
        final log = await session.getFailStackTrace();
        if (mounted) {
          final l = AppLocalizations.of(context)!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l.conversionFailed(log ?? '')),
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
      await _deleteOutput();
      if (mounted) Navigator.pop(context);
    }
  }

  Future<void> _onSavePressed() async {
    final l = AppLocalizations.of(context)!;
    try {
      final fileSize = await File(_currentOutputPath).length();
      final fileSizeMb = fileSize / (1024 * 1024);

      // Dateiendung bestimmt ob Audio- oder Video-Ordner vorgeschlagen wird
      const audioExtensions = {'mp3', 'm4a', 'opus', 'aac', 'ogg'};
      final ext = widget.defaultFileName.split('.').last.toLowerCase();
      final fileType = audioExtensions.contains(ext) ? FileType.audio : FileType.video;

      if (fileSizeMb < 500) {
        // Kleine Datei: in RAM laden und via FilePicker in den Gerätespeicher speichern
        final bytes = await File(_currentOutputPath).readAsBytes();
        final savedPath = await FilePicker.platform.saveFile(
          bytes: bytes,
          fileName: widget.defaultFileName,
          type: fileType,
        );
        if (savedPath == null) return; // User hat abgebrochen

        final cacheFilePath = _currentOutputPath;
        if (!mounted) return;
        final messenger = ScaffoldMessenger.of(context);
        Navigator.pop(context);
        messenger.showSnackBar(
          SnackBar(
            content: Text(l.savedSuccess),
            action: SnackBarAction(
              label: l.open,
              onPressed: () => OpenFilex.open(cacheFilePath, type: 'video/*'),
            ),
            duration: const Duration(seconds: 20),
          ),
        );
      } else {
        // Große Datei (≥ 500 MB): nur Pfad übergeben, kein RAM-Laden
        // Datei einmalig in lesbaren Namen umbenennen (idempotent bei Retry)
        final dir = await ConversionScreen.getCacheDir();
        final nicePath = '${dir.path}/${widget.defaultFileName}';
        if (_currentOutputPath != nicePath) {
          final renamed = await File(_currentOutputPath).rename(nicePath);
          setState(() => _currentOutputPath = renamed.path);
        }

        final result = await Share.shareXFiles(
          [XFile(_currentOutputPath)],
          subject: widget.defaultFileName,
        );

        if (result.status == ShareResultStatus.dismissed) return;

        final cacheFilePath = _currentOutputPath;
        if (!mounted) return;
        final messenger = ScaffoldMessenger.of(context);
        Navigator.pop(context);
        messenger.showSnackBar(
          SnackBar(
            content: Text(l.savedSuccess),
            action: SnackBarAction(
              label: l.open,
              onPressed: () => OpenFilex.open(cacheFilePath, type: 'video/*'),
            ),
            duration: const Duration(seconds: 20),
          ),
        );
      }
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
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          if (_isDone) {
            _onDiscardPressed();
          } else {
            _onCancelPressed();
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Native Ad
              const Expanded(
                flex: 2,
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
                  ],
                ),
              ),

              // Buttons
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                child: Builder(builder: (context) {
                    final l = AppLocalizations.of(context)!;
                    return _isDone
                        ? Row(
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
                          )
                        : OutlinedButton(
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
