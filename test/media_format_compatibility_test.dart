// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_video_converter/services/media_format_compatibility.dart';

void main() {
  group('compatibleContainers', () {
    Set<String> ids(String videoCodec, String audioCodec) =>
        MediaFormatCompatibility.compatibleContainers(
          videoCodec: videoCodec,
          audioCodec: audioCodec,
        ).map((option) => option.id).toSet();

    test('offers broad H.264 and AAC compatibility', () {
      expect(ids('h264', 'aac'), {'mp4', 'mkv', 'mov', 'ts'});
    });

    test('offers only MKV and WebM for VP9 with Opus or Vorbis', () {
      expect(ids('vp9', 'opus'), {'mkv', 'webm'});
      expect(ids('vp9', 'vorbis'), {'mkv', 'webm'});
    });

    test('offers MKV and AVI for the Xvid legacy combination', () {
      expect(ids('xvid', 'mp3'), {'mkv', 'avi'});
      expect(ids('xvid', 'ac3'), {'mkv', 'avi'});
    });

    test('keeps MKV as the safe intersection for mixed codecs', () {
      expect(ids('h265', 'opus'), {'mkv'});
      expect(ids('xvid', 'vorbis'), {'mkv'});
    });
  });

  group('preferredContainer', () {
    test('keeps an already compatible current container', () {
      expect(
        MediaFormatCompatibility.preferredContainer(
          videoCodec: 'vp9',
          audioCodec: 'opus',
          currentContainer: 'mkv',
        ),
        'mkv',
      );
    });

    test('chooses the natural container after an incompatible change', () {
      expect(
        MediaFormatCompatibility.preferredContainer(
          videoCodec: 'vp9',
          audioCodec: 'opus',
          currentContainer: 'mp4',
        ),
        'webm',
      );
      expect(
        MediaFormatCompatibility.preferredContainer(
          videoCodec: 'xvid',
          audioCodec: 'mp3',
          currentContainer: 'mp4',
        ),
        'avi',
      );
    });
  });

  group('container codec defaults', () {
    test('uses modern broadly compatible defaults', () {
      expect(MediaFormatCompatibility.defaultVideoCodecFor('mp4'), 'h264');
      expect(MediaFormatCompatibility.defaultAudioCodecFor('mp4'), 'aac');
      expect(MediaFormatCompatibility.defaultVideoCodecFor('mkv'), 'h264');
      expect(MediaFormatCompatibility.defaultAudioCodecFor('mkv'), 'aac');
      expect(MediaFormatCompatibility.defaultVideoCodecFor('mov'), 'h264');
      expect(MediaFormatCompatibility.defaultAudioCodecFor('mov'), 'aac');
      expect(MediaFormatCompatibility.defaultVideoCodecFor('ts'), 'h264');
      expect(MediaFormatCompatibility.defaultAudioCodecFor('ts'), 'aac');
    });

    test('uses the required AVI and WebM codecs', () {
      expect(MediaFormatCompatibility.defaultVideoCodecFor('avi'), 'xvid');
      expect(MediaFormatCompatibility.defaultAudioCodecFor('avi'), 'mp3');
      expect(MediaFormatCompatibility.defaultVideoCodecFor('webm'), 'vp9');
      expect(MediaFormatCompatibility.defaultAudioCodecFor('webm'), 'opus');
    });
  });
}
