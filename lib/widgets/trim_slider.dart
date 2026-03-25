// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/video_metadata.dart';

class TrimSlider extends StatelessWidget {
  final double trimStart;
  final double trimEnd;
  final bool isConverting;
  final VideoMetadata metadata;
  final ValueChanged<RangeValues> onChanged;

  const TrimSlider({
    super.key,
    required this.trimStart,
    required this.trimEnd,
    required this.isConverting,
    required this.metadata,
    required this.onChanged,
  });

  String _formatDuration(double fraction) {
    final ms = (fraction * metadata.durationMs).toInt();
    final seconds = ms ~/ 1000;
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '$minutes:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l.trimArea, style: Theme.of(context).textTheme.titleSmall),
        RangeSlider(
          values: RangeValues(trimStart, trimEnd),
          min: 0.0,
          max: 1.0,
          onChanged: isConverting ? null : onChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l.trimStartLabel(_formatDuration(trimStart))),
            Text(l.trimEndLabel(_formatDuration(trimEnd))),
          ],
        ),
      ],
    );
  }
}
