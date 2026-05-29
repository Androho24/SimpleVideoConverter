// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/app_localizations.dart';
import '../screens/license_list_screen.dart';
import '../widgets/back_bottom_bar.dart';

class OpenSourceScreen extends StatelessWidget {
  const OpenSourceScreen({super.key});

  static final _gplUrl = Uri.parse('https://www.gnu.org/licenses/gpl-3.0.html');
  static final _githubUrl = Uri.parse('https://github.com/Androho24/SimpleVideoConverter');

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
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: Text(l.openSourceLicensesTitle),
            subtitle: Text(l.licensesSubtitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const LicenseListScreen())),
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
        ],
      ),
    );
  }
}
