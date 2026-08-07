// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../l10n/app_localizations.dart';
import '../services/ad_config.dart';
import '../services/ads_service.dart';
import '../services/native_ad_preloader.dart';
import '../services/native_ad_style.dart';
import '../services/preferences_service.dart';

enum _AdState { loading, loaded, failed }

class NativeAdWidget extends StatefulWidget {
  const NativeAdWidget({super.key});

  @override
  State<NativeAdWidget> createState() => _NativeAdWidgetState();
}

class _NativeAdWidgetState extends State<NativeAdWidget> {
  NativeAd? _nativeAd;
  _AdState _adState = _AdState.loading;
  bool _isPro = false;

  @override
  void initState() {
    super.initState();
    _initAd();
  }

  Future<void> _initAd() async {
    final isPro = await PreferencesService.getIsPro();
    if (!mounted) return;
    setState(() => _isPro = isPro);
    if (isPro) return;

    // Preloaded Ad konsumieren, falls vorhanden — spart die Ladezeit beim
    // Öffnen des Conversion-Screens.
    final preloadFuture = NativeAdPreloader.consume();
    if (preloadFuture != null) {
      final preloadedAd = await preloadFuture;
      if (!mounted) {
        if (preloadedAd != null) unawaited(preloadedAd.dispose());
        return;
      }
      if (preloadedAd != null) {
        setState(() {
          _nativeAd = preloadedAd;
          _adState = _AdState.loaded;
        });
        return;
      }
      // Preload ist fehlgeschlagen → eigenen Load anstoßen.
    }
    await _loadAd();
  }

  @override
  void dispose() {
    final ad = _nativeAd;
    if (ad != null) unawaited(ad.dispose());
    super.dispose();
  }

  Future<void> _loadAd() async {
    if (!await AdsService.waitUntilReady()) {
      if (mounted) setState(() => _adState = _AdState.failed);
      return;
    }
    if (!mounted) return;
    final brightness = Theme.of(context).brightness;

    late final NativeAd ad;
    ad = NativeAd(
      adUnitId: AdConfig.nativeAdUnitId,
      listener: NativeAdListener(
        onAdLoaded: (loadedAd) {
          if (!mounted) {
            unawaited(loadedAd.dispose());
            return;
          }
          setState(() {
            _nativeAd = loadedAd as NativeAd;
            _adState = _AdState.loaded;
          });
        },
        onAdFailedToLoad: (failedAd, _) {
          unawaited(failedAd.dispose());
          if (!mounted) return;
          setState(() {
            _nativeAd = null;
            _adState = _AdState.failed;
          });
        },
      ),
      request: const AdRequest(),
      nativeAdOptions: NativeAdOptions(
        videoOptions: VideoOptions(startMuted: true),
      ),
      nativeTemplateStyle: nativeAdTemplateStyle(brightness),
    );
    _nativeAd = ad;
    try {
      await ad.load();
    } catch (_) {
      await ad.dispose();
      if (mounted) {
        setState(() {
          _nativeAd = null;
          _adState = _AdState.failed;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isPro) return const SizedBox.shrink();
    return switch (_adState) {
      _AdState.loaded => AdWidget(ad: _nativeAd!),
      _AdState.loading => _buildPlaceholder(context),
      _AdState.failed => _buildPlaceholder(context),
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
            Icon(
              Icons.ad_units,
              size: 48,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 8),
            Text(
              _adState == _AdState.loading ? l.adLoading : '',
              style: TextStyle(color: Theme.of(context).colorScheme.outline),
            ),
          ],
        ),
      ),
    );
  }
}
