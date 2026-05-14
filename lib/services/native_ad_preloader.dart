// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:async';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_config.dart';
import 'preferences_service.dart';

/// Lädt eine NativeAd vor (z. B. beim Tap auf "Konvertieren") und übergibt sie
/// an den ersten konsumierenden NativeAdWidget. Dadurch hat die Anzeige während
/// der Navigator-Transition + FFmpeg-Setup einen Vorlauf von ein paar Sekunden.
///
/// Pro-User: Preload wird übersprungen.
/// Mehrfach-Aufrufe: idempotent (laufende oder fertige Loads werden nicht
/// dupliziert).
class NativeAdPreloader {
  static Completer<NativeAd?>? _completer;

  /// Startet einen Preload, falls noch keiner läuft oder bereitliegt.
  /// Fire-and-forget — der Aufrufer muss nicht warten.
  static Future<void> preload() async {
    if (_completer != null) return;
    if (await PreferencesService.getIsPro()) return;

    final completer = Completer<NativeAd?>();
    _completer = completer;

    final ad = NativeAd(
      adUnitId: AdConfig.nativeAdUnitId,
      factoryId: 'nativeAd',
      listener: NativeAdListener(
        onAdLoaded: (loadedAd) {
          if (!completer.isCompleted) {
            completer.complete(loadedAd as NativeAd);
          }
        },
        onAdFailedToLoad: (failedAd, _) {
          failedAd.dispose();
          if (!completer.isCompleted) completer.complete(null);
        },
      ),
      request: const AdRequest(),
      nativeAdOptions: NativeAdOptions(
        videoOptions: VideoOptions(startMuted: true),
      ),
    );
    ad.load();
  }

  /// Übergibt den Preload an den Aufrufer. Der Aufrufer übernimmt damit das
  /// Ownership und ist für `dispose()` zuständig.
  ///
  /// - `null`: kein Preload aktiv → Widget muss selbst laden.
  /// - `Future<NativeAd?>`: entweder schon fertig (instant) oder noch in
  ///   flight. Auflösung zu `null` heißt: Load ist fehlgeschlagen.
  static Future<NativeAd?>? consume() {
    final completer = _completer;
    _completer = null;
    return completer?.future;
  }
}
