// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'preferences_service.dart';
import 'purchase_service.dart';

class ProPromptService {
  /// Ab dieser Anzahl erfolgreicher Konvertierungen wird der Pro-/Werbung-
  /// entfernen-Hinweis genau einmal angezeigt.
  static const _proHintThreshold = 20;

  /// Zeigt den Pro-Hinweis-Dialog **genau einmal**, sobald die Schwelle erreicht
  /// ist und der Nutzer nicht bereits Pro hat. Markiert danach als gezeigt
  /// (unabhängig davon, ob gekauft oder „Später" gewählt wurde).
  static Future<void> maybeShowProHint(BuildContext context) async {
    if (await PreferencesService.getProHintShown()) return;
    if (await PreferencesService.getIsPro()) return;
    final total = await PreferencesService.getSuccessfulConversions();
    if (total < _proHintThreshold) return;

    if (!context.mounted) return;
    final l = AppLocalizations.of(context)!;
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.proHintTitle),
        content: Text(l.proHintBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l.proHintLater),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              PurchaseService.buyRemoveAds();
            },
            child: Text(l.purchaseButton),
          ),
        ],
      ),
    );
    await PreferencesService.setProHintShown();
  }
}
