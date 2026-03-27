// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _keyExpertMode = 'expertMode';
  static const _keyIsPro = 'isPro';
  static const _keyLaunchCount = 'launchCount';
  static const _keyCpuWarningDismissed = 'cpuWarningDismissed';
  static const _keyConversionCount = 'conversionCount';
  static const _keyLastQualityIndex = 'lastQualityIndex';

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

  static Future<bool> getCpuWarningDismissed() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyCpuWarningDismissed) ?? false;
  }

  static Future<void> setCpuWarningDismissed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyCpuWarningDismissed, true);
  }

  static Future<int> getLastQualityIndex() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyLastQualityIndex) ?? 0;
  }

  static Future<void> setLastQualityIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyLastQualityIndex, index);
  }

  /// Erhöht den Konvertierungs-Zähler und gibt true zurück wenn das Intervall erreicht wurde.
  static Future<bool> incrementConversionCountAndCheck(int interval) async {
    final prefs = await SharedPreferences.getInstance();
    final count = (prefs.getInt(_keyConversionCount) ?? 0) + 1;
    await prefs.setInt(_keyConversionCount, count >= interval ? 0 : count);
    return count >= interval;
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
