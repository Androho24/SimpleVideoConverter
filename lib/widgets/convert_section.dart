// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class ConvertSection extends StatelessWidget {
  final bool isMuted;
  final bool showMute;
  final bool isAudioOnly;
  final bool audioOnlySwitchEnabled;
  final double? estimatedSizeMb;
  final ValueChanged<bool> onMuteChanged;
  final ValueChanged<bool> onAudioOnlyChanged;
  final VoidCallback onConvert;

  const ConvertSection({
    super.key,
    required this.isMuted,
    required this.estimatedSizeMb,
    required this.onMuteChanged,
    required this.onAudioOnlyChanged,
    required this.onConvert,
    this.showMute = true,
    this.isAudioOnly = false,
    this.audioOnlySwitchEnabled = true,
  });

  void _showMuteInfo(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.mute),
        content: Text(l.muteInfoContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l.ok),
          ),
        ],
      ),
    );
  }

  void _showAudioOnlyInfo(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.audioOnly),
        content: Text(l.audioOnlyInfoContent),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (showMute) ...[
          Row(
            children: [
              Text(l.mute),
              const SizedBox(width: 2),
              IconButton(
                icon: Icon(Icons.info_outline,
                    size: 16,
                    color: Theme.of(context).colorScheme.outline),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                tooltip: l.muteTooltip,
                onPressed: () => _showMuteInfo(context),
              ),
              const Spacer(),
              Switch(
                value: isMuted,
                onChanged: isAudioOnly ? null : onMuteChanged,
              ),
            ],
          ),
        ],
        // ── Nur Audio ───────────────────────────────────────────────────────
        Row(
          children: [
            Text(l.audioOnly),
            const SizedBox(width: 2),
            IconButton(
              icon: Icon(Icons.info_outline,
                  size: 16,
                  color: Theme.of(context).colorScheme.outline),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              tooltip: l.audioOnlyTooltip,
              onPressed: () => _showAudioOnlyInfo(context),
            ),
            const Spacer(),
            Switch(
              value: isAudioOnly,
              onChanged: audioOnlySwitchEnabled ? onAudioOnlyChanged : null,
            ),
          ],
        ),
        if (estimatedSizeMb != null && !isAudioOnly)
          Text(
            l.estimatedSize(estimatedSizeMb!.toStringAsFixed(1)),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          icon: const Icon(Icons.movie_creation_outlined),
          label: Text(l.convertButton),
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
