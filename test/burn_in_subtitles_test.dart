// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_video_converter/l10n/app_localizations.dart';
import 'package:simple_video_converter/models/burn_in_subtitle.dart';
import 'package:simple_video_converter/models/expert_settings.dart';
import 'package:simple_video_converter/services/subtitle_service.dart';
import 'package:simple_video_converter/widgets/expert_controls.dart';

const _validSrt =
    '1\r\n00:00:01,000 --> 00:00:03,000\r\nHallo\r\n\r\n'
    '2\r\n00:00:03,000 --> 00:00:05,000\r\nWelt\r\n';

const _validAss = '''
[Script Info]
ScriptType: v4.00+

[Events]
Format: Layer, Start, End, Style, Name, MarginL, MarginR, MarginV, Effect, Text
Dialogue: 0,0:00:01.00,0:00:05.00,Default,,0,0,0,,Hallo
''';

const _subtitle = BurnInSubtitle(
  path: '/cache/burn_in_subtitles/subtitle_1.srt',
  displayName: 'Mein Film (2024).de.srt',
  format: SubtitleFormat.srt,
);

void main() {
  group('formatForName', () {
    test('recognizes srt and ass regardless of case', () {
      expect(SubtitleService.formatForName('a.srt'), SubtitleFormat.srt);
      expect(SubtitleService.formatForName('A.SRT'), SubtitleFormat.srt);
      expect(SubtitleService.formatForName('b.c.Ass'), SubtitleFormat.ass);
    });

    test('rejects everything else', () {
      expect(SubtitleService.formatForName('a.vtt'), isNull);
      expect(SubtitleService.formatForName('srt'), isNull);
      expect(SubtitleService.formatForName('a.srt.txt'), isNull);
    });
  });

  group('legacyCharsetFor', () {
    test('picks the legacy encoding of the app language', () {
      expect(SubtitleService.legacyCharsetFor('cs'), 'windows-1250');
      expect(SubtitleService.legacyCharsetFor('pl'), 'windows-1250');
      expect(SubtitleService.legacyCharsetFor('ru'), 'windows-1251');
      expect(SubtitleService.legacyCharsetFor('uk'), 'windows-1251');
      expect(SubtitleService.legacyCharsetFor('tr'), 'windows-1254');
      expect(SubtitleService.legacyCharsetFor('th'), 'TIS-620');
      expect(SubtitleService.legacyCharsetFor('ja'), 'Shift_JIS');
    });

    test('leaves western languages and Hindi on Windows-1252', () {
      for (final code in [
        'en',
        'de',
        'es',
        'fr',
        'it',
        'nl',
        'pt',
        'id',
        'hi',
      ]) {
        expect(SubtitleService.legacyCharsetFor(code), isNull, reason: code);
      }
    });
  });

  group('decodeText', () {
    TestWidgetsFlutterBinding.ensureInitialized();
    const channel = MethodChannel('com.androho.simplevideoconverter/subtitles');
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    late List<MethodCall> calls;

    setUp(() {
      calls = [];
      messenger.setMockMethodCallHandler(channel, (call) async {
        calls.add(call);
        return 'vom Gerät';
      });
    });

    tearDown(() => messenger.setMockMethodCallHandler(channel, null));

    Uint8List bytes(List<int> values) => Uint8List.fromList(values);
    final legacyBytes = bytes([0x47, 0x72, 0xFC, 0xDF, 0x80]);

    Future<String> decode(Uint8List data, [String language = 'en']) =>
        SubtitleService.decodeText(data, languageCode: language);

    test('keeps valid UTF-8 in every app language', () async {
      final encoded = Uint8List.fromList(utf8.encode('Grüße €'));
      expect(await decode(encoded), 'Grüße €');
      expect(await decode(encoded, 'ja'), 'Grüße €');
      expect(calls, isEmpty);
    });

    test('strips a UTF-8 byte order mark', () async {
      expect(await decode(bytes([0xEF, 0xBB, 0xBF, 0x41]), 'ru'), 'A');
      expect(calls, isEmpty);
    });

    test('decodes UTF-16 in both byte orders', () async {
      expect(await decode(bytes([0xFF, 0xFE, 0xFC, 0x00]), 'ja'), 'ü');
      expect(await decode(bytes([0xFE, 0xFF, 0x00, 0xFC]), 'ja'), 'ü');
      expect(calls, isEmpty);
    });

    test('western languages use Windows-1252 without the channel', () async {
      expect(await decode(legacyBytes, 'de'), 'Grüß€');
      expect(calls, isEmpty);
    });

    test('other languages ask Android for their legacy encoding', () async {
      expect(await decode(legacyBytes, 'ja'), 'vom Gerät');
      expect(calls.single.method, 'decodeLegacyText');
      expect(calls.single.arguments['charset'], 'Shift_JIS');
      expect(calls.single.arguments['bytes'], legacyBytes);
    });

    test('falls back to Windows-1252 if Android cannot decode', () async {
      messenger.setMockMethodCallHandler(channel, (_) async => null);
      expect(await decode(legacyBytes, 'ru'), 'Grüß€');

      messenger.setMockMethodCallHandler(
        channel,
        (_) async => throw PlatformException(code: 'failed'),
      );
      expect(await decode(legacyBytes, 'ru'), 'Grüß€');
    });
  });

  group('hasSubtitles', () {
    test('accepts well-formed SRT, also with dot millis and leading lines', () {
      expect(
        SubtitleService.hasSubtitles(_validSrt, SubtitleFormat.srt),
        isTrue,
      );
      expect(
        SubtitleService.hasSubtitles(
          '\n\n1\n00:00:01.000 --> 00:00:03.000\nHallo\n',
          SubtitleFormat.srt,
        ),
        isTrue,
      );
    });

    test('rejects what the FFmpeg SRT demuxer would reject', () {
      for (final text in [
        '',
        'nur Text ohne Zeitangaben',
        '00:00:01,000 --> 00:00:03,000\nohne Nummer\n',
        '1\n00:00:01,000-->00:00:03,000\nohne Leerzeichen\n',
      ]) {
        expect(
          SubtitleService.hasSubtitles(text, SubtitleFormat.srt),
          isFalse,
          reason: text,
        );
      }
    });

    test('accepts ASS with script type or a styles section', () {
      expect(
        SubtitleService.hasSubtitles(_validAss, SubtitleFormat.ass),
        isTrue,
      );
      expect(
        SubtitleService.hasSubtitles(
          _validAss.replaceFirst('ScriptType: v4.00+', '[V4+ Styles]'),
          SubtitleFormat.ass,
        ),
        isTrue,
      );
    });

    test('rejects ASS that libass cannot read', () {
      for (final text in [
        'kein ass',
        _validAss.replaceFirst('ScriptType: v4.00+', ''),
        _validAss.replaceFirst('Dialogue:', 'Comment:'),
        _validAss.replaceFirst('[Events]', ''),
      ]) {
        expect(
          SubtitleService.hasSubtitles(text, SubtitleFormat.ass),
          isFalse,
          reason: text,
        );
      }
    });

    test('rejects binary data even with matching lines', () {
      expect(
        SubtitleService.hasSubtitles('$_validSrt\u0000', SubtitleFormat.srt),
        isFalse,
      );
    });
  });

  group('ExpertSettings.burnInSubtitle', () {
    test('is off by default', () {
      expect(const ExpertSettings().burnInSubtitle, isNull);
    });

    test('survives unrelated copies and can be cleared', () {
      final settings = const ExpertSettings().copyWith(
        burnInSubtitle: _subtitle,
      );
      expect(settings.copyWith(crf: 30).burnInSubtitle, same(_subtitle));
      expect(
        settings.copyWith(clearBurnInSubtitle: true).burnInSubtitle,
        isNull,
      );
    });
  });

  group('ExpertSettings subtitle style', () {
    test('defaults to medium, bottom and no background', () {
      const settings = ExpertSettings();
      expect(settings.subtitleTextSize, SubtitleTextSize.medium);
      expect(settings.subtitlePosition, SubtitlePosition.bottom);
      expect(settings.subtitleBackground, isFalse);
    });

    test('survives removing the subtitle file', () {
      final settings = const ExpertSettings(
        burnInSubtitle: _subtitle,
      ).copyWith(subtitleTextSize: SubtitleTextSize.large);
      expect(
        settings.copyWith(clearBurnInSubtitle: true).subtitleTextSize,
        SubtitleTextSize.large,
      );
    });
  });

  group('SRT style controls', () {
    const styleKeys = [
      ValueKey('expert_subtitle_text_size'),
      ValueKey('expert_subtitle_position'),
      ValueKey('expert_subtitle_background'),
    ];

    Widget host(
      ExpertSettings settings,
      ValueChanged<ExpertSettings> onChanged,
    ) => MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: SingleChildScrollView(
          child: ExpertControls(
            settings: settings,
            isConverting: false,
            onChanged: onChanged,
          ),
        ),
      ),
    );

    testWidgets('appear for an SRT file', (tester) async {
      await tester.pumpWidget(
        host(const ExpertSettings(burnInSubtitle: _subtitle), (_) {}),
      );
      await tester.pumpAndSettle();

      for (final key in styleKeys) {
        expect(find.byKey(key), findsOneWidget);
      }
    });

    testWidgets('stay hidden without a file and for ASS', (tester) async {
      await tester.pumpWidget(host(const ExpertSettings(), (_) {}));
      await tester.pumpAndSettle();
      for (final key in styleKeys) {
        expect(find.byKey(key), findsNothing);
      }

      await tester.pumpWidget(
        host(
          const ExpertSettings(
            burnInSubtitle: BurnInSubtitle(
              path: '/cache/subtitle_1.ass',
              displayName: 'film.ass',
              format: SubtitleFormat.ass,
            ),
          ),
          (_) {},
        ),
      );
      await tester.pumpAndSettle();
      for (final key in styleKeys) {
        expect(find.byKey(key), findsNothing);
      }
    });

    testWidgets('report changes', (tester) async {
      ExpertSettings? latest;
      await tester.pumpWidget(
        host(
          const ExpertSettings(burnInSubtitle: _subtitle),
          (s) => latest = s,
        ),
      );
      await tester.pumpAndSettle();

      Future<void> tapText(String text) async {
        final target = find.text(text);
        await tester.ensureVisible(target);
        await tester.pumpAndSettle();
        await tester.tap(target);
        await tester.pumpAndSettle();
      }

      await tapText('Large');
      expect(latest?.subtitleTextSize, SubtitleTextSize.large);
      await tapText('Top');
      expect(latest?.subtitlePosition, SubtitlePosition.top);
      await tapText('Grey background');
      expect(latest?.subtitleBackground, isTrue);
    });
  });

  group('ExpertControls', () {
    Widget host({
      ExpertSettings settings = const ExpertSettings(),
      VoidCallback? onPick,
      VoidCallback? onRemove,
    }) => MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: SingleChildScrollView(
          child: ExpertControls(
            settings: settings,
            isConverting: false,
            onChanged: (_) {},
            onPickSubtitle: onPick,
            onRemoveSubtitle: onRemove,
          ),
        ),
      ),
    );

    testWidgets('sits directly below the output format', (tester) async {
      await tester.pumpWidget(host());
      await tester.pumpAndSettle();

      final outputFormat = find.byKey(const ValueKey('expert_container_mp4'));
      final hint = find.textContaining('is supported by');
      final label = find.text('Burn-in Subtitles');
      expect(
        tester.getTopLeft(outputFormat).dy,
        lessThan(tester.getTopLeft(hint).dy),
      );
      expect(tester.getTopLeft(hint).dy, lessThan(tester.getTopLeft(label).dy));
    });

    testWidgets('starts without a file and opens the picker', (tester) async {
      var picks = 0;
      await tester.pumpWidget(host(onPick: () => picks++));
      await tester.pumpAndSettle();

      expect(
        find.byKey(const ValueKey('expert_subtitle_selected')),
        findsNothing,
      );
      final select = find.byKey(const ValueKey('expert_subtitle_select'));
      await tester.ensureVisible(select);
      await tester.pumpAndSettle();
      await tester.tap(select);
      expect(picks, 1);
    });

    testWidgets('shows the file name and removes the file', (tester) async {
      var removals = 0;
      await tester.pumpWidget(
        host(
          settings: const ExpertSettings(burnInSubtitle: _subtitle),
          onRemove: () => removals++,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Mein Film (2024).de.srt'), findsOneWidget);
      expect(
        find.byKey(const ValueKey('expert_subtitle_select')),
        findsNothing,
      );
      final remove = find.byKey(const ValueKey('expert_subtitle_remove'));
      await tester.ensureVisible(remove);
      await tester.pumpAndSettle();
      await tester.tap(remove);
      expect(removals, 1);
    });

    testWidgets('is hidden in audio-only mode', (tester) async {
      await tester.pumpWidget(
        host(settings: const ExpertSettings(audioOnly: true)),
      );
      await tester.pumpAndSettle();

      expect(find.text('Burn-in Subtitles'), findsNothing);
    });
  });
}
