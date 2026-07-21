// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_video_converter/services/ffmpeg_codec_options.dart';

void main() {
  test('maps all expert video codecs to bundled FFmpeg encoders', () {
    expect(FfmpegCodecOptions.videoEncoder('h264'), 'libx264');
    expect(FfmpegCodecOptions.videoEncoder('h265'), 'libx265');
    expect(FfmpegCodecOptions.videoEncoder('vp9'), 'libvpx-vp9');
    expect(FfmpegCodecOptions.videoEncoder('xvid'), 'libxvid');
  });

  test('uses constant-quality arguments supported by VP9 and Xvid', () {
    expect(
      FfmpegCodecOptions.videoQualityArguments(
        codec: 'vp9',
        bitrateMode: 'crf',
        crf: 31,
        targetBitrateKbps: 5000,
      ),
      '-crf 31 -b:v 0',
    );
    expect(
      FfmpegCodecOptions.videoQualityArguments(
        codec: 'xvid',
        bitrateMode: 'crf',
        crf: 51,
        targetBitrateKbps: 5000,
      ),
      '-q:v 31',
    );
  });

  test('forces valid BT.709 colour metadata for VP9 profile 0', () {
    expect(
      FfmpegCodecOptions.videoEncoderArguments('vp9'),
      '-deadline good -cpu-used 4 '
      '-colorspace bt709 -color_primaries bt709 -color_trc bt709',
    );
    expect(FfmpegCodecOptions.videoEncoderArguments('h264'), isEmpty);
  });

  test('keeps target bitrate mode consistent across codecs', () {
    for (final codec in ['h264', 'h265', 'vp9', 'xvid']) {
      expect(
        FfmpegCodecOptions.videoQualityArguments(
          codec: codec,
          bitrateMode: 'bitrate',
          crf: 23,
          targetBitrateKbps: 6000,
        ),
        '-b:v 6000k',
      );
    }
  });

  test('maps Vorbis to libvorbis and an Ogg audio-only file', () {
    expect(FfmpegCodecOptions.audioEncoder('vorbis'), 'libvorbis');
    expect(FfmpegCodecOptions.audioOnlyExtension('vorbis'), 'ogg');
  });

  test('uses hvc1 only for HEVC in MP4-family containers', () {
    expect(FfmpegCodecOptions.codecTagArguments('h265', 'mp4'), '-tag:v hvc1');
    expect(FfmpegCodecOptions.codecTagArguments('h265', 'mov'), '-tag:v hvc1');
    expect(FfmpegCodecOptions.codecTagArguments('h265', 'mkv'), isEmpty);
    expect(FfmpegCodecOptions.codecTagArguments('h264', 'mp4'), isEmpty);
  });
}
