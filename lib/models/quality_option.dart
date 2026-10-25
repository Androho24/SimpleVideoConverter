// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

class QualityOption {
  final String name;
  final int shortSide; // 360p/480p/720p/etc.; lange Seite bleibt proportional
  final int crf; // H.264-Basiswert; H.265 erhält für ähnliche Qualität +5
  final int estimatedBitrateBps; // H.264/16:9-Referenz für Größenschätzung

  const QualityOption(
    this.name,
    this.shortSide,
    this.crf,
    this.estimatedBitrateBps,
  );
}

// High liegt beim 2,7-Fachen von Medium, nicht beim Doppelten: Gemessen
// (2026-10-25, x264 medium, Kameravideo 1080p30) wächst die Datei von CRF 23
// auf 18 um das 2,2- bis 2,8-Fache, Rauschen und Details bleiben bei CRF 18
// erhalten. Low und Very Low trafen die Messung bereits.
const List<QualityOption> qualityOptions = [
  QualityOption('2160p High', 2160, 18, 40000000),
  QualityOption('2160p Medium', 2160, 23, 15000000),
  QualityOption('2160p Low', 2160, 27, 8000000),
  QualityOption('2160p Very Low', 2160, 32, 4000000),
  QualityOption('1440p High', 1440, 18, 21600000),
  QualityOption('1440p Medium', 1440, 23, 8000000),
  QualityOption('1440p Low', 1440, 27, 4000000),
  QualityOption('1440p Very Low', 1440, 32, 2000000),
  QualityOption('1080p High', 1080, 18, 10800000),
  QualityOption('1080p Medium', 1080, 23, 4000000),
  QualityOption('1080p Low', 1080, 27, 2000000),
  QualityOption('1080p Very Low', 1080, 32, 1000000),
  QualityOption('720p High', 720, 18, 5400000),
  QualityOption('720p Medium', 720, 23, 2000000),
  QualityOption('720p Low', 720, 27, 1000000),
  QualityOption('720p Very Low', 720, 32, 500000),
  QualityOption('480p High', 480, 18, 2700000),
  QualityOption('480p Medium', 480, 23, 1000000),
  QualityOption('480p Low', 480, 27, 500000),
  QualityOption('480p Very Low', 480, 32, 250000),
  QualityOption('360p High', 360, 18, 1350000),
  QualityOption('360p Medium', 360, 23, 500000),
  QualityOption('360p Low', 360, 27, 250000),
  QualityOption('360p Very Low', 360, 32, 125000),
];
