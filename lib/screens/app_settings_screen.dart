// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../l10n/app_localizations.dart';
import '../services/preferences_service.dart';
import '../widgets/back_bottom_bar.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  bool _autoSaveVideos = false;
  bool _isPrivacyOptionsRequired = false;

  static const _adsChannel = MethodChannel('com.androho.simplevideoconverter/ads');

  @override
  void initState() {
    super.initState();
    PreferencesService.getAutoSaveVideos().then((v) {
      if (mounted) setState(() => _autoSaveVideos = v);
    });
    () async {
      try {
        final required = await _adsChannel.invokeMethod<bool>('isPrivacyOptionsRequired');
        if (mounted) setState(() => _isPrivacyOptionsRequired = required ?? false);
      } catch (_) {}
    }();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      bottomNavigationBar: const BackBottomBar(),
      body: ListView(
        children: [
          SwitchListTile(
            secondary: const Icon(Icons.save_alt_outlined),
            title: Text(l.autoSaveTitle),
            subtitle: Text(l.autoSaveSubtitle),
            value: _autoSaveVideos,
            onChanged: (v) {
              setState(() => _autoSaveVideos = v);
              PreferencesService.setAutoSaveVideos(v);
            },
          ),
          if (_isPrivacyOptionsRequired) ...[
            const Divider(),
            ListTile(
              leading: const Icon(Icons.tune_outlined),
              title: Text(l.adConsentTitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _adsChannel.invokeMethod('showPrivacyOptionsForm'),
            ),
          ],
        ],
      ),
    );
  }
}
