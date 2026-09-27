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

  group('hardware encoder switch', () {
    final hwSwitch = find.byKey(const ValueKey('expert_hardware_encoder'));
    final hdrHint = find.byKey(
      const ValueKey('expert_hardware_encoder_hdr_hint'),
    );

    Future<void> selectCodec(WidgetTester tester, String codec) async {
      final chip = find.byKey(ValueKey('expert_video_codec_$codec'));
      await tester.ensureVisible(chip);
      await tester.tap(chip);
      await tester.pumpAndSettle();
    }

    Future<void> toggleSwitch(WidgetTester tester) async {
      await tester.ensureVisible(hwSwitch);
      await tester.tap(hwSwitch);
      await tester.pumpAndSettle();
    }

    ButtonSegment<String> crfSegment(WidgetTester tester) => tester
        .widget<SegmentedButton<String>>(find.byType(SegmentedButton<String>))
        .segments
        .firstWhere((segment) => segment.value == 'crf');

    testWidgets('appears only for H.265 on devices with hardware', (
      tester,
    ) async {
      await tester.pumpWidget(
        const _ExpertControlsHost(hardwareHevcAvailable: true),
      );
      await tester.pumpAndSettle();
      expect(hwSwitch, findsNothing);

      await selectCodec(tester, 'h265');
      expect(hwSwitch, findsOneWidget);

      await tester.pumpWidget(const _ExpertControlsHost(key: ValueKey('b')));
      await tester.pumpAndSettle();
      await selectCodec(tester, 'h265');
      expect(hwSwitch, findsNothing);
    });

    testWidgets('forces bitrate mode; choosing CRF turns it off again', (
      tester,
    ) async {
      await tester.pumpWidget(
        const _ExpertControlsHost(hardwareHevcAvailable: true),
      );
      await tester.pumpAndSettle();
      await selectCodec(tester, 'h265');
      expect(crfSegment(tester).enabled, isTrue);

      await toggleSwitch(tester);

      final state = tester.state<_ExpertControlsHostState>(
        find.byType(_ExpertControlsHost),
      );
      expect(state.settings.hardwareEncoder, isTrue);
      expect(state.settings.bitrateMode, 'bitrate');
      expect(crfSegment(tester).enabled, isTrue);
      expect(hdrHint, findsNothing);

      final crf = find.text('Quality (CRF)');
      await tester.ensureVisible(crf);
      await tester.tap(crf);
      await tester.pumpAndSettle();

      expect(state.settings.bitrateMode, 'crf');
      expect(state.settings.hardwareEncoder, isFalse);
      expect(
        find.textContaining('Hardware encoder turned off'),
        findsOneWidget,
      );
    });

    testWidgets('is reset when switching away from H.265', (tester) async {
      await tester.pumpWidget(
        const _ExpertControlsHost(hardwareHevcAvailable: true),
      );
      await tester.pumpAndSettle();
      await selectCodec(tester, 'h265');
      await toggleSwitch(tester);

      await selectCodec(tester, 'h264');
      final state = tester.state<_ExpertControlsHostState>(
        find.byType(_ExpertControlsHost),
      );
      expect(state.settings.hardwareEncoder, isFalse);

      await selectCodec(tester, 'h265');
      expect(tester.widget<SwitchListTile>(hwSwitch).value, isFalse);
      expect(crfSegment(tester).enabled, isTrue);
    });

    testWidgets('keeps the switch on MKV but shows the software hint', (
      tester,
    ) async {
      final containerHint = find.byKey(
        const ValueKey('expert_hardware_encoder_container_hint'),
      );
      await tester.pumpWidget(
        const _ExpertControlsHost(hardwareHevcAvailable: true),
      );
      await tester.pumpAndSettle();
      await selectCodec(tester, 'h265');
      await toggleSwitch(tester);
      expect(containerHint, findsNothing);

      final mkv = find.byKey(const ValueKey('expert_container_mkv'));
      await tester.ensureVisible(mkv);
      await tester.tap(mkv);
      await tester.pumpAndSettle();

      expect(tester.widget<SwitchListTile>(hwSwitch).value, isTrue);
      expect(containerHint, findsOneWidget);
      expect(find.textContaining('MKV is not supported'), findsOneWidget);
    });

    testWidgets('shows the software hint for HDR sources', (tester) async {
      await tester.pumpWidget(
        const _ExpertControlsHost(
          hardwareHevcAvailable: true,
          hdrTransfer: 'arib-std-b67',
        ),
      );
      await tester.pumpAndSettle();
      await selectCodec(tester, 'h265');
      expect(hdrHint, findsNothing);

      await toggleSwitch(tester);
      expect(hdrHint, findsOneWidget);
    });
  });

  group('resolution preset menu', () {
    final menu = find.byWidgetPredicate((widget) {
      final key = widget.key;
      return widget is DropdownMenu<int> &&
          key is ValueKey<String> &&
          key.value.startsWith('expert_resolution_preset_');
    });

    _ExpertControlsHostState host(WidgetTester tester) =>
        tester.state(find.byType(_ExpertControlsHost));

    Future<void> choose(WidgetTester tester, String label) async {
      await tester.ensureVisible(menu);
      await tester.tap(menu);
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(MenuItemButton, label).last);
      await tester.pumpAndSettle();
    }

    testWidgets('sets both sides from the short side of a landscape source', (
      tester,
    ) async {
      await tester.pumpWidget(const _ExpertControlsHost());
      await tester.pumpAndSettle();

      await choose(tester, '720p');

      expect(host(tester).settings.resolutionPreset, 720);
      expect(host(tester).settings.width, 1280);
      expect(host(tester).settings.height, 720);
      expect(find.widgetWithText(TextField, '1280'), findsOneWidget);
    });

    testWidgets('keeps portrait orientation', (tester) async {
      await tester.pumpWidget(
        const _ExpertControlsHost(sourceWidth: 1080, sourceHeight: 1920),
      );
      await tester.pumpAndSettle();

      await choose(tester, '480p');

      expect(host(tester).settings.width, 480);
      expect(host(tester).settings.height, 854);
    });

    testWidgets('offers no presets at or above the source resolution', (
      tester,
    ) async {
      await tester.pumpWidget(const _ExpertControlsHost());
      await tester.pumpAndSettle();

      final entries = tester
          .widget<DropdownMenu<int>>(menu)
          .dropdownMenuEntries;
      bool enabled(int value) =>
          entries.firstWhere((entry) => entry.value == value).enabled;

      expect(enabled(2160), isFalse);
      expect(enabled(1080), isFalse);
      expect(enabled(720), isTrue);
    });

    testWidgets('switches to custom after typing and back to original', (
      tester,
    ) async {
      await tester.pumpWidget(const _ExpertControlsHost());
      await tester.pumpAndSettle();

      final widthField = find.widgetWithText(TextField, '1920');
      await tester.ensureVisible(widthField);
      await tester.enterText(widthField, '1000');
      await tester.pumpAndSettle();

      expect(
        host(tester).settings.resolutionPreset,
        ExpertSettings.customResolution,
      );
      expect(find.text('Custom'), findsWidgets);

      await choose(tester, 'Original');

      expect(host(tester).settings.resolutionPreset, 0);
      expect(host(tester).settings.width, 1920);
      expect(host(tester).settings.height, 1080);
    });
  });
}

class _ExpertControlsHost extends StatefulWidget {
  final bool av1Enabled;
  final bool hardwareHevcAvailable;
  final String? hdrTransfer;
  final int sourceWidth;
  final int sourceHeight;

  const _ExpertControlsHost({
    super.key,
    this.sourceWidth = 1920,
    this.sourceHeight = 1080,
    this.av1Enabled = true,
    this.hardwareHevcAvailable = false,
    this.hdrTransfer,
  });

  @override
  State<_ExpertControlsHost> createState() => _ExpertControlsHostState();
}

class _ExpertControlsHostState extends State<_ExpertControlsHost> {
  late ExpertSettings settings = ExpertSettings(
    width: widget.sourceWidth,
    height: widget.sourceHeight,
  );
  // Einmal pro Host: Eine neue Instanz je Build gilt in ExpertControls als
  // neues Video und löst dort endlos Updates aus.
  late final metadata = VideoMetadata(
    durationMs: 60000,
    width: widget.sourceWidth,
    height: widget.sourceHeight,
    audioChannels: 6,
    hdrTransfer: widget.hdrTransfer,
  );

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
          metadata: metadata,
          isConverting: false,
          av1Enabled: widget.av1Enabled,
          hardwareHevcAvailable: widget.hardwareHevcAvailable,
          onChanged: (value) => setState(() => settings = value),
        ),
      ),
    ),
  );
}
