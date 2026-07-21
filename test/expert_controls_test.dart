// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_video_converter/l10n/app_localizations.dart';
import 'package:simple_video_converter/models/expert_settings.dart';
import 'package:simple_video_converter/models/video_metadata.dart';
import 'package:simple_video_converter/widgets/expert_controls.dart';

void main() {
  testWidgets('places video codec directly above output format', (
    tester,
  ) async {
    await tester.pumpWidget(const _ExpertControlsHost());
    await tester.pumpAndSettle();

    final videoCodec = find.byKey(const ValueKey('expert_video_codec_h264'));
    final outputFormat = find.byKey(const ValueKey('expert_container_mp4'));
    expect(
      tester.getTopLeft(videoCodec).dy,
      lessThan(tester.getTopLeft(outputFormat).dy),
    );
  });

  testWidgets('dimmed output format selects its default compatible codecs', (
    tester,
  ) async {
    await tester.pumpWidget(const _ExpertControlsHost());
    await tester.pumpAndSettle();

    ChoiceChip chip(String key) =>
        tester.widget<ChoiceChip>(find.byKey(ValueKey(key)));

    expect(chip('expert_container_mp4').onSelected, isNotNull);
    expect(chip('expert_container_mkv').onSelected, isNotNull);
    expect(chip('expert_container_webm').onSelected, isNotNull);
    expect(chip('expert_container_mp4').labelStyle, isNull);
    expect(chip('expert_container_webm').labelStyle?.color, isNotNull);

    final opus = find.byKey(const ValueKey('expert_audio_codec_opus'));
    await tester.ensureVisible(opus);
    await tester.tap(opus);
    await tester.pumpAndSettle();

    expect(find.text('Output format changed to MKV.'), findsOneWidget);
    expect(chip('expert_container_mkv').selected, isTrue);

    final h265 = find.byKey(const ValueKey('expert_video_codec_h265'));
    await tester.ensureVisible(h265);
    await tester.tap(h265);
    await tester.pumpAndSettle();

    expect(chip('expert_video_codec_h265').selected, isTrue);
    expect(chip('expert_audio_codec_opus').selected, isTrue);
    expect(chip('expert_container_mp4').labelStyle?.color, isNotNull);

    final mp4 = find.byKey(const ValueKey('expert_container_mp4'));
    await tester.ensureVisible(mp4);
    await tester.tap(mp4);
    await tester.pumpAndSettle();

    expect(chip('expert_container_mp4').selected, isTrue);
    expect(chip('expert_video_codec_h264').selected, isTrue);
    expect(chip('expert_audio_codec_aac').selected, isTrue);
    expect(chip('expert_container_mp4').labelStyle, isNull);
  });

  testWidgets('WebM selection switches to VP9 and Opus defaults', (
    tester,
  ) async {
    await tester.pumpWidget(const _ExpertControlsHost());
    await tester.pumpAndSettle();

    final webm = find.byKey(const ValueKey('expert_container_webm'));
    await tester.ensureVisible(webm);
    await tester.tap(webm);
    await tester.pumpAndSettle();

    ChoiceChip chip(String key) =>
        tester.widget<ChoiceChip>(find.byKey(ValueKey(key)));
    expect(chip('expert_container_webm').selected, isTrue);
    expect(chip('expert_video_codec_vp9').selected, isTrue);
    expect(chip('expert_audio_codec_opus').selected, isTrue);
    expect(find.textContaining('VP9 + Opus'), findsOneWidget);
  });
}

class _ExpertControlsHost extends StatefulWidget {
  const _ExpertControlsHost();

  @override
  State<_ExpertControlsHost> createState() => _ExpertControlsHostState();
}

class _ExpertControlsHostState extends State<_ExpertControlsHost> {
  ExpertSettings settings = const ExpertSettings(width: 1920, height: 1080);

  @override
  Widget build(BuildContext context) => MaterialApp(
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
        padding: const EdgeInsets.all(16),
        child: ExpertControls(
          settings: settings,
          metadata: const VideoMetadata(
            durationMs: 60000,
            width: 1920,
            height: 1080,
            audioChannels: 6,
          ),
          isConverting: false,
          onChanged: (value) => setState(() => settings = value),
        ),
      ),
    ),
  );
}
