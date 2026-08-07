// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const videoCodecH264 = 'h264';
  static const videoCodecH265 = 'h265';

  /// Experimentell: nur wählbar, wenn [getAv1Experimental] true ist.
  static const videoCodecAv1 = 'av1';

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
  static const _keyAv1Experimental = 'av1Experimental';
  static const _keyThemeMode = 'themeMode';
  static const _keyLastVersionCode = 'lastVersionCode';

  /// Gewähltes Theme, oder `null`, wenn noch nie eines festgelegt wurde.
  /// Den Startwert bestimmt in dem Fall der [ThemeController].
  static Future<ThemeMode?> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return switch (prefs.getString(_keyThemeMode)) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      'system' => ThemeMode.system,
      _ => null,
    };
  }

  static Future<void> setThemeMode(ThemeMode value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyThemeMode, value.name);
  }

  /// Build-Nummer des letzten Starts, oder `null` bei einer Neuinstallation
  /// bzw. einem Update aus einer Version, die den Wert noch nicht geschrieben
  /// hat (alles vor 2.1.0+28).
  static Future<int?> getLastVersionCode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_keyLastVersionCode);
  }

  static Future<void> setLastVersionCode(int value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyLastVersionCode, value);
  }

  /// Ob Einstellungen existieren, die nur eine frühere Version geschrieben
  /// haben kann. Erkennt zusätzlich zum Update auf demselben Gerät auch den
  /// Fall "neues Gerät, Einstellungen aus dem Android-Backup wiederhergestellt"
  /// — dort sieht die Installation sonst wie eine Neuinstallation aus.
  static Future<bool> hasLegacyPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    const legacyKeys = [
      _keyExpertMode,
      _keyIsPro,
      _keyConversionCount,
      _keyProHintShown,
      _keyCpuWarningDismissed,
      _keyLastQualityIndex,
      _keyAutoSaveVideos,
      _keyVideoCodec,
      _keyAv1Experimental,
      _keyNotificationRationaleDismissed,
      _keyNotificationDeniedHintCount,
      _keyReviewPrompted,
    ];
    return legacyKeys.any(prefs.containsKey);
  }

  static Future<bool> getAutoSaveVideos() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyAutoSaveVideos) ?? false;
  }

  static Future<void> setAutoSaveVideos(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyAutoSaveVideos, value);
  }

  /// Liefert den Codec für den normalen Modus. AV1 wird nur zurückgegeben,
  /// solange der Experimentell-Schalter aktiv ist — wird er ausgeschaltet,
  /// fällt eine gespeicherte AV1-Auswahl auf H.264 zurück.
  static Future<String> getVideoCodec() async {
    final prefs = await SharedPreferences.getInstance();
    final codec = prefs.getString(_keyVideoCodec);
    if (codec == videoCodecH265) return videoCodecH265;
    if (codec == videoCodecAv1 &&
        (prefs.getBool(_keyAv1Experimental) ?? false)) {
      return videoCodecAv1;
    }
    return videoCodecH264;
  }

  static Future<void> setVideoCodec(String value) async {
    if (value != videoCodecH264 &&
        value != videoCodecH265 &&
        value != videoCodecAv1) {
      throw ArgumentError.value(value, 'value', 'Unsupported video codec');
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyVideoCodec, value);
  }

  /// Ob AV1 im normalen Modus als experimentelle Option angeboten wird.
  static Future<bool> getAv1Experimental() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyAv1Experimental) ?? false;
  }

  static Future<void> setAv1Experimental(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyAv1Experimental, value);
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
