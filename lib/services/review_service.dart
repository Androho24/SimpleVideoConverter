// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';
import 'package:in_app_review/in_app_review.dart';
import 'preferences_service.dart';

class ReviewService {
  /// Ab dieser Anzahl erfolgreicher Konvertierungen wird der Review-Dialog
  /// genau einmal angezeigt.
  static const _reviewThreshold = 10;

  /// Zählt eine erfolgreiche Konvertierung. Zeigt selbst nichts an —
  /// die Anzeige übernimmt [maybeShowReview] bei Rückkehr in die Hauptansicht.
  ///
  /// Sobald beide Prompts erledigt sind (Review gezeigt UND Pro-Hinweis gezeigt
  /// bzw. bereits Pro), bewirkt Weiterzählen nichts mehr → wir hören auf zu
  /// schreiben. Spart unnötige Disk-I/O und schließt einen (theoretischen)
  /// Int-Überlauf aus.
  static Future<void> recordSuccessfulConversion() async {
    final reviewDone = await PreferencesService.getReviewPrompted();
    final proDone =
        await PreferencesService.getProHintShown() ||
        await PreferencesService.getIsPro();
    if (reviewDone && proDone) return;

    await PreferencesService.incrementSuccessfulConversions();
  }

  /// Zeigt den nativen Google-Play-In-App-Review-Dialog **genau einmal**,
  /// sobald die Schwelle erreicht ist. Im Debug-Build oder außerhalb des Play
  /// Stores zeigt Google ggf. nichts; das „prompted"-Flag wird dennoch gesetzt.
  ///
  /// Schlägt der Aufruf fehl (typisch: die App ist im Hintergrund, Play meldet
  /// „Android activity not available"), bleibt das Flag ungesetzt — der Dialog
  /// wird dann beim nächsten passenden Moment erneut versucht.
  static Future<void> maybeShowReview() async {
    if (await PreferencesService.getReviewPrompted()) return;
    final total = await PreferencesService.getSuccessfulConversions();
    if (total < _reviewThreshold) return;

    // Ohne sichtbare Activity wirft der Play-Dialog eine PlatformException.
    // Das passiert, wenn der Nutzer die App direkt nach der Konvertierung
    // in den Hintergrund schiebt, während der Prompt ausgelöst wird.
    if (WidgetsBinding.instance.lifecycleState != AppLifecycleState.resumed) {
      return;
    }

    final review = InAppReview.instance;
    try {
      if (await review.isAvailable()) {
        await review.requestReview();
      }
    } catch (error, stackTrace) {
      // Kein fataler Fehler: die App läuft normal weiter, es fehlt nur der
      // Review-Dialog. Zur Beobachtung trotzdem an Crashlytics melden.
      await FirebaseCrashlytics.instance.recordError(
        error,
        stackTrace,
        reason: 'In-App-Review konnte nicht angezeigt werden',
        fatal: false,
      );
      return;
    }
    await PreferencesService.setReviewPrompted();
  }

  /// Öffnet die Play-Store-Detailseite der App (für den expliziten
  /// „App bewerten"-Button in den Einstellungen). Bewusst NICHT requestReview(),
  /// da dessen Anzeige vom Play-Quota abhängt und sonst „nichts passiert".
  static Future<void> openStoreListing() async {
    await InAppReview.instance.openStoreListing();
  }
}
