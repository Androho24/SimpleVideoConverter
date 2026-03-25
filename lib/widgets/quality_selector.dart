// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/quality_option.dart';

List<String> _qualityLabels(AppLocalizations l) => [
  l.quality1080pHigh,
  l.quality1080pMedium,
  l.quality1080pLow,
  l.quality1080pVeryLow,
  l.quality720pHigh,
  l.quality720pMedium,
  l.quality720pLow,
  l.quality720pVeryLow,
  l.quality480pHigh,
  l.quality480pMedium,
  l.quality480pLow,
  l.quality480pVeryLow,
  l.quality360pHigh,
  l.quality360pMedium,
  l.quality360pLow,
  l.quality360pVeryLow,
];

class QualitySelector extends StatelessWidget {
  final int selectedIndex;
  final bool isConverting;
  final ValueChanged<int> onChanged;

  const QualitySelector({
    super.key,
    required this.selectedIndex,
    required this.isConverting,
    required this.onChanged,
  });

  void _showResolutionInfo(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.resolutionExplainTitle),
        content: Text(l.resolutionExplainContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l.ok),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final labels = _qualityLabels(l);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Text(l.qualityLabel,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(width: 2),
            IconButton(
              icon: Icon(Icons.info_outline,
                  size: 16,
                  color: Theme.of(context).colorScheme.outline),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              tooltip: l.resolutionTooltip,
              onPressed: () => _showResolutionInfo(context),
            ),
          ],
        ),
        const SizedBox(height: 4),
        DropdownMenu<int>(
          key: ValueKey(selectedIndex),
          expandedInsets: EdgeInsets.zero,
          menuHeight: 300,
          enabled: !isConverting,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          menuStyle: MenuStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          initialSelection: selectedIndex,
          label: Text(l.qualityLabel),
          dropdownMenuEntries: List.generate(
            qualityOptions.length,
            (i) => DropdownMenuEntry<int>(value: i, label: labels[i]),
          ),
          onSelected: (val) {
            if (val != null) onChanged(val);
          },
        ),
      ],
    );
  }
}
