// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ad_config.dart';
import 'ads_service.dart';
import 'preferences_service.dart';

/// Lädt eine NativeAd vor (z. B. beim Tap auf "Konvertieren") und übergibt sie
/// an den ersten konsumierenden NativeAdWidget. Dadurch hat die Anzeige während
/// der Navigator-Transition + FFmpeg-Setup einen Vorlauf von ein paar Sekunden.
///
/// Pro-User: Preload wird übersprungen.
/// Mehrfach-Aufrufe: idempotent (laufende oder fertige Loads werden nicht
/// dupliziert).
class NativeAdPreloader {
  /// Obergrenze für das Warten auf einen laufenden Preload. Schützt davor, dass
  /// ein ausbleibender Listener-Callback den Ad-Slot dauerhaft im Platzhalter
  /// stehen lässt (siehe [consume]).
  static const _preloadTimeout = Duration(seconds: 10);

  static Completer<NativeAd?>? _completer;

  /// Startet einen Preload, falls noch keiner läuft oder bereitliegt.
  /// Fire-and-forget — der Aufrufer muss nicht warten.
  static Future<void> preload() async {
    if (_completer != null) return;
    if (await PreferencesService.getIsPro()) return;

    final completer = Completer<NativeAd?>();
    _completer = completer;

    if (!await AdsService.waitUntilReady()) {
      if (!completer.isCompleted) completer.complete(null);
      return;
    }

    late final NativeAd ad;
    ad = NativeAd(
      adUnitId: AdConfig.nativeAdUnitId,
      listener: NativeAdListener(
        onAdLoaded: (loadedAd) {
          if (!completer.isCompleted) completer.complete(loadedAd as NativeAd);
        },
        onAdFailedToLoad: (failedAd, _) {
          unawaited(failedAd.dispose());
          if (!completer.isCompleted) completer.complete(null);
        },
      ),
      request: const AdRequest(),
      nativeAdOptions: NativeAdOptions(
        videoOptions: VideoOptions(startMuted: true),
      ),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.medium,
        mainBackgroundColor: Colors.white,
      ),
    );
    try {
      await ad.load();
    } catch (_) {
      await ad.dispose();
      if (!completer.isCompleted) completer.complete(null);
    }
  }

  /// Übergibt den Preload an den Aufrufer. Der Aufrufer übernimmt damit das
  /// Ownership und ist für `dispose()` zuständig.
  ///
  /// - `null`: kein Preload aktiv → Widget muss selbst laden.
  /// - `Future<NativeAd?>`: entweder schon fertig (instant) oder noch in
  ///   flight. Auflösung zu `null` heißt: Load ist fehlgeschlagen oder hat
  ///   [_preloadTimeout] überschritten — in beiden Fällen lädt der Aufrufer
  ///   selbst weiter.
  static Future<NativeAd?>? consume() {
    final completer = _completer;
    _completer = null;
    if (completer == null) return null;

    var timedOut = false;
    final handOver = completer.future.timeout(
      _preloadTimeout,
      onTimeout: () {
        timedOut = true;
        return null;
      },
    );
    // Trudelt die Ad erst nach dem Timeout ein, hat sie keinen Besitzer mehr
    // und würde sonst als Leak liegen bleiben.
    unawaited(
      completer.future.then((ad) {
        if (timedOut && ad != null) unawaited(ad.dispose());
      }),
    );
    return handOver;
  }
}
