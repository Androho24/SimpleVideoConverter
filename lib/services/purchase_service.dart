// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'preferences_service.dart';

class PurchaseService {
  static const _productId = 'remove_ads';

  static final _isProController = StreamController<bool>.broadcast();
  static Stream<bool> get isProStream => _isProController.stream;

  static final _errorController = StreamController<String>.broadcast();
  /// Feuert eine Fehlermeldung bei fehlgeschlagenem Kauf.
  static Stream<String> get errorStream => _errorController.stream;

  static StreamSubscription<List<PurchaseDetails>>? _subscription;
  static ProductDetails? _productDetails;

  /// Geladener Preis aus dem Play Store, z.B. "0,99 €". Bis zum Laden: "–".
  static String get price => _productDetails?.price ?? '–';

  // ---------------------------------------------------------------------------
  // Initialisierung
  // ---------------------------------------------------------------------------

  static Future<void> initialize() async {
    _subscription = InAppPurchase.instance.purchaseStream.listen(
      _handlePurchaseUpdate,
      onError: (error) => debugPrint('PurchaseService: Stream-Fehler: $error'),
    );
    await _loadProductDetails();
  }

  static Future<void> _loadProductDetails() async {
    try {
      final available = await InAppPurchase.instance.isAvailable();
      if (!available) return;

      final response = await InAppPurchase.instance.queryProductDetails({_productId});
      if (response.productDetails.isNotEmpty) {
        _productDetails = response.productDetails.first;
      }
    } catch (e) {
      debugPrint('PurchaseService: Produktdetails konnten nicht geladen werden: $e');
    }
  }

  // ---------------------------------------------------------------------------
  // Kauf-Aktionen
  // ---------------------------------------------------------------------------

  static Future<void> buyRemoveAds() async {
    if (_productDetails == null) {
      await _loadProductDetails();
      if (_productDetails == null) return;
    }
    final param = PurchaseParam(productDetails: _productDetails!);
    await InAppPurchase.instance.buyNonConsumable(purchaseParam: param);
  }

  static Future<void> restorePurchases() async {
    await InAppPurchase.instance.restorePurchases();
  }

  // ---------------------------------------------------------------------------
  // Kauf-Ergebnis verarbeiten
  // ---------------------------------------------------------------------------

  static void _handlePurchaseUpdate(List<PurchaseDetails> purchases) {
    for (final purchase in purchases) {
      if (purchase.productID != _productId) continue;

      if (purchase.status == PurchaseStatus.purchased ||
          purchase.status == PurchaseStatus.restored) {
        PreferencesService.setIsPro(true);
        _isProController.add(true);
        debugPrint('PurchaseService: Pro-Version aktiviert');
      } else if (purchase.status == PurchaseStatus.error) {
        final msg = purchase.error?.message ?? 'Unbekannter Fehler';
        debugPrint('PurchaseService: Kauf fehlgeschlagen: $msg');
        _errorController.add(msg);
      }

      // PFLICHT: completePurchase() aufrufen, sonst wird nach 3 Tagen rückerstattet
      if (purchase.pendingCompletePurchase) {
        InAppPurchase.instance.completePurchase(purchase);
      }
    }
  }

  static void dispose() {
    _subscription?.cancel();
  }
}
