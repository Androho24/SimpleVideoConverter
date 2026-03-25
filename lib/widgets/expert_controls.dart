// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/expert_settings.dart';

class ExpertControls extends StatefulWidget {
  final ExpertSettings settings;
  final bool isConverting;
  final ValueChanged<ExpertSettings> onChanged;

  const ExpertControls({
    super.key,
    required this.settings,
    required this.isConverting,
    required this.onChanged,
  });

  @override
  State<ExpertControls> createState() => _ExpertControlsState();
}

class _ExpertControlsState extends State<ExpertControls> {
  late final TextEditingController _resController;

  @override
  void initState() {
    super.initState();
    final dim = widget.settings.maxDimension;
    _resController = TextEditingController(text: dim == 0 ? '' : dim.toString());
  }

  @override
  void dispose() {
    _resController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.settings;
    final theme = Theme.of(context);
    final labelStyle = theme.textTheme.labelMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        // ── CRF ──────────────────────────────────────────────────────────────
        Row(
          children: [
            Text('Videoqualität (CRF): ${s.crf}', style: labelStyle),
            const SizedBox(width: 4),
            Tooltip(
              message: '0 = verlustfrei (groß)  ·  23 = Standard  ·  51 = niedrigste Qualität',
              child: Icon(Icons.info_outline, size: 14, color: theme.colorScheme.outline),
            ),
          ],
        ),
        Slider(
          value: s.crf.toDouble(),
          min: 0,
          max: 51,
          divisions: 51,
          label: s.crf.toString(),
          onChanged: widget.isConverting
              ? null
              : (v) => widget.onChanged(s.copyWith(crf: v.round())),
        ),
        const SizedBox(height: 12),

        // ── Auflösung ─────────────────────────────────────────────────────────
        TextField(
          enabled: !widget.isConverting,
          controller: _resController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            labelText: 'Max. Auflösung (px)',
            hintText: 'Leer = Original',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            suffixText: 'px',
          ),
          onChanged: (v) => widget.onChanged(
            s.copyWith(maxDimension: int.tryParse(v) ?? 0),
          ),
        ),
        const SizedBox(height: 12),

        // ── FPS ───────────────────────────────────────────────────────────────
        Text('FPS', style: labelStyle),
        const SizedBox(height: 4),
        SegmentedButton<int>(
          showSelectedIcon: false,
          segments: const [
            ButtonSegment(value: 0,  label: Text('Orig')),
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
        DropdownMenu<int>(
          key: ValueKey(s.audioBitrate),
          expandedInsets: EdgeInsets.zero,
          enabled: !widget.isConverting,
          initialSelection: s.audioBitrate,
          label: const Text('Audio-Bitrate'),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
          menuStyle: MenuStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          dropdownMenuEntries: const [
            DropdownMenuEntry(value: 0,   label: 'Stumm'),
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
        const SizedBox(height: 12),

        // ── Audio-Codec ───────────────────────────────────────────────────────
        if (s.audioBitrate != 0) ...[
          Text('Audio-Codec', style: labelStyle),
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
        Text('Output-Format', style: labelStyle),
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
