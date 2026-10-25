// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_video_converter/models/expert_settings.dart';
import 'package:simple_video_converter/models/quality_option.dart';
import 'package:simple_video_converter/models/video_metadata.dart';
import 'package:simple_video_converter/services/output_size_estimator.dart';

void main() {
  const oneMinute1080p = VideoMetadata(
    durationMs: 60000,
    width: 1920,
    height: 1080,
  );
  const medium1080p = QualityOption('1080p Medium', 1080, 23, 4000000);

  group('normal mode', () {
    test('estimates H.265 smaller than equivalent H.264 output', () {
      final h264 = OutputSizeEstimator.estimateNormalMegabytes(
        durationSeconds: 60,
        metadata: oneMinute1080p,
        quality: medium1080p,
        videoCodec: 'h264',
        muted: false,
      );
      final h265 = OutputSizeEstimator.estimateNormalMegabytes(
        durationSeconds: 60,
        metadata: oneMinute1080p,
        quality: medium1080p,
        videoCodec: 'h265',
        muted: false,
      );

      expect(h265, lessThan(h264));
      expect(h264, closeTo(30.1, 0.1));
      expect(h265, closeTo(14.1, 0.1));
    });

    test('uses the actual no-upscale output dimensions', () {
      const smallSource = VideoMetadata(
        durationMs: 60000,
        width: 640,
        height: 360,
      );
      final fullHdSource = OutputSizeEstimator.estimateNormalMegabytes(
        durationSeconds: 60,
        metadata: oneMinute1080p,
        quality: medium1080p,
        videoCodec: 'h264',
        muted: true,
      );
      final smallSourceEstimate = OutputSizeEstimator.estimateNormalMegabytes(
        durationSeconds: 60,
        metadata: smallSource,
        quality: medium1080p,
        videoCodec: 'h264',
        muted: true,
      );

      expect(smallSourceEstimate, lessThan(fullHdSource));
      expect(smallSourceEstimate / fullHdSource, closeTo(1 / 9, 0.001));
    });

    test('estimates the fixed 192 kbit/s audio-only output', () {
      expect(
        OutputSizeEstimator.estimateNormalAudioOnlyMegabytes(60),
        closeTo(1.40, 0.01),
      );
    });
  });

  group('expert mode', () {
    test('target bitrate controls size independently of the video codec', () {
      const settings = ExpertSettings(
        bitrateMode: 'bitrate',
        targetBitrateKbps: 5000,
        audioBitrate: 128,
      );
      final estimates = [
        for (final codec in ['h264', 'h265', 'vp9', 'xvid'])
          OutputSizeEstimator.estimateExpertMegabytes(
            durationSeconds: 60,
            metadata: oneMinute1080p,
            settings: settings.copyWith(videoCodec: codec),
          ),
      ];

      expect(estimates.toSet(), hasLength(1));
      expect(estimates.first, closeTo(37.4, 0.1));
    });

    test('CRF estimate uses codec-specific reference values', () {
      final h264 = OutputSizeEstimator.estimateExpertMegabytes(
        durationSeconds: 60,
        metadata: oneMinute1080p,
        settings: const ExpertSettings(crf: 23),
      );
      final h265 = OutputSizeEstimator.estimateExpertMegabytes(
        durationSeconds: 60,
        metadata: oneMinute1080p,
        settings: const ExpertSettings(crf: 28, videoCodec: 'h265'),
      );

      expect(h265, lessThan(h264));
    });

    test('five CRF steps lower grow H.264 by about 2.7x', () {
      double estimate(int crf) => OutputSizeEstimator.estimateExpertMegabytes(
        durationSeconds: 60,
        metadata: oneMinute1080p,
        settings: ExpertSettings(crf: crf, audioBitrate: 0),
      );
      // Gemessen auf einem Kameravideo: 13,5 statt 4,9 Mbit/s.
      expect(estimate(18) / estimate(23), closeTo(2.69, 0.01));
    });

    test('wide-scale codecs use a flatter CRF curve', () {
      double estimate(int crf) => OutputSizeEstimator.estimateExpertMegabytes(
        durationSeconds: 60,
        metadata: oneMinute1080p,
        settings: ExpertSettings(
          crf: crf,
          videoCodec: 'vp9',
          container: 'webm',
          audioBitrate: 0,
        ),
      );
      expect(estimate(26) / estimate(31), closeTo(2.0, 0.01));
    });

    test('CRF estimate includes VP9 and Xvid reference values', () {
      final vp9 = OutputSizeEstimator.estimateExpertMegabytes(
        durationSeconds: 60,
        metadata: oneMinute1080p,
        settings: const ExpertSettings(crf: 31, videoCodec: 'vp9'),
      );
      final xvid = OutputSizeEstimator.estimateExpertMegabytes(
        durationSeconds: 60,
        metadata: oneMinute1080p,
        settings: const ExpertSettings(crf: 23, videoCodec: 'xvid'),
      );

      expect(vp9, lessThan(xvid));
    });

    test('AVI defensively uses the Xvid estimate', () {
      const settings = ExpertSettings(container: 'avi', crf: 23);
      final selectedH264 = OutputSizeEstimator.estimateExpertMegabytes(
        durationSeconds: 60,
        metadata: oneMinute1080p,
        settings: settings,
      );
      final selectedH265 = OutputSizeEstimator.estimateExpertMegabytes(
        durationSeconds: 60,
        metadata: oneMinute1080p,
        settings: settings.copyWith(videoCodec: 'h265'),
      );

      expect(selectedH265, selectedH264);
    });

    test('derives a proportional expert dimension for portrait video', () {
      const portrait = VideoMetadata(
        durationMs: 60000,
        width: 1080,
        height: 1920,
      );
      expect(
        OutputSizeEstimator.expertOutputDimensions(
          portrait,
          const ExpertSettings(width: 720),
        ),
        (720, 1280),
      );
    });

    test('audio-only uses its selected audio bitrate', () {
      final estimate = OutputSizeEstimator.estimateExpertMegabytes(
        durationSeconds: 60,
        metadata: oneMinute1080p,
        settings: const ExpertSettings(audioOnly: true, audioBitrate: 320),
      );

      expect(estimate, closeTo(2.33, 0.01));
    });
  });

  group('projection during conversion', () {
    test('waits until enough has been encoded', () {
      expect(
        OutputSizeEstimator.projectedFinalBytes(
          currentBytes: 1000,
          progress: 0.04,
        ),
        isNull,
      );
      expect(
        OutputSizeEstimator.projectedFinalBytes(currentBytes: 0, progress: 0.5),
        isNull,
      );
    });

    test('extrapolates the current size to the full duration', () {
      expect(
        OutputSizeEstimator.projectedFinalBytes(
          currentBytes: 12000000,
          progress: 0.25,
        ),
        48000000,
      );
      expect(
        OutputSizeEstimator.projectedFinalBytes(
          currentBytes: 5000,
          progress: 1.0,
        ),
        5000,
      );
    });
  });
}
