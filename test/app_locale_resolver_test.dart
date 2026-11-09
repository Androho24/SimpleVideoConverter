// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:simple_video_converter/l10n/app_localizations.dart';
import 'package:simple_video_converter/services/app_locale_resolver.dart';

void main() {
  Locale resolve(List<Locale> device) =>
      AppLocaleResolver.resolve(device, AppLocalizations.supportedLocales);

  group('AppLocaleResolver', () {
    test('uses Latin American Spanish for its countries only', () {
      expect(resolve([const Locale('es', 'MX')]), const Locale('es', '419'));
      expect(resolve([const Locale('es', 'AR')]), const Locale('es', '419'));
      expect(resolve([const Locale('es', '419')]), const Locale('es', '419'));
      expect(resolve([const Locale('es', 'ES')]), const Locale('es'));
      expect(resolve([const Locale('es')]), const Locale('es'));
    });

    test('splits Chinese by script before country', () {
      Locale zh(String script, String country) => resolve([
        Locale.fromSubtags(
          languageCode: 'zh',
          scriptCode: script,
          countryCode: country,
        ),
      ]);
      expect(zh('Hans', 'CN'), const Locale('zh'));
      expect(zh('Hant', 'TW'), const Locale('zh', 'TW'));
      expect(zh('Hant', 'HK'), const Locale('zh', 'TW'));
      expect(zh('Hans', 'HK'), const Locale('zh'));
      expect(resolve([const Locale('zh', 'HK')]), const Locale('zh', 'TW'));
      expect(resolve([const Locale('zh', 'CN')]), const Locale('zh'));
    });

    test('maps the variants of Norwegian and Filipino', () {
      for (final code in ['nb', 'no', 'nn']) {
        expect(resolve([Locale(code, 'NO')]), const Locale('nb'), reason: code);
      }
      for (final code in ['fil', 'tl']) {
        expect(
          resolve([Locale(code, 'PH')]),
          const Locale('fil'),
          reason: code,
        );
      }
    });

    test('keeps Brazilian and European Portuguese apart', () {
      expect(resolve([const Locale('pt', 'BR')]), const Locale('pt', 'BR'));
      expect(resolve([const Locale('pt', 'PT')]), const Locale('pt'));
    });

    test('prefers the main language over an exact later match', () {
      expect(
        resolve([const Locale('de', 'DE'), const Locale('pt', 'BR')]),
        const Locale('de'),
      );
      expect(
        resolve([const Locale('de', 'DE'), const Locale('es', 'MX')]),
        const Locale('de'),
      );
    });

    test('skips unsupported languages and falls back to English', () {
      expect(
        resolve([const Locale('sw', 'KE'), const Locale('fr', 'CA')]),
        const Locale('fr'),
      );
      expect(resolve([const Locale('sw', 'KE')]), const Locale('en'));
      expect(
        AppLocaleResolver.resolve(null, AppLocalizations.supportedLocales),
        const Locale('en'),
      );
    });
  });

  group('every app language', () {
    test('has all 34 locales', () {
      expect(AppLocalizations.supportedLocales, hasLength(34));
    });

    for (final locale in AppLocalizations.supportedLocales) {
      test('$locale is supported by Flutter and intl', () async {
        expect(
          GlobalMaterialLocalizations.delegate.isSupported(locale),
          isTrue,
        );
        expect(
          GlobalCupertinoLocalizations.delegate.isSupported(locale),
          isTrue,
        );
        expect(GlobalWidgetsLocalizations.delegate.isSupported(locale), isTrue);
        final l = await AppLocalizations.delegate.load(locale);
        expect(l.subtitleModeBurnIn, isNotEmpty);
        // Die Ladeanzeige formatiert damit die Prozentzahl, eine von intl
        // nicht gekannte Sprache würde dort eine Ausnahme werfen.
        expect(
          NumberFormat.percentPattern(locale.toString()).format(0.5),
          contains('50'),
        );
      });
    }
  });
}
