// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_video_converter/l10n/app_localizations.dart';
import 'package:simple_video_converter/screens/app_settings_screen.dart';
import 'package:simple_video_converter/services/preferences_service.dart';
import 'package:simple_video_converter/services/theme_controller.dart';

void main() {
  void mockPackageInfo({DateTime? installTime, DateTime? updateTime}) {
    final now = DateTime(2026, 8, 7, 12);
    PackageInfo.setMockInitialValues(
      appName: 'Simple Video Converter',
      packageName: 'com.androho.simplevideoconverter',
      version: '2.1.0',
      buildNumber: '${ThemeController.darkThemeVersionCode}',
      buildSignature: '',
      installTime: installTime ?? now,
      updateTime: updateTime ?? now,
    );
  }

  Widget buildSubject() => const MaterialApp(
    locale: Locale('en'),
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    home: AppSettingsScreen(),
  );

  setUp(() {
    ThemeController.mode.value = ThemeMode.system;
    mockPackageInfo();
  });

  test('has no stored theme before the first launch', () async {
    SharedPreferences.setMockInitialValues({});

    expect(await PreferencesService.getThemeMode(), isNull);
  });

  test('persists and reloads the chosen theme', () async {
    SharedPreferences.setMockInitialValues({});

    await PreferencesService.setThemeMode(ThemeMode.dark);
    expect(await PreferencesService.getThemeMode(), ThemeMode.dark);

    await ThemeController.load();
    expect(ThemeController.mode.value, ThemeMode.dark);
  });

  group('initial theme for installations without a stored choice', () {
    test('fresh install follows the system', () {
      final now = DateTime(2026, 8, 7, 12);
      expect(
        ThemeController.initialThemeMode(
          previousVersionCode: null,
          installTime: now,
          updateTime: now,
        ),
        ThemeMode.system,
      );
    });

    test('update from a version without a stored version code stays light', () {
      expect(
        ThemeController.initialThemeMode(
          previousVersionCode: null,
          installTime: DateTime(2026, 3, 1),
          updateTime: DateTime(2026, 8, 7),
        ),
        ThemeMode.light,
      );
    });

    test('update from a version before the dark theme stays light', () {
      expect(
        ThemeController.initialThemeMode(
          previousVersionCode: ThemeController.darkThemeVersionCode - 1,
          installTime: DateTime(2026, 3, 1),
          updateTime: DateTime(2026, 8, 7),
        ),
        ThemeMode.light,
      );
    });

    test('update from the dark theme version follows the system', () {
      expect(
        ThemeController.initialThemeMode(
          previousVersionCode: ThemeController.darkThemeVersionCode,
          installTime: DateTime(2026, 3, 1),
          updateTime: DateTime(2026, 8, 7),
        ),
        ThemeMode.system,
      );
    });

    test('restored preferences on a new device stay light', () {
      final now = DateTime(2026, 8, 7, 12);
      expect(
        ThemeController.initialThemeMode(
          previousVersionCode: null,
          installTime: now,
          updateTime: now,
          hasLegacyPreferences: true,
        ),
        ThemeMode.light,
      );
    });

    test('missing package info falls back to the system theme', () {
      expect(
        ThemeController.initialThemeMode(
          previousVersionCode: null,
          installTime: null,
          updateTime: null,
        ),
        ThemeMode.system,
      );
    });
  });

  test('load pins the light theme for an updated install and stores the '
      'version code', () async {
    SharedPreferences.setMockInitialValues({});
    mockPackageInfo(
      installTime: DateTime(2026, 3, 1),
      updateTime: DateTime(2026, 8, 7),
    );

    await ThemeController.load();

    expect(ThemeController.mode.value, ThemeMode.light);
    expect(await PreferencesService.getThemeMode(), ThemeMode.light);
    expect(
      await PreferencesService.getLastVersionCode(),
      ThemeController.darkThemeVersionCode,
    );
  });

  test('load follows the system on a fresh install', () async {
    SharedPreferences.setMockInitialValues({});
    final now = DateTime(2026, 8, 7, 12);
    mockPackageInfo(installTime: now, updateTime: now);

    await ThemeController.load();

    expect(ThemeController.mode.value, ThemeMode.system);
    expect(await PreferencesService.getThemeMode(), ThemeMode.system);
  });

  test('load pins the light theme when settings came from a backup', () async {
    // Neues Gerät: Installations- und Update-Zeit sind identisch, aber die
    // Einstellungen der alten Version wurden wiederhergestellt.
    SharedPreferences.setMockInitialValues({'conversionCount': 12});
    final now = DateTime(2026, 8, 7, 12);
    mockPackageInfo(installTime: now, updateTime: now);

    await ThemeController.load();

    expect(ThemeController.mode.value, ThemeMode.light);
  });

  testWidgets('theme selection updates the controller and the preferences', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(buildSubject());
    await tester.pumpAndSettle();

    var selector = tester.widget<SegmentedButton<ThemeMode>>(
      find.byType(SegmentedButton<ThemeMode>),
    );
    expect(selector.selected, {ThemeMode.system});

    await tester.tap(find.text('Dark'));
    await tester.pumpAndSettle();

    selector = tester.widget<SegmentedButton<ThemeMode>>(
      find.byType(SegmentedButton<ThemeMode>),
    );
    expect(selector.selected, {ThemeMode.dark});
    expect(ThemeController.mode.value, ThemeMode.dark);
    expect(await PreferencesService.getThemeMode(), ThemeMode.dark);
  });
}
