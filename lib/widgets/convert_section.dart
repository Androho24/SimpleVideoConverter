// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class ConvertSection extends StatelessWidget {
  final bool isMuted;
  final bool isConverting;
  final double progress;
  final double? estimatedSizeMb;
  final ValueChanged<bool> onMuteChanged;
  final VoidCallback onConvert;

  const ConvertSection({
    super.key,
    required this.isMuted,
    required this.isConverting,
    required this.progress,
    required this.estimatedSizeMb,
    required this.onMuteChanged,
    required this.onConvert,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SwitchListTile(
          title: Text(l.mute),
          value: isMuted,
          onChanged: isConverting ? null : onMuteChanged,
          contentPadding: EdgeInsets.zero,
        ),
        const SizedBox(height: 4),
        if (estimatedSizeMb != null)
          Text(
            'Geschätzte Größe: ${estimatedSizeMb!.toStringAsFixed(1)} MB',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        const SizedBox(height: 16),
        if (isConverting) ...[
          Text(
            'Konvertierung: ${(progress * 100).toStringAsFixed(0)}%',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(value: progress),
        ] else
          ElevatedButton.icon(
            icon: const Icon(Icons.save),
            label: const Text('Speichern & Konvertieren'),
            onPressed: onConvert,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
      ],
    );
  }
}
