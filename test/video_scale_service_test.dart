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

  group('HDR-Tonemapping', () {
    test('detects HLG and PQ, but not SDR transfers', () {
      expect(VideoScaleService.hdrTransfer('arib-std-b67'), 'arib-std-b67');
      expect(VideoScaleService.hdrTransfer('smpte2084'), 'smpte2084');
      expect(VideoScaleService.hdrTransfer('ARIB-STD-B67'), 'arib-std-b67');
      expect(VideoScaleService.hdrTransfer('bt709'), isNull);
      expect(VideoScaleService.hdrTransfer('unknown'), isNull);
      expect(VideoScaleService.hdrTransfer(null), isNull);
      expect(VideoScaleService.isHdrTransfer('smpte2084'), isTrue);
      expect(VideoScaleService.isHdrTransfer('bt709'), isFalse);
    });

    test('appends the tonemap chain behind the scale graph', () {
      final filter = VideoScaleService.standardFilter(
        720,
        hdrTransfer: 'arib-std-b67',
      );

      expect(filter.indexOf('scale=w='), lessThan(filter.indexOf('zscale=')));
      expect(filter, contains('tonemap=tonemap=hable'));
      expect(filter, contains('format=yuv420p'));
    });

    test('declares the source transfer instead of letting zimg infer it', () {
      expect(
        VideoScaleService.hdrToSdrGraph('arib-std-b67'),
        contains('zscale=tin=arib-std-b67:min=bt2020nc:pin=bt2020:rin=tv'),
      );
      expect(
        VideoScaleService.hdrToSdrGraph('smpte2084'),
        contains('tin=smpte2084'),
      );
    });

    test('tonemaps alone when the source keeps its original size', () {
      final filter = VideoScaleService.standardFilter(
        0,
        hdrTransfer: 'smpte2084',
      );

      expect(filter, isNot(contains('scale=w=')));
      expect(filter, contains('tonemap=tonemap=hable'));
    });

    test('stays untouched for SDR sources', () {
      expect(VideoScaleService.standardFilter(720), isNot(contains('tonemap')));
      expect(VideoScaleService.filterArgument(''), isEmpty);
    });

    test('survives FFmpegKit command parsing as one filter argument', () {
      final arguments = FFmpegKitConfig.parseArguments(
        '-i input.mp4 '
        '${VideoScaleService.standardFilter(720, hdrTransfer: 'arib-std-b67')} '
        'output.mp4',
      );
      final filterOption = arguments.indexOf('-vf');

      expect(filterOption, greaterThanOrEqualTo(0));
      expect(
        arguments[filterOption + 1],
        '${VideoScaleService.standardGraph(720)},'
        '${VideoScaleService.hdrToSdrGraph('arib-std-b67')}',
      );
      expect(arguments[filterOption + 2], 'output.mp4');
    });
  });
}
