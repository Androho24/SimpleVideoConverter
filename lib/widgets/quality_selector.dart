// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import '../models/quality_option.dart';

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
    return DropdownButtonFormField<int>(
      initialValue: selectedIndex,
      decoration: const InputDecoration(
        labelText: 'Qualität',
        border: OutlineInputBorder(),
      ),
      items: qualityOptions.asMap().entries.map((entry) {
        return DropdownMenuItem<int>(
          value: entry.key,
          child: Text(entry.value.name, overflow: TextOverflow.ellipsis),
        );
      }).toList(),
      onChanged: isConverting
          ? null
          : (val) {
              if (val != null) onChanged(val);
            },
    );
  }
}
