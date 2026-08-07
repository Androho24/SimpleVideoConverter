// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:ui' show PlatformDispatcher;

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'preferences_service.dart';

/// Hält den aktiven [ThemeMode] und schreibt Änderungen sofort in die
/// Preferences zurück. Einzige Quelle der Wahrheit für die Theme-Auswahl;
/// die Einstellungen setzen hier, `MaterialApp` hört zu.
class ThemeController {
  ThemeController._();

  /// Build-Nummer der Version, die das dunkle Theme eingeführt hat. Wer von
  /// einer älteren Version updatet, kannte nur das helle Theme und soll es
  /// behalten.
  static const darkThemeVersionCode = 28;

  /// Toleranz beim Vergleich von Installations- und Update-Zeitpunkt. Bei einer
  /// Neuinstallation setzt Android beide auf denselben Wert; ein echtes Update
  /// liegt immer deutlich später.
  static const _updateDetectionTolerance = Duration(minutes: 1);

  static final ValueNotifier<ThemeMode> mode = ValueNotifier(ThemeMode.system);

  /// Die Helligkeit, die aus dem aktuellen [mode] tatsächlich folgt. Braucht
  /// keinen BuildContext und funktioniert daher auch vor `runApp`.
  static Brightness get resolvedBrightness => switch (mode.value) {
    ThemeMode.light => Brightness.light,
    ThemeMode.dark => Brightness.dark,
    ThemeMode.system => PlatformDispatcher.instance.platformBrightness,
  };

  /// Lädt die gespeicherte Auswahl. Wird vor `runApp` aufgerufen, damit der
  /// erste Frame schon im richtigen Theme gezeichnet wird.
  ///
  /// Gibt es noch keine Auswahl, wird der Startwert einmalig bestimmt und
  /// festgeschrieben — danach ist es eine ganz normale Einstellung, die der
  /// Nutzer jederzeit ändern kann.
  static Future<void> load() async {
    final packageInfo = await _packageInfo();
    final previousVersionCode = await PreferencesService.getLastVersionCode();
    final stored = await PreferencesService.getThemeMode();

    if (stored != null) {
      mode.value = stored;
    } else {
      final initial = initialThemeMode(
        previousVersionCode: previousVersionCode,
        installTime: packageInfo?.installTime,
        updateTime: packageInfo?.updateTime,
        hasLegacyPreferences: await PreferencesService.hasLegacyPreferences(),
      );
      mode.value = initial;
      await PreferencesService.setThemeMode(initial);
    }

    final currentVersionCode = int.tryParse(packageInfo?.buildNumber ?? '');
    if (currentVersionCode != null &&
        currentVersionCode != previousVersionCode) {
      await PreferencesService.setLastVersionCode(currentVersionCode);
    }
  }

  /// Startwert für Installationen ohne gespeicherte Theme-Auswahl.
  ///
  /// Die alte App hat ihre Versionsnummer nicht abgelegt, die Vorgängerversion
  /// lässt sich also nicht direkt auslesen. Stattdessen:
  /// - gespeicherter Versionsstand vorhanden → direkt vergleichen,
  /// - kein Versionsstand, aber die Installation wurde schon einmal
  ///   aktualisiert (`updateTime` deutlich nach `installTime`) → das Update kam
  ///   aus einer Version vor [darkThemeVersionCode], denn ab dieser wird der
  ///   Versionsstand geschrieben → helles Theme beibehalten,
  /// - kein Versionsstand, aber Einstellungen aus einer Vorversion → ebenfalls
  ///   ein Bestandsnutzer (neues Gerät, Android-Backup) → helles Theme,
  /// - sonst Neuinstallation → dem System folgen.
  @visibleForTesting
  static ThemeMode initialThemeMode({
    required int? previousVersionCode,
    required DateTime? installTime,
    required DateTime? updateTime,
    bool hasLegacyPreferences = false,
  }) {
    if (previousVersionCode != null) {
      return previousVersionCode < darkThemeVersionCode
          ? ThemeMode.light
          : ThemeMode.system;
    }
    if (hasLegacyPreferences) return ThemeMode.light;
    if (installTime == null || updateTime == null) return ThemeMode.system;
    final wasUpdated =
        updateTime.difference(installTime) > _updateDetectionTolerance;
    return wasUpdated ? ThemeMode.light : ThemeMode.system;
  }

  static void set(ThemeMode value) {
    if (mode.value == value) return;
    mode.value = value;
    PreferencesService.setThemeMode(value);
  }

  /// Ein fehlendes PackageInfo darf den Start nicht blockieren — ohne die Daten
  /// bleibt es beim System-Theme.
  static Future<PackageInfo?> _packageInfo() async {
    try {
      return await PackageInfo.fromPlatform();
    } catch (_) {
      return null;
    }
  }
}
