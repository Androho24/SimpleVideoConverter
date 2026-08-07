// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_video_converter/services/video_quality_scale.dart';

void main() {
  test('uses the 0–63 scale only for VP9 and AV1', () {
    expect(VideoQualityScale.maxCrf('vp9'), 63);
    expect(VideoQualityScale.maxCrf('av1'), 63);
    expect(VideoQualityScale.maxCrf('h264'), 51);
    expect(VideoQualityScale.maxCrf('h265'), 51);
    expect(VideoQualityScale.maxCrf('xvid'), 51);
  });

  test('shifts CRF when switching between the two scales', () {
    expect(
      VideoQualityScale.convertCrf(23, fromCodec: 'h264', toCodec: 'av1'),
      31,
    );
    expect(
      VideoQualityScale.convertCrf(31, fromCodec: 'vp9', toCodec: 'h264'),
      23,
    );
  });

  test('keeps CRF untouched within the same scale', () {
    expect(
      VideoQualityScale.convertCrf(23, fromCodec: 'h264', toCodec: 'h265'),
      23,
    );
    expect(
      VideoQualityScale.convertCrf(31, fromCodec: 'vp9', toCodec: 'av1'),
      31,
    );
  });

  test('stays inside the target scale at both ends', () {
    expect(
      VideoQualityScale.convertCrf(1, fromCodec: 'av1', toCodec: 'h264'),
      1,
    );
    expect(
      VideoQualityScale.convertCrf(63, fromCodec: 'av1', toCodec: 'h264'),
      51,
    );
    expect(
      VideoQualityScale.convertCrf(51, fromCodec: 'h264', toCodec: 'av1'),
      59,
    );
  });

  test('round-trips the default quality without drift', () {
    final toAv1 = VideoQualityScale.convertCrf(
      23,
      fromCodec: 'h264',
      toCodec: 'av1',
    );
    expect(
      VideoQualityScale.convertCrf(toAv1, fromCodec: 'av1', toCodec: 'h264'),
      23,
    );
  });
}
