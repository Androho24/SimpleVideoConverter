// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:in_app_review/in_app_review.dart';
import 'preferences_service.dart';

class ReviewService {
  static const _interval = 5;

  /// Erhöht den Konvertierungs-Zähler und zeigt alle [_interval] erfolgreichen
  /// Konvertierungen den nativen Google Play In-App-Review-Dialog an.
  /// Im Debug-Build oder außerhalb des Play Stores passiert nichts.
  static Future<void> maybeRequestReview() async {
    final shouldRequest =
        await PreferencesService.incrementConversionCountAndCheck(_interval);
    if (!shouldRequest) return;

    final review = InAppReview.instance;
    if (await review.isAvailable()) {
      await review.requestReview();
    }
  }
}
