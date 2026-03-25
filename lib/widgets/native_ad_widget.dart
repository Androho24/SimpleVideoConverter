// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../l10n/app_localizations.dart';
import '../services/ad_config.dart';

enum _AdState { loading, loaded, failed }

class NativeAdWidget extends StatefulWidget {
  const NativeAdWidget({super.key});

  @override
  State<NativeAdWidget> createState() => _NativeAdWidgetState();
}

class _NativeAdWidgetState extends State<NativeAdWidget> {
  NativeAd? _nativeAd;
  _AdState _adState = _AdState.loading;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }

  void _loadAd() {
    _nativeAd = NativeAd(
      adUnitId: AdConfig.nativeAdUnitId,
      factoryId: 'nativeAd',
      listener: NativeAdListener(
        onAdLoaded: (_) {
          if (!mounted) return;
          setState(() => _adState = _AdState.loaded);
        },
        onAdFailedToLoad: (failedAd, error) {
          failedAd.dispose();
          _nativeAd = null;
          if (!mounted) return;
          setState(() => _adState = _AdState.failed);
        },
      ),
      request: const AdRequest(),
      nativeAdOptions: NativeAdOptions(
        videoOptions: VideoOptions(startMuted: true),
      ),
    );
    _nativeAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    return switch (_adState) {
      _AdState.loaded  => AdWidget(ad: _nativeAd!),
      _AdState.loading => _buildPlaceholder(context),
      _AdState.failed  => _buildPlaceholder(context),
    };
  }

  Widget _buildPlaceholder(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.ad_units, size: 48,
                color: Theme.of(context).colorScheme.outline),
            const SizedBox(height: 8),
            Text(
              _adState == _AdState.loading ? l.adLoading : '',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.outline),
            ),
          ],
        ),
      ),
    );
  }
}
