// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_theme.dart';
import 'theme_controller.dart';

/// Meldet Farbe und Icon-Helligkeit der Android-Systemleisten an die
/// MainActivity.
///
/// Nötig, weil die Activity die Leisten in `onResume` selbst setzt — Consent-
/// Form und Ad-Activities fassen sie an, und Flutter setzt seinen eigenen
/// Overlay-Style nur neu, wenn er sich geändert hat. Ohne diese Meldung
/// gewinnt die native Voreinstellung und die Leisten bleiben hell.
class SystemBarsService {
  SystemBarsService._();

  static const _channel = MethodChannel(
    'com.androho.simplevideoconverter/system_bars',
  );

  static _SystemBarsObserver? _observer;

  /// Registriert die Beobachter und schickt den aktuellen Stand einmal los.
  static void start() {
    if (_observer != null) return;
    final observer = _SystemBarsObserver();
    WidgetsBinding.instance.addObserver(observer);
    ThemeController.mode.addListener(apply);
    _observer = observer;
    apply();
  }

  /// Schickt den aktuellen Stand. Fehler werden geschluckt: auf iOS und in
  /// Tests gibt es keinen Handler, und beim Start kann die Activity noch nicht
  /// attached sein — spätestens der nächste Resume meldet erneut.
  static Future<void> apply() async {
    final brightness = ThemeController.resolvedBrightness;
    try {
      await _channel.invokeMethod<void>('setSystemBars', {
        'color': AppTheme.surfaceFor(brightness).toARGB32(),
        'isDark': brightness == Brightness.dark,
      });
    } catch (_) {}
  }
}

class _SystemBarsObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) SystemBarsService.apply();
  }

  @override
  void didChangePlatformBrightness() => SystemBarsService.apply();
}
