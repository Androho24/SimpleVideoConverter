// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_video_converter/services/ad_config.dart';

void main() {
  test('uses the official Google native test ad unit in debug builds', () {
    expect(AdConfig.nativeAdUnitId, AdConfig.nativeTestAdUnitId);
    expect(
      AdConfig.nativeAdUnitIdFor(isDebug: true),
      AdConfig.nativeTestAdUnitId,
    );
    expect(
      AdConfig.nativeTestAdUnitId,
      'ca-app-pub-3940256099942544/2247696110',
    );
  });

  test('uses the production native ad unit outside debug builds', () {
    expect(
      AdConfig.nativeAdUnitIdFor(isDebug: false),
      AdConfig.nativeProductionAdUnitId,
    );
    expect(
      AdConfig.nativeProductionAdUnitId,
      isNot(AdConfig.nativeTestAdUnitId),
    );
  });
}
