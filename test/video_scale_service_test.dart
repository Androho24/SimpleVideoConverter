// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_video_converter/services/video_scale_service.dart';

void main() {
  group('sourceShortSide', () {
    test('uses the short side for landscape and portrait sources', () {
      expect(VideoScaleService.sourceShortSide(1920, 1080), 1080);
      expect(VideoScaleService.sourceShortSide(1080, 1920), 1080);
    });

    test('is unchanged when 90-degree rotation swaps stored dimensions', () {
      const storedLandscapeWithPortraitRotation = (1920, 1080);
      const displayPortrait = (1080, 1920);

      expect(
        VideoScaleService.sourceShortSide(
          storedLandscapeWithPortraitRotation.$1,
          storedLandscapeWithPortraitRotation.$2,
        ),
        VideoScaleService.sourceShortSide(
          displayPortrait.$1,
          displayPortrait.$2,
        ),
      );
    });

    test('rejects invalid metadata', () {
      expect(VideoScaleService.sourceShortSide(0, 1080), 0);
      expect(VideoScaleService.sourceShortSide(1920, -1), 0);
    });
  });

  group('probe metadata normalization', () {
    test('reads and normalizes rotation from side data and tags', () {
      expect(
        VideoScaleService.probeRotationDegrees({
          'side_data_list': [
            {'rotation': -90},
          ],
        }),
        270,
      );
      expect(
        VideoScaleService.probeRotationDegrees({
          'tags': {'rotate': '90'},
        }),
        90,
      );
    });

    test('uses display orientation for rotated phone videos', () {
      expect(
        VideoScaleService.displayDimensions(
          encodedWidth: 1920,
          encodedHeight: 1080,
          rotationDegrees: 90,
          displayAspectRatio: '16:9',
        ),
        (1080, 1920),
      );
    });

    test('normalizes anamorphic video to square-pixel dimensions', () {
      expect(
        VideoScaleService.displayDimensions(
          encodedWidth: 720,
          encodedHeight: 576,
          rotationDegrees: 0,
          displayAspectRatio: '16:9',
        ),
        (1024, 576),
      );
    });
  });

  group('estimatedStandardDimensions', () {
    test('uses the selected preset as the short side', () {
      expect(
        VideoScaleService.estimatedStandardDimensions(
          sourceWidth: 1920,
          sourceHeight: 1080,
          targetShortSide: 720,
        ),
        (1280, 720),
      );
      expect(
        VideoScaleService.estimatedStandardDimensions(
          sourceWidth: 1080,
          sourceHeight: 1920,
          targetShortSide: 720,
        ),
        (720, 1280),
      );
    });

    test('preserves unusual aspect ratios', () {
      expect(
        VideoScaleService.estimatedStandardDimensions(
          sourceWidth: 720,
          sourceHeight: 600,
          targetShortSide: 480,
        ),
        (576, 480),
      );
    });

    test('does not upscale smaller source videos', () {
      expect(
        VideoScaleService.estimatedStandardDimensions(
          sourceWidth: 640,
          sourceHeight: 360,
          targetShortSide: 720,
        ),
        (640, 360),
      );
    });
  });

  group('standardFilter', () {
    test('uses display orientation and derives the long side', () {
      final filter = VideoScaleService.standardFilter(720);

      expect(filter, contains('gte(dar,1)'));
      expect(filter, contains("w='if(gte(dar,1),-2,"));
      expect(filter, contains("h='if(gte(dar,1),trunc("));
    });

    test('prevents upscaling and produces even dimensions', () {
      final filter = VideoScaleService.standardFilter(1080);

      expect(filter, contains('min(1080,iw)'));
      expect(filter, contains('min(1080,ih)'));
      expect(filter, contains('trunc(min(1080,iw)/2)*2'));
      expect(filter, contains('trunc(min(1080,ih)/2)*2'));
    });

    test('normalizes non-square pixels without stretching display ratio', () {
      expect(VideoScaleService.standardFilter(480), contains('reset_sar=1'));
    });

    test('survives FFmpegKit command parsing as one filter argument', () {
      final arguments = FFmpegKitConfig.parseArguments(
        '-i input.mp4 ${VideoScaleService.standardFilter(720)} output.mp4',
      );
      final filterOption = arguments.indexOf('-vf');

      expect(filterOption, greaterThanOrEqualTo(0));
      expect(
        arguments[filterOption + 1],
        "scale=w='if(gte(dar,1),-2,trunc(min(720,iw)/2)*2)'"
        ":h='if(gte(dar,1),trunc(min(720,ih)/2)*2,-2)'"
        ':reset_sar=1',
      );
    });

    test('returns no filter for an original-size sentinel', () {
      expect(VideoScaleService.standardFilter(0), isEmpty);
    });
  });
}
