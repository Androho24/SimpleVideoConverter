// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

class QualityOption {
  final String name;
  final int maxDimension; // 0 = Original
  final int crf; // libx264 CRF-Wert (18=sehr gut, 23=gut, 27=niedrig, 32=sehr niedrig)
  final int estimatedBitrateBps; // Nur für Größenschätzung

  const QualityOption(this.name, this.maxDimension, this.crf, this.estimatedBitrateBps);
}

const List<QualityOption> qualityOptions = [
  QualityOption('2160p High',     2160, 18, 25000000),
  QualityOption('2160p Medium',   2160, 23, 15000000),
  QualityOption('2160p Low',      2160, 27,  8000000),
  QualityOption('2160p Very Low', 2160, 32,  4000000),
  QualityOption('1440p High',     1440, 18, 15000000),
  QualityOption('1440p Medium',   1440, 23,  8000000),
  QualityOption('1440p Low',      1440, 27,  4000000),
  QualityOption('1440p Very Low', 1440, 32,  2000000),
  QualityOption('1080p High',     1080, 18, 8000000),
  QualityOption('1080p Medium',   1080, 23, 4000000),
  QualityOption('1080p Low',      1080, 27, 2000000),
  QualityOption('1080p Very Low', 1080, 32, 1000000),
  QualityOption('720p High',       720, 18, 4000000),
  QualityOption('720p Medium',     720, 23, 2000000),
  QualityOption('720p Low',        720, 27, 1000000),
  QualityOption('720p Very Low',   720, 32,  500000),
  QualityOption('480p High',       480, 18, 2000000),
  QualityOption('480p Medium',     480, 23, 1000000),
  QualityOption('480p Low',        480, 27,  500000),
  QualityOption('480p Very Low',   480, 32,  250000),
  QualityOption('360p High',       360, 18, 1000000),
  QualityOption('360p Medium',     360, 23,  500000),
  QualityOption('360p Low',        360, 27,  250000),
  QualityOption('360p Very Low',   360, 32,  125000),
];
