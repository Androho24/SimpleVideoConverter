// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// Verbindet den nativen UMP-Consent-Flow mit dem AdMob Next-Gen SDK.
///
/// Android meldet über den MethodChannel, sobald der Consent ausgewertet ist.
/// Erst danach wird das SDK initialisiert, damit auch Bidding-Adapter den
/// aktuellen Consent-Zustand erhalten.
class AdsService {
  AdsService._();

  static const _channel = MethodChannel('com.androho.simplevideoconverter/ads');

  static final Completer<void> _consentResolved = Completer<void>();
  static Future<bool>? _initialization;
  static bool _canRequestAds = false;
  static bool _configured = false;

  /// Registriert den Rückkanal aus Android. Muss vor [runApp] aufgerufen werden.
  static void configure() {
    if (_configured) return;
    _configured = true;
    _channel.setMethodCallHandler((call) async {
      if (call.method != 'consentReady') return;

      _canRequestAds = call.arguments == true;
      if (!_consentResolved.isCompleted) _consentResolved.complete();
      if (_canRequestAds) await _initializeSdk();
    });
  }

  /// Wartet auf Consent und SDK-Initialisierung.
  ///
  /// `false` bedeutet, dass aktuell keine Anzeigen angefragt werden dürfen
  /// oder die Initialisierung fehlgeschlagen ist.
  static Future<bool> waitUntilReady() async {
    configure();
    await _consentResolved.future;
    if (!_canRequestAds) return false;
    return _initializeSdk();
  }

  static Future<bool> _initializeSdk() {
    final running = _initialization;
    if (running != null) return running;

    final initialization = _runInitialization();
    _initialization = initialization;
    initialization.then((ready) {
      // Bei einem transienten Fehler darf ein späterer Ad-Load erneut versuchen.
      if (!ready && identical(_initialization, initialization)) {
        _initialization = null;
      }
    });
    return initialization;
  }

  static Future<bool> _runInitialization() async {
    try {
      final status = await MobileAds.instance.initialize();
      for (final entry in status.adapterStatuses.entries) {
        debugPrint(
          'AdMob-Adapter ${entry.key}: '
          '${entry.value.state.name} (${entry.value.description})',
        );
      }
      debugPrint('Google Mobile Ads mit Android Next-Gen initialisiert');
      return true;
    } catch (error, stackTrace) {
      debugPrint('AdMob Next-Gen Initialisierung fehlgeschlagen: $error');
      debugPrintStack(stackTrace: stackTrace);
      return false;
    }
  }
}
