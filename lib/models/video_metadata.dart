// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

class VideoMetadata {
  final int durationMs;

  /// Sichtbare Breite nach Rotation, auf quadratische Pixel normiert.
  final int width;

  /// Sichtbare Höhe nach Rotation, auf quadratische Pixel normiert.
  final int height;

  final int audioChannels; // 0 = unbekannt, ≥3 = Surround

  const VideoMetadata({
    required this.durationMs,
    required this.width,
    required this.height,
    this.audioChannels = 0,
  });
}
