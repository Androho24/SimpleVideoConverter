// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

class VideoMetadata {
  final int durationMs;
  final int width;
  final int height;
  final int audioChannels; // 0 = unbekannt, ≥3 = Surround

  const VideoMetadata({
    required this.durationMs,
    required this.width,
    required this.height,
    this.audioChannels = 0,
  });
}
