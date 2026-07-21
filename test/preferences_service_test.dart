// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_video_converter/services/preferences_service.dart';

void main() {
  group('video codec preference', () {
    test('defaults to H.264', () async {
      SharedPreferences.setMockInitialValues({});

      expect(
        await PreferencesService.getVideoCodec(),
        PreferencesService.videoCodecH264,
      );
    });

    test('persists H.265', () async {
      SharedPreferences.setMockInitialValues({});

      await PreferencesService.setVideoCodec(PreferencesService.videoCodecH265);

      expect(
        await PreferencesService.getVideoCodec(),
        PreferencesService.videoCodecH265,
      );
    });

    test('falls back to H.264 for an unknown stored value', () async {
      SharedPreferences.setMockInitialValues({'videoCodec': 'unknown'});

      expect(
        await PreferencesService.getVideoCodec(),
        PreferencesService.videoCodecH264,
      );
    });
  });
}
