// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../l10n/app_localizations.dart';
import '../models/expert_settings.dart';
import '../models/video_metadata.dart';

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
      widget.onChanged(widget.settings.copyWith(
        width: widget.metadata!.width,
        height: widget.metadata!.height,
      ));
    }
  }

  @override
  void dispose() {
    _widthController.dispose();
    _heightController.dispose();
    super.dispose();
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

        // ── CRF ──────────────────────────────────────────────────────────────
        Row(children: [
          Text(l.crfLabel(s.crf.toString()), style: labelStyle),
          const SizedBox(width: 2),
          _infoButton(context, l.crfInfoTitle, l.crfInfoContent),
        ]),
        Slider(
          value: s.crf.toDouble(),
          min: 0, max: 51, divisions: 51,
          label: s.crf.toString(),
          onChanged: widget.isConverting
              ? null
              : (v) => widget.onChanged(s.copyWith(crf: v.round())),
        ),
        const SizedBox(height: 12),

        // ── Auflösung ─────────────────────────────────────────────────────────
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

        // ── FPS ───────────────────────────────────────────────────────────────
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

        // ── Audio-Bitrate ─────────────────────────────────────────────────────
        Row(children: [
          Expanded(
            child: DropdownMenu<int>(
              key: ValueKey(s.audioBitrate),
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
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 0,   label: l.silent),
                DropdownMenuEntry(value: 64,  label: '64 kbps'),
                DropdownMenuEntry(value: 96,  label: '96 kbps'),
                DropdownMenuEntry(value: 128, label: '128 kbps'),
                DropdownMenuEntry(value: 192, label: '192 kbps'),
                DropdownMenuEntry(value: 320, label: '320 kbps'),
              ],
              onSelected: (v) {
                if (v != null) widget.onChanged(s.copyWith(audioBitrate: v));
              },
            ),
          ),
          const SizedBox(width: 4),
          _infoButton(context, l.audioBitrateLabel, l.audioBitrateInfoContent),
        ]),
        const SizedBox(height: 12),

        // ── Audio-Codec ───────────────────────────────────────────────────────
        if (s.audioBitrate != 0) ...[
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
            onSelectionChanged: widget.isConverting
                ? null
                : (sel) => widget.onChanged(s.copyWith(audioCodec: sel.first)),
          ),
          const SizedBox(height: 12),
        ],

        // ── Output-Format ─────────────────────────────────────────────────────
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
              : (sel) => widget.onChanged(s.copyWith(container: sel.first)),
        ),
      ],
    );
  }
}
