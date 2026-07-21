// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'media_format_compatibility.dart';

class FfmpegCodecOptions {
  const FfmpegCodecOptions._();

  static String videoEncoder(String codec) => switch (codec) {
    MediaFormatCompatibility.videoCodecH265 => 'libx265',
    MediaFormatCompatibility.videoCodecVp9 => 'libvpx-vp9',
    MediaFormatCompatibility.videoCodecXvid => 'libxvid',
    _ => 'libx264',
  };

  static String audioEncoder(String codec) => switch (codec) {
    MediaFormatCompatibility.audioCodecMp3 => 'libmp3lame',
    MediaFormatCompatibility.audioCodecOpus => 'libopus',
    MediaFormatCompatibility.audioCodecVorbis => 'libvorbis',
    MediaFormatCompatibility.audioCodecAc3 => 'ac3',
    _ => 'aac',
  };

  static String audioOnlyExtension(String codec) => switch (codec) {
    MediaFormatCompatibility.audioCodecAac => 'm4a',
    MediaFormatCompatibility.audioCodecMp3 => 'mp3',
    MediaFormatCompatibility.audioCodecOpus => 'opus',
    MediaFormatCompatibility.audioCodecVorbis => 'ogg',
    MediaFormatCompatibility.audioCodecAc3 => 'ac3',
    _ => 'm4a',
  };

  static String videoQualityArguments({
    required String codec,
    required String bitrateMode,
    required int crf,
    required int targetBitrateKbps,
  }) {
    if (bitrateMode == 'bitrate') return '-b:v ${targetBitrateKbps}k';
    if (codec == MediaFormatCompatibility.videoCodecVp9) {
      return '-crf ${crf.clamp(0, 63)} -b:v 0';
    }
    if (codec == MediaFormatCompatibility.videoCodecXvid) {
      final qscale = (1 + ((crf - 1).clamp(0, 50) * 30 / 50)).round();
      return '-q:v $qscale';
    }
    return '-crf ${crf.clamp(0, 51)}';
  }

  static String videoEncoderArguments(String codec) =>
      codec == MediaFormatCompatibility.videoCodecVp9
      ? '-deadline good -cpu-used 4 '
            '-colorspace bt709 -color_primaries bt709 -color_trc bt709'
      : '';

  static String codecTagArguments(String codec, String container) =>
      codec == MediaFormatCompatibility.videoCodecH265 &&
          (container == 'mp4' || container == 'mov')
      ? '-tag:v hvc1'
      : '';
}
