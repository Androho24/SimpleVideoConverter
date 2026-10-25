// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:math';

import '../models/expert_settings.dart';
import '../models/quality_option.dart';
import '../models/video_metadata.dart';
import 'video_quality_scale.dart';
import 'video_scale_service.dart';

class OutputSizeEstimator {
  const OutputSizeEstimator._();

  static const _referencePixels = 1920.0 * 1080.0;
  static const _containerOverheadFactor = 1.02;

  // Näherung für ähnliche visuelle Qualität, kein garantiertes Größenverhältnis.
  // Gemessen (2026-10-25, 10 bit wie in der App, CRF der App = H.264 + 5) lag
  // H.265 je nach Video bei 0,24–0,48 der H.264-Größe. 0,65 war zu hoch;
  // 0,45 bleibt am oberen Rand, weil eine zu kleine Schätzung mehr stört als
  // eine zu große.
  static const _h265EquivalentBitrateFactor = 0.45;

  // AV1 läuft im normalen Modus im Realtime-Usage von libaom. Eine erste
  // Messung (720p, 3 s) lag knapp unter H.265, ein Kameravideo (1080p30, 10 s,
  // CRF 30) dagegen bei 0,85 der H.264-Größe: Realtime spart kaum Bits.
  // Keine Aussage über die Bildqualität.
  static const _av1EquivalentBitrateFactor = 0.8;

  // Dateigröße pro CRF-Stufe: Faktor 2 je [_crfStepsPerDoubling] Stufen. Die
  // verbreitete Faustregel „6 Stufen = halbe Größe“ ist für Handyvideos zu
  // flach. Gemessen (2026-10-25, Kameravideo 1080p30): x264 CRF 18/23/27/32 →
  // 13,5/4,9/2,1/0,87 Mbit/s, also rund 3,5 Stufen je Verdopplung; VP9 und AV1
  // auf ihrer 0–63-Skala rund 5. Ruhige Bildschirmaufnahmen wachsen
  // langsamer, sie werden dadurch eher zu groß geschätzt.
  static const _crfStepsPerDoubling = 3.5;
  static const _wideScaleCrfStepsPerDoubling = 5.0;

  static double estimateNormalMegabytes({
    required double durationSeconds,
    required VideoMetadata metadata,
    required QualityOption quality,
    required String videoCodec,
    required bool muted,
  }) {
    final (
      outputWidth,
      outputHeight,
    ) = VideoScaleService.estimatedStandardDimensions(
      sourceWidth: metadata.width,
      sourceHeight: metadata.height,
      targetShortSide: quality.shortSide,
    );
    if (outputWidth <= 0 || outputHeight <= 0) return 0;

    final nominalPixels = quality.shortSide * quality.shortSide * (16.0 / 9.0);
    final actualPixels = outputWidth * outputHeight;
    final resolutionFactor = actualPixels / nominalPixels;
    final codecFactor = switch (videoCodec) {
      'h265' => _h265EquivalentBitrateFactor,
      'av1' => _av1EquivalentBitrateFactor,
      _ => 1.0,
    };
    final videoBitrateBps =
        quality.estimatedBitrateBps * resolutionFactor * codecFactor;
    return _megabytesFromBitrates(
      durationSeconds: durationSeconds,
      videoBitrateBps: videoBitrateBps,
      audioBitrateKbps: muted ? 0 : 128,
    );
  }

  static double estimateNormalAudioOnlyMegabytes(double durationSeconds) =>
      _megabytesFromBitrates(
        durationSeconds: durationSeconds,
        videoBitrateBps: 0,
        audioBitrateKbps: 192,
      );

  static double estimateExpertMegabytes({
    required double durationSeconds,
    required VideoMetadata metadata,
    required ExpertSettings settings,
  }) {
    if (settings.audioOnly) {
      return _megabytesFromBitrates(
        durationSeconds: durationSeconds,
        videoBitrateBps: 0,
        audioBitrateKbps: settings.audioBitrate,
      );
    }

    final effectiveCodec = switch (settings.container) {
      'avi' => 'xvid',
      'webm' when settings.videoCodec != 'av1' => 'vp9',
      _ => settings.videoCodec,
    };
    final videoBitrateBps = settings.bitrateMode == 'bitrate'
        ? settings.targetBitrateKbps * 1000.0
        : _estimateCrfVideoBitrate(
            metadata: metadata,
            settings: settings,
            videoCodec: effectiveCodec,
          );
    return _megabytesFromBitrates(
      durationSeconds: durationSeconds,
      videoBitrateBps: videoBitrateBps,
      audioBitrateKbps: settings.audioBitrate,
    );
  }

  static (int, int) expertOutputDimensions(
    VideoMetadata metadata,
    ExpertSettings settings,
  ) {
    final sourceWidth = metadata.width;
    final sourceHeight = metadata.height;
    if (sourceWidth <= 0 || sourceHeight <= 0) return (0, 0);

    if (settings.width > 0 && settings.height > 0) {
      return (settings.width, settings.height);
    }
    if (settings.width > 0) {
      return (
        settings.width,
        _nearestEven(settings.width * sourceHeight / sourceWidth),
      );
    }
    if (settings.height > 0) {
      return (
        _nearestEven(settings.height * sourceWidth / sourceHeight),
        settings.height,
      );
    }
    return (_floorEven(sourceWidth), _floorEven(sourceHeight));
  }

  static double _estimateCrfVideoBitrate({
    required VideoMetadata metadata,
    required ExpertSettings settings,
    required String videoCodec,
  }) {
    final (outputWidth, outputHeight) = expertOutputDimensions(
      metadata,
      settings,
    );
    if (outputWidth <= 0 || outputHeight <= 0) return 0;

    final double referenceBitrateBps;
    final int referenceCrf;
    if (videoCodec == 'h265') {
      referenceBitrateBps = 4000000 * _h265EquivalentBitrateFactor;
      referenceCrf = 28;
    } else if (videoCodec == 'vp9') {
      // Gemessen 1,2-mal so groß wie x264 CRF 23 auf demselben Video.
      referenceBitrateBps = 4800000;
      referenceCrf = 31;
    } else if (videoCodec == 'av1') {
      // Realtime-Usage, gemessen 0,85-mal so groß wie x264 CRF 23.
      referenceBitrateBps = 3400000;
      referenceCrf = 30;
    } else if (videoCodec == 'xvid') {
      referenceBitrateBps = 5000000;
      referenceCrf = 23;
    } else {
      referenceBitrateBps = 4000000;
      referenceCrf = 23;
    }

    final resolutionFactor = (outputWidth * outputHeight) / _referencePixels;
    // CRF steuert Qualität statt Dateigröße. Diese Kurve dient nur als
    // nachvollziehbare Vorab-Näherung; der Videoinhalt bleibt der größte Faktor.
    final stepsPerDoubling = VideoQualityScale.usesWideScale(videoCodec)
        ? _wideScaleCrfStepsPerDoubling
        : _crfStepsPerDoubling;
    final crfFactor = pow(
      2.0,
      (referenceCrf - settings.crf) / stepsPerDoubling,
    );
    return referenceBitrateBps * resolutionFactor * crfFactor;
  }

  /// Hochrechnung der Endgröße während der Konvertierung aus der bisherigen
  /// Ausgabe und dem Fortschritt 0.0–1.0. Null, solange zu wenig encodiert ist:
  /// Am Anfang hält der Encoder Frames im Lookahead zurück, die Datei hinkt
  /// dann dem Fortschritt hinterher.
  static int? projectedFinalBytes({
    required int currentBytes,
    required double progress,
  }) {
    if (currentBytes <= 0 || progress < _minProjectionProgress) return null;
    if (progress >= 1.0) return currentBytes;
    return (currentBytes / progress).round();
  }

  static const _minProjectionProgress = 0.05;

  static double _megabytesFromBitrates({
    required double durationSeconds,
    required double videoBitrateBps,
    required int audioBitrateKbps,
  }) {
    if (durationSeconds <= 0) return 0;
    final totalBitrateBps = videoBitrateBps + audioBitrateKbps * 1000;
    final bytes =
        (totalBitrateBps / 8) * durationSeconds * _containerOverheadFactor;
    return bytes / (1024 * 1024);
  }

  static int _floorEven(int value) => (value ~/ 2) * 2;

  static int _nearestEven(num value) => (value / 2).round() * 2;
}
