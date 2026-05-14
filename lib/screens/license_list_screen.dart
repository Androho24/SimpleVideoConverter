// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../l10n/app_localizations.dart';
import '../widgets/back_bottom_bar.dart';

class LicenseListScreen extends StatelessWidget {
  const LicenseListScreen({super.key});

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
      // Theme-Override versteckt den AppBar der LicensePage (toolbarHeight: 0)
      body: Theme(
        data: Theme.of(context).copyWith(
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
            toolbarHeight: 0,
          ),
        ),
        child: LicensePage(
          applicationName: l.appName,
          applicationLegalese: '© 2026 Androho Software',
        ),
      ),
    );
  }
}
