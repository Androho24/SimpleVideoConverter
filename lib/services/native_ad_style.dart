// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../theme/app_theme.dart';

/// Template-Style der Native-Ad passend zum aktiven Theme.
///
/// Das Template rendert nativ, erbt also nichts vom Flutter-Theme: ohne
/// explizite Farben stünde im Dark Mode schwarze Schrift auf weißem Grund
/// mitten in der dunklen Oberfläche. Im hellen Theme bleiben die Default-
/// Textfarben des Templates unverändert.
NativeTemplateStyle nativeAdTemplateStyle(Brightness brightness) {
  if (brightness != Brightness.dark) {
    return NativeTemplateStyle(
      templateType: TemplateType.medium,
      mainBackgroundColor: Colors.white,
    );
  }
  return NativeTemplateStyle(
    templateType: TemplateType.medium,
    mainBackgroundColor: AppTheme.darkScheme.surfaceContainerHighest,
    primaryTextStyle: NativeTemplateTextStyle(
      textColor: AppTheme.darkScheme.onSurface,
    ),
    secondaryTextStyle: NativeTemplateTextStyle(
      textColor: AppTheme.darkScheme.onSurfaceVariant,
    ),
    tertiaryTextStyle: NativeTemplateTextStyle(
      textColor: AppTheme.darkScheme.onSurfaceVariant,
    ),
    callToActionTextStyle: NativeTemplateTextStyle(
      textColor: AppTheme.actionButtonForeground,
      backgroundColor: AppTheme.actionButtonBackground,
    ),
  );
}
