// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_video_converter/l10n/app_localizations.dart';
import 'package:simple_video_converter/models/quality_option.dart';
import 'package:simple_video_converter/widgets/quality_selector.dart';

void main() {
  Widget buildSubject({required int sourceShortSide}) => MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: const [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(
      body: QualitySelector(
        selectedIndex: qualityOptions.indexWhere((q) => q.shortSide == 720),
        isConverting: false,
        videoShortSide: sourceShortSide,
        onChanged: (_) {},
      ),
    ),
  );

  testWidgets('offers presets up to the source short side', (tester) async {
    await tester.pumpWidget(buildSubject(sourceShortSide: 720));
    await tester.pumpAndSettle();

    final menu = tester.widget<DropdownMenu<int>>(
      find.byType(DropdownMenu<int>),
    );
    final offeredShortSides = menu.dropdownMenuEntries
        .map((entry) => qualityOptions[entry.value].shortSide)
        .toSet();

    expect(offeredShortSides, containsAll(<int>{720, 480, 360}));
    expect(offeredShortSides, isNot(contains(1080)));
  });

  testWidgets('keeps the lowest preset for smaller sources', (tester) async {
    await tester.pumpWidget(buildSubject(sourceShortSide: 240));
    await tester.pumpAndSettle();

    final menu = tester.widget<DropdownMenu<int>>(
      find.byType(DropdownMenu<int>),
    );
    final offeredShortSides = menu.dropdownMenuEntries
        .map((entry) => qualityOptions[entry.value].shortSide)
        .toSet();

    expect(offeredShortSides, {360});
  });
}
