// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_video_converter/l10n/app_localizations.dart';
import 'package:simple_video_converter/screens/app_settings_screen.dart';
import 'package:simple_video_converter/services/preferences_service.dart';

void main() {
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

  testWidgets('selects H.264 by default and persists H.265', (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(buildSubject());
    await tester.pumpAndSettle();

    expect(
      find.text('Video codec for conversions in normal mode'),
      findsOneWidget,
    );

    var selector = tester.widget<SegmentedButton<String>>(
      find.byType(SegmentedButton<String>),
    );
    expect(selector.selected, {PreferencesService.videoCodecH264});

    await tester.tap(find.text('H.265 / HEVC'));
    await tester.pumpAndSettle();

    selector = tester.widget<SegmentedButton<String>>(
      find.byType(SegmentedButton<String>),
    );
    expect(selector.selected, {PreferencesService.videoCodecH265});
    expect(
      await PreferencesService.getVideoCodec(),
      PreferencesService.videoCodecH265,
    );
  });

  testWidgets('shows the codec explanation', (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(buildSubject());
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('H.264 or H.265/HEVC?'));
    await tester.pumpAndSettle();

    expect(find.text('H.264 or H.265/HEVC?'), findsOneWidget);
    expect(
      find.textContaining('Both encoders are included in the app'),
      findsOneWidget,
    );
  });
}
