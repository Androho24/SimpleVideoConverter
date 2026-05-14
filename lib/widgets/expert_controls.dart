// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../l10n/app_localizations.dart';
import '../models/expert_settings.dart';
import '../models/video_metadata.dart';

/// Maximale Auflösung pro Seite (4K).
const _maxDimension = 3840;

/// Welche Audio-Codecs in welchem Container funktionieren.
const _containerCodecs = <String, List<String>>{
  'mp4': ['aac', 'ac3'],
  'mkv': ['aac', 'mp3', 'opus', 'ac3'],
  'mov': ['aac', 'ac3'],
  'avi': ['mp3'],
  'ts':  ['aac', 'opus', 'ac3'],
};

/// Verfügbare Ziel-Bitraten (kbps) für den Bitrate-Modus (als Schnellauswahl).
const _targetBitrateOptions = [500, 1000, 2000, 4000, 6000, 8000, 12000, 20000];

class ExpertControls extends StatefulWidget {
  final ExpertSettings settings;
  final bool isConverting;
  final VideoMetadata? metadata;
  final ValueChanged<ExpertSettings> onChanged;

  const ExpertControls({
    super.key,
    required this.settings,
    required this.isConverting,
    required this.onChanged,
    this.metadata,
  });

  @override
  State<ExpertControls> createState() => _ExpertControlsState();
}

class _ExpertControlsState extends State<ExpertControls> {
  late final TextEditingController _widthController;
  late final TextEditingController _heightController;
  late final TextEditingController _targetBitrateController;
  late final FocusNode _targetBitrateFocus;
  bool _aspectLocked = true;

  @override
  void initState() {
    super.initState();
    // Bevorzuge explizit gesetzte Werte aus settings; falle auf Metadaten zurück
    // (z.B. beim Wechsel Normal → Expert mit bereits geladenem Video)
    final initWidth = widget.settings.width != 0
        ? widget.settings.width
        : (widget.metadata?.width ?? 0);
    final initHeight = widget.settings.height != 0
        ? widget.settings.height
        : (widget.metadata?.height ?? 0);
    _widthController = TextEditingController(
      text: initWidth == 0 ? '' : initWidth.toString(),
    );
    _heightController = TextEditingController(
      text: initHeight == 0 ? '' : initHeight.toString(),
    );
    _targetBitrateController = TextEditingController(
      text: _targetBitrateLabel(widget.settings.targetBitrateKbps),
    );
    _targetBitrateFocus = FocusNode()
      ..addListener(_onTargetBitrateFocusChange);
    // ExpertSettings im Parent synchronisieren, falls Metadaten verwendet wurden
    if (widget.settings.width == 0 && widget.settings.height == 0 &&
        widget.metadata != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          widget.onChanged(widget.settings.copyWith(
            width: initWidth,
            height: initHeight,
          ));
        }
      });
    }
  }

  @override
  void didUpdateWidget(ExpertControls oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.settings.targetBitrateKbps != oldWidget.settings.targetBitrateKbps &&
        !_targetBitrateFocus.hasFocus) {
      _targetBitrateController.text =
          _targetBitrateLabel(widget.settings.targetBitrateKbps);
    }
    if (widget.metadata != oldWidget.metadata && widget.metadata != null) {
      _widthController.text = widget.metadata!.width.toString();
      _heightController.text = widget.metadata!.height.toString();
      setState(() => _aspectLocked = true);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        var updated = widget.settings.copyWith(
          width: widget.metadata!.width,
          height: widget.metadata!.height,
        );
        // AC3 zurücksetzen wenn neues Video kein Surround hat
        if (updated.audioCodec == 'ac3' &&
            (widget.metadata?.audioChannels ?? 0) < 3) {
          updated = updated.copyWith(audioCodec: 'aac', audioBitrate: 128);
        }
        // Kanal-Auswahl zurücksetzen wenn nicht mehr mit Quelle kompatibel
        final srcCh = widget.metadata?.audioChannels ?? 0;
        if ((updated.audioChannels == 6 && srcCh < 6) ||
            (updated.audioChannels == 2 && srcCh == 1)) {
          updated = updated.copyWith(audioChannels: 0);
        }
        widget.onChanged(updated);
      });
    }
  }

  @override
  void dispose() {
    _widthController.dispose();
    _heightController.dispose();
    _targetBitrateController.dispose();
    _targetBitrateFocus.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Auflösungs-Hilfsmethoden
  // ---------------------------------------------------------------------------

  void _onWidthChanged(String v) {
    int newWidth = int.tryParse(v) ?? 0;
    if (newWidth > _maxDimension) {
      newWidth = _maxDimension;
      _widthController.text = _maxDimension.toString();
      _widthController.selection = TextSelection.collapsed(offset: _widthController.text.length);
    }
    final s = widget.settings;
    final meta = widget.metadata;
    if (_aspectLocked && newWidth > 0 && meta != null && meta.height > 0) {
      final aspectRatio = meta.width / meta.height;
      int newHeight = (newWidth / aspectRatio).round();
      newHeight = ((newHeight ~/ 2) * 2).clamp(2, _maxDimension);
      _heightController.text = newHeight.toString();
      widget.onChanged(s.copyWith(width: newWidth, height: newHeight));
    } else {
      widget.onChanged(s.copyWith(width: newWidth));
    }
  }

  void _onHeightChanged(String v) {
    int newHeight = int.tryParse(v) ?? 0;
    if (newHeight > _maxDimension) {
      newHeight = _maxDimension;
      _heightController.text = _maxDimension.toString();
      _heightController.selection = TextSelection.collapsed(offset: _heightController.text.length);
    }
    final s = widget.settings;
    final meta = widget.metadata;
    if (_aspectLocked && newHeight > 0 && meta != null && meta.width > 0) {
      final aspectRatio = meta.width / meta.height;
      int newWidth = (newHeight * aspectRatio).round();
      newWidth = ((newWidth ~/ 2) * 2).clamp(2, _maxDimension);
      _widthController.text = newWidth.toString();
      widget.onChanged(s.copyWith(width: newWidth, height: newHeight));
    } else {
      widget.onChanged(s.copyWith(height: newHeight));
    }
  }

  void _toggleAspectLock() {
    final meta = widget.metadata;
    if (!_aspectLocked && meta != null) {
      // Sperren: dominante Seite des Originalvideos bestimmt welcher Wert berechnet wird
      final currentWidth = int.tryParse(_widthController.text) ?? 0;
      final currentHeight = int.tryParse(_heightController.text) ?? 0;
      if (currentWidth > 0 || currentHeight > 0) {
        if (meta.width >= meta.height) {
          // Querformat: Breite dominant → Höhe neu berechnen
          _onWidthChanged(currentWidth > 0 ? currentWidth.toString() : meta.width.toString());
        } else {
          // Hochformat: Höhe dominant → Breite neu berechnen
          _onHeightChanged(currentHeight > 0 ? currentHeight.toString() : meta.height.toString());
        }
      }
    }
    setState(() => _aspectLocked = !_aspectLocked);
  }

  Widget _buildLockButton(AppLocalizations l) {
    final meta = widget.metadata;
    return SizedBox(
      width: 40,
      child: IconButton(
        icon: Icon(
          _aspectLocked ? Icons.link : Icons.link_off,
          size: 20,
        ),
        onPressed: (meta != null && !widget.isConverting) ? _toggleAspectLock : null,
        tooltip: _aspectLocked ? l.aspectLocked : l.aspectUnlocked,
        padding: EdgeInsets.zero,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Hilfsmethoden
  // ---------------------------------------------------------------------------

  /// Gibt die sinnvollen Bitrate-Einträge für den gewählten Codec zurück.
  List<DropdownMenuEntry<int>> _bitrateEntries(String codec, AppLocalizations l) {
    if (codec == 'ac3') {
      return [
        DropdownMenuEntry(value: 0, label: l.silent),
        for (final b in [192, 256, 320, 384, 448, 640])
          DropdownMenuEntry(value: b, label: '$b kbps'),
      ];
    }
    final maxBitrate = codec == 'opus' ? 192 : 320;
    return [
      DropdownMenuEntry(value: 0, label: l.silent),
      for (final b in [64, 96, 128, 192, 320])
        if (b <= maxBitrate) DropdownMenuEntry(value: b, label: '$b kbps'),
    ];
  }

  List<ButtonSegment<int>> _channelSegments(ExpertSettings s, AppLocalizations l) {
    final srcCh = widget.metadata?.audioChannels ?? 0;
    return [
      ButtonSegment(value: 0, label: Text(l.audioChannelOriginal)),
      if (srcCh >= 6 && s.audioCodec != 'mp3')
        const ButtonSegment(value: 6, label: Text('5.1')),
      if (srcCh != 1)
        const ButtonSegment(value: 2, label: Text('Stereo')),
      const ButtonSegment(value: 1, label: Text('Mono')),
    ];
  }

  /// Gibt einen lesbaren Label für eine Ziel-Bitrate in kbps zurück.
  String _targetBitrateLabel(int kbps) {
    if (kbps < 1000) return '$kbps kbps';
    final mbps = kbps / 1000;
    return mbps == mbps.truncateToDouble() ? '${mbps.toInt()} Mbps' : '$mbps Mbps';
  }

  /// Parst manuell eingetippte Bitrate — unterstützt "8000", "8000 kbps", "8 Mbps", "0.5 Mbps".
  int? _parseTargetBitrate(String text) {
    final t = text.trim().toLowerCase().replaceAll(',', '.');
    final mMatch = RegExp(r'^(\d+(?:\.\d+)?)\s*mbps?$').firstMatch(t);
    if (mMatch != null) {
      final val = double.tryParse(mMatch.group(1)!);
      if (val != null) return (val * 1000).round();
    }
    final kMatch = RegExp(r'^(\d+)\s*(?:kbps?)?$').firstMatch(t);
    if (kMatch != null) return int.tryParse(kMatch.group(1)!);
    return null;
  }

  void _onTargetBitrateFocusChange() {
    if (_targetBitrateFocus.hasFocus) return;
    final parsed = _parseTargetBitrate(_targetBitrateController.text);
    final clamped = (parsed ?? widget.settings.targetBitrateKbps).clamp(500, 40000);
    if (clamped != widget.settings.targetBitrateKbps) {
      widget.onChanged(widget.settings.copyWith(targetBitrateKbps: clamped));
    }
    _targetBitrateController.text = _targetBitrateLabel(clamped);
  }

  // ---------------------------------------------------------------------------
  // Info-Dialoge
  // ---------------------------------------------------------------------------

  void _showInfo(BuildContext context, String title, String content) {
    final l = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l.ok),
          ),
        ],
      ),
    );
  }

  Widget _infoButton(BuildContext context, String title, String content) =>
      IconButton(
        icon: Icon(Icons.info_outline, size: 16,
            color: Theme.of(context).colorScheme.outline),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        tooltip: title,
        onPressed: () => _showInfo(context, title, content),
      );

  // ---------------------------------------------------------------------------
  // UI
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final s = widget.settings;
    final theme = Theme.of(context);
    final labelStyle = theme.textTheme.labelMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        // ── CRF / Bitrate-Toggle, Auflösung, FPS — nur im Video-Modus ──────
        if (!s.audioOnly) ...[
          // ── Encoding-Modus-Toggle ────────────────────────────────────────
          Text(l.encodingModeLabel, style: labelStyle),
          const SizedBox(height: 4),
          SegmentedButton<String>(
            showSelectedIcon: false,
            segments: [
              ButtonSegment(value: 'crf',     label: Text(l.encodingModeCrf)),
              ButtonSegment(value: 'bitrate', label: Text(l.encodingModeBitrate)),
            ],
            selected: {s.bitrateMode},
            onSelectionChanged: widget.isConverting
                ? null
                : (sel) => widget.onChanged(s.copyWith(bitrateMode: sel.first)),
          ),
          const SizedBox(height: 12),

          // ── CRF-Dropdown (nur bei CRF-Modus) ────────────────────────────
          if (s.bitrateMode == 'crf') ...[
            Row(children: [
              Expanded(
                child: DropdownMenu<int>(
                  key: ValueKey(s.crf),
                  expandedInsets: EdgeInsets.zero,
                  enabled: !widget.isConverting,
                  menuHeight: 400,
                  initialSelection: s.crf,
                  label: Text(l.crfLabel),
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  menuStyle: MenuStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  dropdownMenuEntries: [
                    for (int i = 1; i <= 51; i++)
                      DropdownMenuEntry(value: i, label: '$i'),
                  ],
                  onSelected: (v) {
                    if (v != null) widget.onChanged(s.copyWith(crf: v));
                  },
                ),
              ),
              const SizedBox(width: 4),
              _infoButton(context, l.crfInfoTitle, l.crfInfoContent),
            ]),
            const SizedBox(height: 12),
          ],

          // ── Ziel-Bitrate-Dropdown (nur bei Bitrate-Modus) ───────────────
          if (s.bitrateMode == 'bitrate') ...[
            Row(children: [
              Expanded(
                child: DropdownMenu<int>(
                  expandedInsets: EdgeInsets.zero,
                  enabled: !widget.isConverting,
                  controller: _targetBitrateController,
                  focusNode: _targetBitrateFocus,
                  label: Text(l.targetBitrateLabel),
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  menuStyle: MenuStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  dropdownMenuEntries: [
                    for (final kbps in _targetBitrateOptions)
                      DropdownMenuEntry(
                          value: kbps, label: _targetBitrateLabel(kbps)),
                  ],
                  onSelected: (v) {
                    if (v != null) {
                      widget.onChanged(s.copyWith(targetBitrateKbps: v));
                    }
                  },
                ),
              ),
              const SizedBox(width: 4),
              _infoButton(
                  context, l.targetBitrateInfoTitle, l.targetBitrateInfoContent),
            ]),
            const SizedBox(height: 12),
          ],

          // ── Auflösung ───────────────────────────────────────────────────────
          Row(children: [
            Text(l.resolutionLabel, style: labelStyle),
            const SizedBox(width: 2),
            _infoButton(context, l.resolutionInfoTitle, l.resolutionInfoContent),
          ]),
          const SizedBox(height: 4),
          Row(children: [
            Expanded(
              child: TextField(
                enabled: !widget.isConverting,
                controller: _widthController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: l.widthLabel,
                  hintText: l.emptyEqualsOriginal,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  suffixText: 'px',
                ),
                onChanged: _onWidthChanged,
              ),
            ),
            _buildLockButton(l),
            Expanded(
              child: TextField(
                enabled: !widget.isConverting,
                controller: _heightController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: l.heightLabel,
                  hintText: l.emptyEqualsOriginal,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  suffixText: 'px',
                ),
                onChanged: _onHeightChanged,
              ),
            ),
          ]),
          const SizedBox(height: 12),

          // ── FPS ─────────────────────────────────────────────────────────────
          Row(children: [
            Text(l.fpsLabel, style: labelStyle),
            const SizedBox(width: 2),
            _infoButton(context, l.fpsInfoTitle, l.fpsInfoContent),
          ]),
          const SizedBox(height: 4),
          SegmentedButton<int>(
            showSelectedIcon: false,
            segments: [
              ButtonSegment(value: 0,  label: Text(l.orig)),
              ButtonSegment(value: 24, label: Text('24')),
              ButtonSegment(value: 25, label: Text('25')),
              ButtonSegment(value: 30, label: Text('30')),
              ButtonSegment(value: 60, label: Text('60')),
            ],
            selected: {s.fps},
            onSelectionChanged: widget.isConverting
                ? null
                : (sel) => widget.onChanged(s.copyWith(fps: sel.first)),
          ),
          const SizedBox(height: 12),
        ],

        // ── Audio-Codec ───────────────────────────────────────────────────────
        Row(children: [
          Text(l.audioCodecLabel, style: labelStyle),
          const SizedBox(width: 2),
          _infoButton(context, l.audioCodecLabel, l.audioCodecInfoContent),
        ]),
        const SizedBox(height: 4),
        SegmentedButton<String>(
          showSelectedIcon: false,
          segments: [
            const ButtonSegment(value: 'aac',  label: Text('AAC')),
            const ButtonSegment(value: 'mp3',  label: Text('MP3')),
            const ButtonSegment(value: 'opus', label: Text('Opus')),
            if ((widget.metadata?.audioChannels ?? 0) >= 3)
              const ButtonSegment(value: 'ac3', label: Text('AC3')),
          ],
          selected: {s.audioCodec},
          onSelectionChanged: (widget.isConverting || s.audioBitrate == 0)
              ? null
              : (sel) {
                  final newCodec = sel.first;
                  // Container anpassen falls inkompatibel
                  final compatible = _containerCodecs.entries
                      .where((e) => e.value.contains(newCodec))
                      .map((e) => e.key)
                      .toList();
                  final newContainer = compatible.contains(s.container)
                      ? s.container
                      : compatible.first;
                  // Bitrate anpassen: AC3 → 384k, Opus → max 192, sonst max 320
                  final int newBitrate;
                  if (newCodec == 'ac3') {
                    newBitrate = 384;
                  } else if (newCodec == 'opus') {
                    newBitrate = s.audioBitrate > 192 ? 192 : s.audioBitrate;
                  } else {
                    newBitrate = s.audioBitrate > 320 ? 320 : s.audioBitrate;
                  }
                  // MP3 unterstützt max. Stereo → 5.1-Auswahl zurücksetzen
                  final int newChannels =
                      (newCodec == 'mp3' && s.audioChannels == 6) ? 0 : s.audioChannels;
                  widget.onChanged(s.copyWith(
                    audioCodec: newCodec,
                    container: newContainer,
                    audioBitrate: newBitrate,
                    audioChannels: newChannels,
                  ));
                },
        ),
        const SizedBox(height: 12),

        // ── Audio-Bitrate ─────────────────────────────────────────────────────
        Row(children: [
          Expanded(
            child: DropdownMenu<int>(
              key: ValueKey('${s.audioBitrate}_${s.audioCodec}'),
              expandedInsets: EdgeInsets.zero,
              enabled: !widget.isConverting,
              initialSelection: s.audioBitrate,
              label: Text(l.audioBitrateLabel),
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              menuStyle: MenuStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              dropdownMenuEntries: _bitrateEntries(s.audioCodec, l),
              onSelected: (v) {
                if (v != null) widget.onChanged(s.copyWith(audioBitrate: v));
              },
            ),
          ),
          const SizedBox(width: 4),
          _infoButton(context, l.audioBitrateLabel, l.audioBitrateInfoContent),
        ]),
        const SizedBox(height: 12),

        // ── Audiokanäle ───────────────────────────────────────────────────────
        if (s.audioBitrate != 0) ...[
          Row(children: [
            Text(l.audioChannelsLabel, style: labelStyle),
            const SizedBox(width: 2),
            _infoButton(context, l.audioChannelsLabel, l.audioChannelsInfoContent),
          ]),
          const SizedBox(height: 4),
          SegmentedButton<int>(
            showSelectedIcon: false,
            segments: _channelSegments(s, l),
            selected: {s.audioChannels},
            onSelectionChanged: widget.isConverting
                ? null
                : (sel) => widget.onChanged(s.copyWith(audioChannels: sel.first)),
          ),
          const SizedBox(height: 12),
        ],

        // ── Output-Format — nur im Video-Modus ───────────────────────────────
        if (!s.audioOnly) ...[
          Row(children: [
            Text(l.outputFormatLabel, style: labelStyle),
            const SizedBox(width: 2),
            _infoButton(context, l.outputFormatLabel, l.outputFormatInfoContent),
          ]),
          const SizedBox(height: 4),
          SegmentedButton<String>(
            showSelectedIcon: false,
            segments: const [
              ButtonSegment(value: 'mp4', label: Text('MP4')),
              ButtonSegment(value: 'mkv', label: Text('MKV')),
              ButtonSegment(value: 'mov', label: Text('MOV')),
              ButtonSegment(value: 'avi', label: Text('AVI')),
              ButtonSegment(value: 'ts',  label: Text('TS')),
            ],
            selected: {s.container},
            onSelectionChanged: widget.isConverting
                ? null
                : (sel) {
                    final newContainer = sel.first;
                    // Codec anpassen falls inkompatibel
                    final compatibleCodecs = _containerCodecs[newContainer]!;
                    final newCodec = compatibleCodecs.contains(s.audioCodec)
                        ? s.audioCodec
                        : compatibleCodecs.first;
                    widget.onChanged(
                        s.copyWith(container: newContainer, audioCodec: newCodec));
                  },
          ),
        ],
      ],
    );
  }
}
