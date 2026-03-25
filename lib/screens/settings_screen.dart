// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static final _gplUrl = Uri.parse('https://www.gnu.org/licenses/gpl-3.0.html');
  static final _githubUrl = Uri.parse('https://github.com/Androho24/SimpleVideoConverter');

  Future<void> _openUrl(BuildContext context, Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Link konnte nicht geöffnet werden.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Einstellungen'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text('Lizenzen'),
            subtitle: const Text('Open-Source-Lizenzen dieser App'),
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
            title: const Text('GPL-3.0 Lizenztext'),
            subtitle: const Text('gnu.org/licenses/gpl-3.0.html'),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => _openUrl(context, _gplUrl),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text('Quellcode (GitHub)'),
            subtitle: const Text('github.com/Androho24/SimpleVideoConverter'),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => _openUrl(context, _githubUrl),
          ),
          const Divider(),
          // TODO: In-App-Kauf "Werbung entfernen" hier einbauen
        ],
      ),
    );
  }
}
