// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:ui';

/// Wählt zu den Gerätesprachen die passende App-Sprache.
class AppLocaleResolver {
  const AppLocaleResolver._();

  /// Spanisch dieser Regionen läuft über `es_419`. Geräte melden fast nie die
  /// Region 419 selbst, sondern ihr Land, also etwa es-MX.
  static const _latinAmericanRegions = {
    '419', 'AR', 'BO', 'CL', 'CO', 'CR', 'CU', 'DO', 'EC', 'GT', 'HN', 'MX', //
    'NI', 'PA', 'PE', 'PR', 'PY', 'SV', 'US', 'UY', 'VE',
  };

  static const _traditionalChineseRegions = {'TW', 'HK', 'MO'};

  /// Geht die Gerätesprachen in ihrer Reihenfolge durch, damit die
  /// Hauptsprache gewinnt: Ein genauer Treffer für eine weiter unten stehende
  /// Sprache darf sie nicht verdrängen. Innerhalb einer Sprache gilt zuerst
  /// das Land, dann die Sprache ohne Land.
  static Locale resolve(List<Locale>? preferred, Iterable<Locale> supported) {
    for (final device in preferred ?? const <Locale>[]) {
      final wanted = _normalize(device);
      Locale? languageMatch;
      for (final candidate in supported) {
        if (candidate.languageCode != wanted.languageCode) continue;
        if (candidate.countryCode == wanted.countryCode) return candidate;
        if (languageMatch == null || candidate.countryCode == null) {
          languageMatch = candidate;
        }
      }
      if (languageMatch != null) return languageMatch;
    }
    return const Locale('en');
  }

  static Locale _normalize(Locale device) => switch (device.languageCode) {
    // Norwegisch melden Geräte als nb, ältere auch als no. Für Nynorsk gibt es
    // keine eigene Übersetzung, Bokmål liegt am nächsten.
    'no' || 'nn' => const Locale('nb'),
    // Älterer Code für Filipino.
    'tl' => const Locale('fil'),
    'es' when _latinAmericanRegions.contains(device.countryCode) =>
      const Locale('es', '419'),
    // Die Schrift entscheidet vor dem Land, in Hongkong gibt es auch zh-Hans.
    'zh' =>
      _usesTraditionalChinese(device)
          ? const Locale('zh', 'TW')
          : const Locale('zh'),
    _ => device,
  };

  static bool _usesTraditionalChinese(Locale device) {
    final script = device.scriptCode;
    if (script != null) return script == 'Hant';
    return _traditionalChineseRegions.contains(device.countryCode);
  }
}
