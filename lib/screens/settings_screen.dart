// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static final _gplUrl = Uri.parse('https://www.gnu.org/licenses/gpl-3.0.html');
  static final _githubUrl = Uri.parse('https://github.com/Androho24/SimpleVideoConverter');
  static final _privacyDe = Uri.parse('https://androho.com/de/privacy-policy/');
  static final _privacyEn = Uri.parse('https://androho.com/privacy-policy-2/');
  static final _impressumDe = Uri.parse('https://androho.com/de/impressum/');
  static final _impressumEn = Uri.parse('https://androho.com/98-2/');

  Future<void> _openUrl(BuildContext context, Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.linkOpenError)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isGerman = Localizations.localeOf(context).languageCode == 'de';
    final privacyUrl = isGerman ? _privacyDe : _privacyEn;
    final impressumUrl = isGerman ? _impressumDe : _impressumEn;

    final l = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l.settingsTitle),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: Text(l.licensesTitle),
            subtitle: Text(l.licensesSubtitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => showLicensePage(
              context: context,
              applicationName: 'Simple Video Converter',
              applicationVersion: '1.0.0',
              applicationLegalese: '© 2026 Androho Software',
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.balance_outlined),
            title: Text(l.gplLicenseTitle),
            subtitle: const Text('gnu.org/licenses/gpl-3.0.html'),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => _openUrl(context, _gplUrl),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.code),
            title: Text(l.sourceCodeTitle),
            subtitle: const Text('github.com/Androho24/SimpleVideoConverter'),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => _openUrl(context, _githubUrl),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: Text(l.privacyPolicyTitle),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => _openUrl(context, privacyUrl),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(l.imprintTitle),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => _openUrl(context, impressumUrl),
          ),
          const Divider(),
          // TODO: In-App-Kauf "Werbung entfernen" hier einbauen
        ],
      ),
    );
  }
}
