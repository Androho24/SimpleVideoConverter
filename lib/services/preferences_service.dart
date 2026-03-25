// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const _keyExpertMode = 'expertMode';

  static Future<bool> getExpertMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyExpertMode) ?? false;
  }

  static Future<void> setExpertMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyExpertMode, value);
  }
}
