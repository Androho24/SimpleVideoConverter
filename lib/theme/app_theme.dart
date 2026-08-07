// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Helles und dunkles Theme der App. Beide leiten sich vom gleichen Seed ab,
/// damit sie dieselbe Farbfamilie behalten.
class AppTheme {
  AppTheme._();

  static const _seedColor = Colors.blue;

  static final ColorScheme lightScheme = ColorScheme.fromSeed(
    seedColor: _seedColor,
  );

  static final ColorScheme darkScheme = ColorScheme.fromSeed(
    seedColor: _seedColor,
    brightness: Brightness.dark,
  );

  /// Der Konvertieren-Button behält in beiden Themes bewusst die Farbe des
  /// hellen Schemas: kräftiges Blau mit weißer Schrift. Das dunkle Schema
  /// würde sonst auf ein helles Blau mit dunkler Schrift wechseln, was den
  /// wichtigsten Button der App optisch komplett verändert.
  static Color get actionButtonBackground => lightScheme.primary;
  static Color get actionButtonForeground => lightScheme.onPrimary;

  static final ThemeData light = ThemeData(
    colorScheme: lightScheme,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      systemOverlayStyle: overlayStyleFor(Brightness.light),
    ),
  );

  static final ThemeData dark = ThemeData(
    colorScheme: darkScheme,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: darkScheme.surface,
      foregroundColor: darkScheme.onSurface,
      systemOverlayStyle: overlayStyleFor(Brightness.dark),
    ),
  );

  /// Hintergrund von Statusleiste und Navigationsleiste. Entspricht der Fläche,
  /// über der die Leisten jeweils stehen (AppBar bzw. Scaffold-Hintergrund).
  static Color surfaceFor(Brightness brightness) =>
      brightness == Brightness.dark ? darkScheme.surface : Colors.white;

  /// Passendes System-UI-Overlay: dunkle Icons auf hellem Grund und umgekehrt.
  static SystemUiOverlayStyle overlayStyleFor(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final background = surfaceFor(brightness);
    return SystemUiOverlayStyle(
      statusBarColor: background,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: background,
      systemNavigationBarIconBrightness: isDark
          ? Brightness.light
          : Brightness.dark,
    );
  }
}
