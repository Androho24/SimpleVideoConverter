// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_video_converter/services/video_source.dart';

void main() {
  group('VideoSource', () {
    test('recognizes content URIs', () {
      expect(
        VideoSource.isContentUri(
          'content://com.android.providers.media.documents/document/video%3A42',
        ),
        isTrue,
      );
      expect(VideoSource.isContentUri('/data/cache/abc/Urlaub.mp4'), isFalse);
    });

    test('passes file paths through unchanged', () async {
      expect(
        await VideoSource.ffmpegPath('/data/cache/abc/Urlaub 2026.mp4'),
        '/data/cache/abc/Urlaub 2026.mp4',
      );
    });

    test('quoted argument keeps a path with spaces together', () async {
      final arg = await VideoSource.ffmpegArgument(
        '/data/cache/abc/Urlaub 2026.mp4',
      );
      final arguments = FFmpegKitConfig.parseArguments(
        '-i $arg -c copy "/out.mp4"',
      );
      expect(arguments, [
        '-i',
        '/data/cache/abc/Urlaub 2026.mp4',
        '-c',
        'copy',
        '/out.mp4',
      ]);
    });
  });
}
