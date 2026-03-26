// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../l10n/app_localizations.dart';
import '../models/expert_settings.dart';
import '../models/video_metadata.dart';

/// Welche Audio-Codecs in welchem Container funktionieren.
const _containerCodecs = <String, List<String>>{
  'mp4': ['aac'],
  'mkv': ['aac', 'mp3', 'opus'],
  'mov': ['aac'],
  'avi': ['mp3'],
  'ts':  ['aac', 'opus'],
};

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

  @override
  void initState() {
    super.initState();
    _widthController = TextEditingController(
      text: widget.settings.width == 0 ? '' : widget.settings.width.toString(),
    );
    _heightController = TextEditingController(
      text: widget.settings.height == 0 ? '' : widget.settings.height.toString(),
    );
  }

  @override
  void didUpdateWidget(ExpertControls oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.metadata != oldWidget.metadata && widget.metadata != null) {
      _widthController.text = widget.metadata!.width.toString();
      _heightController.text = widget.metadata!.height.toString();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          widget.onChanged(widget.settings.copyWith(
            width: widget.metadata!.width,
            height: widget.metadata!.height,
          ));
        }
      });
    }
  }

  @override
  void dispose() {
    _widthController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Hilfsmethoden
  // ---------------------------------------------------------------------------

  /// Gibt die sinnvollen Bitrate-Einträge für den gewählten Codec zurück.
  List<DropdownMenuEntry<int>> _bitrateEntries(String codec, AppLocalizations l) {
    final maxBitrate = codec == 'opus' ? 192 : 320;
    return [
      DropdownMenuEntry(value: 0, label: l.silent),
      for (final b in [64, 96, 128, 192, 320])
        if (b <= maxBitrate) DropdownMenuEntry(value: b, label: '$b kbps'),
    ];
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

        // ── CRF, Auflösung, FPS — nur im Video-Modus ────────────────────────
        if (!s.audioOnly) ...[
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
                onChanged: (v) => widget.onChanged(
                  s.copyWith(width: int.tryParse(v) ?? 0),
                ),
              ),
            ),
            const SizedBox(width: 12),
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
                onChanged: (v) => widget.onChanged(
                  s.copyWith(height: int.tryParse(v) ?? 0),
                ),
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
          segments: const [
            ButtonSegment(value: 'aac',  label: Text('AAC')),
            ButtonSegment(value: 'mp3',  label: Text('MP3')),
            ButtonSegment(value: 'opus', label: Text('Opus')),
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
                  // Bitrate kappen (z.B. Opus + 320 → 192)
                  final maxBitrate = newCodec == 'opus' ? 192 : 320;
                  final newBitrate =
                      s.audioBitrate > maxBitrate ? maxBitrate : s.audioBitrate;
                  widget.onChanged(s.copyWith(
                    audioCodec: newCodec,
                    container: newContainer,
                    audioBitrate: newBitrate,
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
