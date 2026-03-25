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

  @override
  State<ConversionScreen> createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  double _progress = 0.0;
  bool _isDone = false;
  bool _isCancelled = false;

  @override
  void initState() {
    super.initState();
    _cleanCache();
    _startConversion();
  }

  @override
  void dispose() {
    FFmpegKitConfig.enableStatisticsCallback(null);
    super.dispose();
  }

  static String _mimeType(String path) {
    return switch (path.split('.').last.toLowerCase()) {
      'mkv' => 'video/x-matroska',
      'mov' => 'video/quicktime',
      'avi' => 'video/x-msvideo',
      'ts'  => 'video/mp2t',
      _     => 'video/mp4',
    };
  }

  // ---------------------------------------------------------------------------
  // Cache-Verwaltung
  // ---------------------------------------------------------------------------

  Future<void> _cleanCache() async {
    try {
      final dir = await ConversionScreen.getCacheDir();
      await dir.delete(recursive: true);
      await dir.create();
    } catch (_) {}
  }

  Future<void> _deleteOutput() async {
    try {
      await File(widget.outputPath).delete();
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
      final bytes = await File(widget.outputPath).readAsBytes();

      String? moviesDir;
      try {
        final dirs = await getExternalStorageDirectories(type: StorageDirectory.movies);
        if (dirs != null && dirs.isNotEmpty) moviesDir = dirs.first.path;
      } catch (_) {}

      final savedPath = await FilePicker.platform.saveFile(
        dialogTitle: l.saveVideoDialogTitle,
        fileName: widget.defaultFileName,
        initialDirectory: moviesDir,
        bytes: bytes,
      );

      if (savedPath != null) {
        await _deleteOutput();
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l.savedSuccess),
            action: SnackBarAction(
              label: l.open,
              onPressed: () => OpenFilex.open(savedPath, type: _mimeType(savedPath)),
            ),
            duration: const Duration(seconds: 20),
          ),
        );
        Navigator.pop(context);
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
                                  icon: const Icon(Icons.save),
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
