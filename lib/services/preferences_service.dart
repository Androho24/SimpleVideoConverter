// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _keyExpertMode = 'expertMode';
  static const _keyIsPro = 'isPro';
  static const _keyLaunchCount = 'launchCount';

  static Future<bool> getExpertMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyExpertMode) ?? false;
  }

  static Future<void> setExpertMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyExpertMode, value);
  }

  static Future<bool> getIsPro() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsPro) ?? false;
  }

  static Future<void> setIsPro(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsPro, value);
  }

  /// Erhöht den Start-Zähler und gibt true zurück wenn das Intervall erreicht wurde.
  /// Der Zähler rollt von 0 bis interval-1 → kein Überlauf möglich.
  static Future<bool> incrementLaunchCountAndCheck(int interval) async {
    final prefs = await SharedPreferences.getInstance();
    final count = (prefs.getInt(_keyLaunchCount) ?? 0) + 1;
    await prefs.setInt(_keyLaunchCount, count >= interval ? 0 : count);
    return count >= interval;
  }
}
