// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const videoCodecH264 = 'h264';
  static const videoCodecH265 = 'h265';

  static const _keyExpertMode = 'expertMode';
  static const _keyIsPro = 'isPro';
  static const _keyCpuWarningDismissed = 'cpuWarningDismissed';
  static const _keyConversionCount = 'conversionCount';
  static const _keyReviewPrompted = 'reviewPrompted';
  static const _keyProHintShown = 'proHintShown';
  static const _keyNotificationRationaleDismissed =
      'notificationRationaleDismissed';
  static const _keyNotificationDeniedHintCount = 'notificationDeniedHintCount';
  static const _keyLastQualityIndex = 'lastQualityIndex';
  static const _keyAutoSaveVideos = 'autoSaveVideos';
  static const _keyVideoCodec = 'videoCodec';

  static Future<bool> getAutoSaveVideos() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyAutoSaveVideos) ?? false;
  }

  static Future<void> setAutoSaveVideos(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyAutoSaveVideos, value);
  }

  static Future<String> getVideoCodec() async {
    final prefs = await SharedPreferences.getInstance();
    final codec = prefs.getString(_keyVideoCodec);
    return codec == videoCodecH265 ? videoCodecH265 : videoCodecH264;
  }

  static Future<void> setVideoCodec(String value) async {
    if (value != videoCodecH264 && value != videoCodecH265) {
      throw ArgumentError.value(value, 'value', 'Unsupported video codec');
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyVideoCodec, value);
  }

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

  static Future<bool> getNotificationRationaleDismissed() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyNotificationRationaleDismissed) ?? false;
  }

  static Future<void> setNotificationRationaleDismissed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyNotificationRationaleDismissed, true);
  }

  static Future<int> getNotificationDeniedHintCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyNotificationDeniedHintCount) ?? 0;
  }

  static Future<void> incrementNotificationDeniedHintCount() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
      _keyNotificationDeniedHintCount,
      (prefs.getInt(_keyNotificationDeniedHintCount) ?? 0) + 1,
    );
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

  /// Gesamtzahl erfolgreicher Konvertierungen (monoton). Basis für Review-/Pro-Prompts.
  static Future<int> getSuccessfulConversions() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyConversionCount) ?? 0;
  }

  /// Erhöht den monotonen Konvertierungs-Zähler um 1 und gibt den neuen Wert zurück.
  static Future<int> incrementSuccessfulConversions() async {
    final prefs = await SharedPreferences.getInstance();
    final count = (prefs.getInt(_keyConversionCount) ?? 0) + 1;
    await prefs.setInt(_keyConversionCount, count);
    return count;
  }

  /// Ob der In-App-Review-Dialog bereits (einmalig) angezeigt wurde.
  static Future<bool> getReviewPrompted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyReviewPrompted) ?? false;
  }

  static Future<void> setReviewPrompted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyReviewPrompted, true);
  }

  /// Ob der Pro-/Werbung-entfernen-Hinweis bereits (einmalig) angezeigt wurde.
  static Future<bool> getProHintShown() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyProHintShown) ?? false;
  }

  static Future<void> setProHintShown() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyProHintShown, true);
  }
}
