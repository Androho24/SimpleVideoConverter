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

  testWidgets('switching to a 0–63 codec shifts the CRF value along', (
    tester,
  ) async {
    await tester.pumpWidget(const _ExpertControlsHost());
    await tester.pumpAndSettle();

    // Die CRF-Auswahl trägt ihren Wert als ValueKey.
    expect(find.byKey(const ValueKey(23)), findsOneWidget);

    final av1 = find.byKey(const ValueKey('expert_video_codec_av1'));
    await tester.ensureVisible(av1);
    await tester.tap(av1);
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey(31)), findsOneWidget);

    final h264 = find.byKey(const ValueKey('expert_video_codec_h264'));
    await tester.ensureVisible(h264);
    await tester.tap(h264);
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey(23)), findsOneWidget);
  });

  testWidgets('AV1 chip is hidden unless the experimental option is on', (
    tester,
  ) async {
    await tester.pumpWidget(const _ExpertControlsHost(av1Enabled: false));
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('expert_video_codec_av1')), findsNothing);
    expect(
      find.byKey(const ValueKey('expert_video_codec_vp9')),
      findsOneWidget,
    );
  });

  testWidgets('CRF help text follows the codec scale', (tester) async {
    await tester.pumpWidget(const _ExpertControlsHost());
    await tester.pumpAndSettle();

    Future<void> openCrfInfo() async {
      final info = find.byTooltip('CRF — Video quality');
      await tester.ensureVisible(info);
      await tester.tap(info);
      await tester.pumpAndSettle();
    }

    await openCrfInfo();
    expect(find.textContaining('Recommended: 18–28'), findsOneWidget);
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    final av1 = find.byKey(const ValueKey('expert_video_codec_av1'));
    await tester.ensureVisible(av1);
    await tester.tap(av1);
    await tester.pumpAndSettle();

    await openCrfInfo();
    expect(find.textContaining('Recommended: 25–38'), findsOneWidget);
    expect(find.textContaining('0–63 scale'), findsOneWidget);
  });

  testWidgets('the pencil writes a custom bitrate into the dropdown', (
    tester,
  ) async {
    await tester.pumpWidget(const _ExpertControlsHost());
    await tester.pumpAndSettle();

    final bitrateMode = find.text('Bitrate');
    await tester.ensureVisible(bitrateMode);
    await tester.tap(bitrateMode);
    await tester.pumpAndSettle();

    // Vorgabe 5000 kbps aus ExpertSettings.
    expect(find.widgetWithText(TextField, '5 Mbps'), findsOneWidget);

    final edit = find.byKey(const ValueKey('expert_target_bitrate_edit'));
    await tester.ensureVisible(edit);
    await tester.tap(edit);
    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(const ValueKey('target_bitrate_field')),
      '3.5',
    );
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    // Ein Wert, den das Dropdown gar nicht anbietet, muss trotzdem ankommen.
    expect(find.widgetWithText(TextField, '3.5 Mbps'), findsOneWidget);
  });

  testWidgets('the bitrate field itself is not typeable', (tester) async {
    await tester.pumpWidget(const _ExpertControlsHost());
    await tester.pumpAndSettle();

    final bitrateMode = find.text('Bitrate');
    await tester.ensureVisible(bitrateMode);
    await tester.tap(bitrateMode);
    await tester.pumpAndSettle();

    final menu = tester.widget<DropdownMenu<int>>(
      find.byKey(const ValueKey('expert_target_bitrate_menu')),
    );
    expect(menu.requestFocusOnTap, isFalse);
  });
}

class _ExpertControlsHost extends StatefulWidget {
  final bool av1Enabled;

  const _ExpertControlsHost({this.av1Enabled = true});

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
          av1Enabled: widget.av1Enabled,
          onChanged: (value) => setState(() => settings = value),
        ),
      ),
    ),
  );
}
