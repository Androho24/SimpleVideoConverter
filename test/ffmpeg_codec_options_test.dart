// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_video_converter/services/ffmpeg_codec_options.dart';

void main() {
  test('maps all expert video codecs to bundled FFmpeg encoders', () {
    expect(FfmpegCodecOptions.videoEncoder('h264'), 'libx264');
    expect(FfmpegCodecOptions.videoEncoder('h265'), 'libx265');
    expect(FfmpegCodecOptions.videoEncoder('vp9'), 'libvpx-vp9');
    expect(FfmpegCodecOptions.videoEncoder('av1'), 'libaom-av1');
    expect(FfmpegCodecOptions.videoEncoder('xvid'), 'libxvid');
  });

  test('uses the 0–63 constant-quality scale for AV1', () {
    expect(
      FfmpegCodecOptions.videoQualityArguments(
        codec: 'av1',
        bitrateMode: 'crf',
        crf: 30,
        targetBitrateKbps: 5000,
      ),
      '-crf 30 -b:v 0',
    );
  });

  test('speeds up libaom and keeps tiling automatic', () {
    expect(
      FfmpegCodecOptions.videoEncoderArguments('av1'),
      '-usage realtime -cpu-used 8 -row-mt 1 -lag-in-frames 0 -g 240 '
      '-colorspace bt709 -color_primaries bt709 -color_trc bt709',
    );
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
    for (final codec in ['h264', 'h265', 'vp9', 'av1', 'xvid']) {
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

  test('uses av01 only for AV1 in MP4-family containers', () {
    expect(FfmpegCodecOptions.codecTagArguments('av1', 'mp4'), '-tag:v av01');
    expect(FfmpegCodecOptions.codecTagArguments('av1', 'webm'), isEmpty);
    expect(FfmpegCodecOptions.codecTagArguments('av1', 'mkv'), isEmpty);
  });

  group('HDR', () {
    test('only 10-bit-capable codecs can carry HDR through', () {
      expect(FfmpegCodecOptions.supportsHdr('h265'), isTrue);
      expect(FfmpegCodecOptions.supportsHdr('av1'), isTrue);
      expect(FfmpegCodecOptions.supportsHdr('h264'), isFalse);
      expect(FfmpegCodecOptions.supportsHdr('vp9'), isFalse);
      expect(FfmpegCodecOptions.supportsHdr('xvid'), isFalse);
    });

    test('tags the output with the source transfer at 10 bit', () {
      final hlg = FfmpegCodecOptions.hdrArguments('arib-std-b67');

      expect(hlg, contains('-pix_fmt yuv420p10le'));
      expect(hlg, contains('-color_trc arib-std-b67'));
      expect(hlg, contains('-color_primaries bt2020'));
      expect(hlg, contains('-colorspace bt2020nc'));
      expect(
        FfmpegCodecOptions.hdrArguments('smpte2084'),
        contains('-color_trc smpte2084'),
      );
    });

    test('drops the fixed BT.709 tags of AV1 when HDR is kept', () {
      final sdr = FfmpegCodecOptions.videoEncoderArguments('av1');
      final hdr = FfmpegCodecOptions.videoEncoderArguments('av1', hdr: true);

      expect(sdr, contains('-color_primaries bt709'));
      expect(hdr, isNot(contains('bt709')));
      // Die Tempo-Optionen müssen erhalten bleiben.
      expect(hdr, contains('-usage realtime'));
      expect(hdr, contains('-cpu-used 8'));
      expect(hdr, contains('-lag-in-frames 0'));
    });
  });

  group('Hardware-HEVC', () {
    test('selects hevc_mediacodec only for H.265 with hardware', () {
      expect(
        FfmpegCodecOptions.videoEncoder('h265', hardware: true),
        'hevc_mediacodec',
      );
      expect(FfmpegCodecOptions.videoEncoder('h265'), 'libx265');
      expect(
        FfmpegCodecOptions.videoEncoder('h264', hardware: true),
        'libx264',
      );
    });

    test('uses hardware only for H.265 SDR jobs with the switch on', () {
      bool uses(
        String codec, {
        String container = 'mp4',
        bool on = true,
        bool hdr = false,
      }) => FfmpegCodecOptions.usesHardwareEncoder(
        codec: codec,
        container: container,
        hardwareEncoder: on,
        hdrSource: hdr,
      );

      expect(uses('h265'), isTrue);
      expect(uses('h265', on: false), isFalse);
      expect(uses('h265', hdr: true), isFalse);
      expect(uses('h264'), isFalse);
      expect(uses('av1'), isFalse);
      expect(uses('h265', container: 'mov'), isTrue);
      expect(uses('h265', container: 'ts'), isTrue);
      // Auf Pixel 10 und Xperia 5 V gescheitert, siehe hardwareContainers.
      expect(uses('h265', container: 'mkv'), isFalse);
    });

    test('always sets the global header and a VBR bitrate mode', () {
      final args = FfmpegCodecOptions.hardwareEncoderArguments(fps: 30);
      expect(args, contains('-flags:v -global_header'));
      expect(args, contains('-bitrate_mode vbr'));
      expect(args, isNot(contains('-crf')));
      expect(args, isNot(contains('x265')));
    });

    test('places a keyframe about every five seconds', () {
      expect(
        FfmpegCodecOptions.hardwareEncoderArguments(fps: 24),
        endsWith('-g 120'),
      );
      expect(
        FfmpegCodecOptions.hardwareEncoderArguments(fps: 60),
        endsWith('-g 300'),
      );
      // „Original“: Quell-fps unbekannt, 30 angenommen.
      expect(
        FfmpegCodecOptions.hardwareEncoderArguments(fps: 0),
        endsWith('-g 150'),
      );
    });

    test('survives FFmpegKit command parsing with hvc1 and without CRF', () {
      final segment = [
        '-c:v ${FfmpegCodecOptions.videoEncoder('h265', hardware: true)}',
        FfmpegCodecOptions.codecTagArguments('h265', 'mp4'),
        FfmpegCodecOptions.hardwareEncoderArguments(fps: 0),
        '-pix_fmt yuv420p',
        FfmpegCodecOptions.videoQualityArguments(
          codec: 'h265',
          bitrateMode: 'bitrate',
          crf: 28,
          targetBitrateKbps: 8000,
        ),
      ].join(' ');
      final arguments = FFmpegKitConfig.parseArguments(
        '-i input.mp4 $segment -y output.mp4',
      );

      String valueOf(String option) => arguments[arguments.indexOf(option) + 1];

      expect(valueOf('-c:v'), 'hevc_mediacodec');
      expect(valueOf('-tag:v'), 'hvc1');
      expect(valueOf('-flags:v'), '-global_header');
      expect(valueOf('-bitrate_mode'), 'vbr');
      expect(valueOf('-g'), '150');
      expect(valueOf('-pix_fmt'), 'yuv420p');
      expect(valueOf('-b:v'), '8000k');
      expect(arguments, isNot(contains('-crf')));
    });

    test('adds hvc1 for MOV but no tag for MKV and TS', () {
      expect(
        FfmpegCodecOptions.codecTagArguments('h265', 'mov'),
        '-tag:v hvc1',
      );
      expect(FfmpegCodecOptions.codecTagArguments('h265', 'mkv'), isEmpty);
      expect(FfmpegCodecOptions.codecTagArguments('h265', 'ts'), isEmpty);
    });
  });
}
