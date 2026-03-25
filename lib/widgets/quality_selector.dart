// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../models/quality_option.dart';

/// Gibt die lokalisierten Anzeigetexte für alle Qualitätsstufen zurück.
/// Die Reihenfolge entspricht 1:1 der [qualityOptions]-Liste.
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

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final labels = _qualityLabels(l);

    return DropdownMenu<int>(
      // key zwingt Flutter zum Neuaufbau wenn sich selectedIndex ändert
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
    );
  }
}
