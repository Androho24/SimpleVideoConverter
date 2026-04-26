// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:async';
import 'package:flutter/services.dart';

/// Steuert den Android-ForegroundService für Hintergrund-Konvertierungen.
///
/// Der Service lebt nur solange eine Konvertierung läuft. Er verwaltet die
/// Fortschritts-Notification und zeigt bei Abschluss im Hintergrund eine
/// "Fertig"-Notification. Alle Methoden sind no-ops wenn der Service nicht
/// läuft oder die Plattform kein Android ist.
class ConversionServiceManager {
  static const _channel =
      MethodChannel('com.androho.simplevideoconverter/conversion_service');

  static bool _running = false;
  static DateTime? _lastProgressSent;

  /// Fragt POST_NOTIFICATIONS-Berechtigung an (Android 13+, einmalig).
  /// Gibt sofort zurück – Konvertierung kann unabhängig vom Ergebnis starten.
  static Future<void> requestNotificationPermission() async {
    try {
      await _channel.invokeMethod<void>('requestNotificationPermission');
    } catch (_) {}
  }

  /// Startet den ForegroundService mit der Fortschritts-Notification.
  static Future<void> startService(String fileName) async {
    _running = true;
    _lastProgressSent = null;
    try {
      await _channel.invokeMethod<void>('startService', {'fileName': fileName});
    } catch (_) {}
  }

  /// Aktualisiert die Fortschritts-Notification (gedrosselt auf max. 1×/s).
  static Future<void> updateProgress(int percent, String speedText) async {
    if (!_running) return;
    final now = DateTime.now();
    if (_lastProgressSent != null &&
        now.difference(_lastProgressSent!) < const Duration(seconds: 1)) {
      return;
    }
    _lastProgressSent = now;
    try {
      await _channel.invokeMethod<void>('updateProgress', {
        'percent': percent,
        'speedText': speedText,
      });
    } catch (_) {}
  }

  /// Stoppt den Service und entfernt alle Notifications.
  /// Sicher aufrufbar auch wenn der Service bereits gestoppt ist.
  static Future<void> stopService() async {
    if (!_running) return;
    _running = false;
    _lastProgressSent = null;
    try {
      await _channel.invokeMethod<void>('stopService');
    } catch (_) {}
  }

  /// Zeigt eine "Fertig"-Notification und stoppt den Service.
  /// Nur aufrufen wenn die App im Hintergrund ist.
  static Future<void> showCompletion(String fileName) async {
    if (!_running) return;
    _running = false;
    _lastProgressSent = null;
    try {
      await _channel.invokeMethod<void>('showCompletion', {'fileName': fileName});
    } catch (_) {}
  }
}
