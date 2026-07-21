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
  String _videoCodec = PreferencesService.videoCodecH264;
  bool _isPrivacyOptionsRequired = false;

  static const _adsChannel = MethodChannel(
    'com.androho.simplevideoconverter/ads',
  );

  @override
  void initState() {
    super.initState();
    PreferencesService.getAutoSaveVideos().then((v) {
      if (mounted) setState(() => _autoSaveVideos = v);
    });
    PreferencesService.getVideoCodec().then((v) {
      if (mounted) setState(() => _videoCodec = v);
    });
    () async {
      try {
        final required = await _adsChannel.invokeMethod<bool>(
          'isPrivacyOptionsRequired',
        );
        if (mounted) {
          setState(() => _isPrivacyOptionsRequired = required ?? false);
        }
      } catch (_) {}
    }();
  }

  void _showVideoCodecInfo() {
    final l = AppLocalizations.of(context)!;
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.videoCodecInfoTitle),
        content: Text(l.videoCodecInfoContent),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l.ok)),
        ],
      ),
    );
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
          const Divider(),
          ListTile(
            leading: const Icon(Icons.video_settings_outlined),
            title: Text(l.videoCodecTitle),
            subtitle: Text(l.videoCodecSubtitle),
            trailing: IconButton(
              icon: const Icon(Icons.info_outline),
              tooltip: l.videoCodecInfoTitle,
              onPressed: _showVideoCodecInfo,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(72, 0, 16, 16),
            child: SizedBox(
              width: double.infinity,
              child: SegmentedButton<String>(
                showSelectedIcon: false,
                segments: const [
                  ButtonSegment(
                    value: PreferencesService.videoCodecH264,
                    label: Text('H.264'),
                  ),
                  ButtonSegment(
                    value: PreferencesService.videoCodecH265,
                    label: Text('H.265 / HEVC'),
                  ),
                ],
                selected: {_videoCodec},
                onSelectionChanged: (selection) {
                  final codec = selection.first;
                  setState(() => _videoCodec = codec);
                  PreferencesService.setVideoCodec(codec);
                },
              ),
            ),
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
