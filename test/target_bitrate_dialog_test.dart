// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_video_converter/l10n/app_localizations.dart';
import 'package:simple_video_converter/widgets/target_bitrate_dialog.dart';

void main() {
  group('parseTargetBitrateInput', () {
    test('reads kbps and Mbps', () {
      expect(parseTargetBitrateInput('8000', isMbps: false), 8000);
      expect(parseTargetBitrateInput('8', isMbps: true), 8000);
      expect(parseTargetBitrateInput('0.5', isMbps: true), 500);
      expect(parseTargetBitrateInput('8,5', isMbps: true), 8500);
      expect(parseTargetBitrateInput(' 1200 ', isMbps: false), 1200);
      expect(parseTargetBitrateInput('100', isMbps: true), 100000);
    });

    test('rejects values outside the allowed range', () {
      expect(parseTargetBitrateInput('499', isMbps: false), isNull);
      expect(parseTargetBitrateInput('100001', isMbps: false), isNull);
      expect(parseTargetBitrateInput('0.4', isMbps: true), isNull);
      expect(parseTargetBitrateInput('101', isMbps: true), isNull);
    });

    test('rejects anything that is not a number', () {
      expect(parseTargetBitrateInput('', isMbps: false), isNull);
      expect(parseTargetBitrateInput('8 Mbps', isMbps: true), isNull);
    });
  });

  group('formatTargetBitrateInput', () {
    test('drops the decimal when the Mbps value is whole', () {
      expect(formatTargetBitrateInput(8000, isMbps: true), '8');
      expect(formatTargetBitrateInput(8500, isMbps: true), '8.5');
      expect(formatTargetBitrateInput(8000, isMbps: false), '8000');
    });
  });

  /// Sammelt das Ergebnis des Dialogs; wird erst nach dem Schließen gefüllt.
  Future<List<int?>> openDialog(WidgetTester tester) async {
    final results = <int?>[];
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () async {
                results.add(
                  await showTargetBitrateDialog(context, currentKbps: 4000),
                );
              },
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    return results;
  }

  testWidgets('prefills the current value in Mbps', (tester) async {
    await openDialog(tester);

    final field = tester.widget<TextField>(
      find.byKey(const ValueKey('target_bitrate_field')),
    );
    expect(field.controller!.text, '4');
    expect(find.text('Allowed range: 0.5–100 Mbps'), findsOneWidget);
  });

  testWidgets('converts the typed value when the unit changes', (tester) async {
    await openDialog(tester);

    await tester.tap(find.text('kbps'));
    await tester.pumpAndSettle();

    final field = tester.widget<TextField>(
      find.byKey(const ValueKey('target_bitrate_field')),
    );
    expect(field.controller!.text, '4000');
    expect(find.text('Allowed range: 500–100000 kbps'), findsOneWidget);
  });

  testWidgets('OK returns the entered value in kbps', (tester) async {
    final results = await openDialog(tester);

    await tester.enterText(
      find.byKey(const ValueKey('target_bitrate_field')),
      '6.5',
    );
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsNothing);
    expect(results, [6500]);
  });

  testWidgets('keeps the dialog open and shows the range when invalid', (
    tester,
  ) async {
    await openDialog(tester);

    await tester.enterText(
      find.byKey(const ValueKey('target_bitrate_field')),
      '101',
    );
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsOneWidget);
    final field = tester.widget<TextField>(
      find.byKey(const ValueKey('target_bitrate_field')),
    );
    expect(field.decoration!.errorText, 'Allowed range: 0.5–100 Mbps');
  });

  testWidgets('Cancel discards the input', (tester) async {
    final results = await openDialog(tester);

    await tester.enterText(
      find.byKey(const ValueKey('target_bitrate_field')),
      '12',
    );
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(find.byType(AlertDialog), findsNothing);
    expect(results, [null]);
  });
}
