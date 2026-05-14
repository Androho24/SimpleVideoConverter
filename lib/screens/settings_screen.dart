// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/app_localizations.dart';
import '../screens/app_settings_screen.dart';
import '../screens/feedback_screen.dart';
import '../screens/open_source_screen.dart';
import '../services/preferences_service.dart';
import '../services/purchase_service.dart';

class SettingsScreen extends StatefulWidget {
  final void Function(int)? onNavigate;

  const SettingsScreen({super.key, this.onNavigate});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isPro = false;
  StreamSubscription<bool>? _proSub;
  StreamSubscription<String>? _errorSub;

  static final _privacyDe = Uri.parse('https://androho.com/de/privacy-policy/');
  static final _privacyEn = Uri.parse('https://androho.com/privacy-policy-2/');
  static final _impressumDe = Uri.parse('https://androho.com/de/impressum/');
  static final _impressumEn = Uri.parse('https://androho.com/98-2/');

  @override
  void initState() {
    super.initState();
    PreferencesService.getIsPro().then((v) {
      if (mounted) setState(() => _isPro = v);
    });
    _proSub = PurchaseService.isProStream.listen((isPro) {
      if (!mounted) return;
      setState(() => _isPro = isPro);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.purchaseSuccess)),
      );
    });
    _errorSub = PurchaseService.errorStream.listen((msg) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.purchaseError),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    });
  }

  @override
  void dispose() {
    _proSub?.cancel();
    _errorSub?.cancel();
    super.dispose();
  }

  Future<void> _openUrl(BuildContext context, Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context)!.linkOpenError)),
        );
      }
    }
  }

  Widget _sectionHeader(String title) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
    child: Text(
      title,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: Theme.of(context).colorScheme.primary,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.8,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final isGerman = Localizations.localeOf(context).languageCode == 'de';
    final privacyUrl = isGerman ? _privacyDe : _privacyEn;
    final impressumUrl = isGerman ? _impressumDe : _impressumEn;
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
      bottomNavigationBar: NavigationBar(
        selectedIndex: 2,
        onDestinationSelected: (index) {
          if (index == 2) return;
          Navigator.pop(context);
          widget.onNavigate?.call(index);
        },
        destinations: [
          NavigationDestination(icon: const Icon(Icons.tune), label: l.modeNormal),
          NavigationDestination(icon: const Icon(Icons.settings_applications), label: l.modeExpert),
          NavigationDestination(icon: const Icon(Icons.settings_outlined), label: l.settingsTitle),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.feedback_outlined),
            title: Text(l.feedbackTitle),
            subtitle: Text(l.feedbackSubtitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const FeedbackScreen())),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.tune_outlined),
            title: Text(l.appSettingsTitle),
            subtitle: Text(l.appSettingsSubtitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const AppSettingsScreen())),
          ),
          _sectionHeader(l.legalSectionTitle),
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
          ListTile(
            leading: const Icon(Icons.code),
            title: Text(l.openSourceTitle),
            subtitle: Text(l.openSourceSubtitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const OpenSourceScreen())),
          ),

          _sectionHeader(l.proSectionTitle),
          if (_isPro)
            ListTile(
              leading: Icon(Icons.check_circle_outline,
                  color: Theme.of(context).colorScheme.primary),
              title: Text(l.removeAdsActiveTitle),
              subtitle: Text(l.removeAdsActiveSubtitle),
            )
          else ...[
            ListTile(
              leading: const Icon(Icons.block_outlined),
              title: Text(l.removeAdsTitle),
              subtitle: Text(l.removeAdsSubtitle(PurchaseService.price)),
              trailing: FilledButton(
                onPressed: PurchaseService.buyRemoveAds,
                child: Text(l.purchaseButton),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.restore),
              title: Text(l.restorePurchasesTitle),
              onTap: PurchaseService.restorePurchases,
            ),
          ],
        ],
      ),
    );
  }
}
