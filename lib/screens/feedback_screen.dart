// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../l10n/app_localizations.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  String _category = 'bug';
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  String _subjectFor(String category, AppLocalizations l) {
    return switch (category) {
      'bug'      => '[Bug] Video Converter',
      'feature'  => '[Feature Request] Video Converter',
      _          => '[Feedback] Video Converter',
    };
  }

  Future<void> _send() async {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    final l = AppLocalizations.of(context)!;
    final subject = Uri.encodeComponent(_subjectFor(_category, l));
    final body = Uri.encodeComponent(text);
    final uri = Uri.parse('mailto:info@androho.com?subject=$subject&body=$body');

    if (!await launchUrl(uri)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l.linkOpenError)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l.feedbackTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: _category,
              decoration: InputDecoration(
                labelText: l.feedbackCategoryLabel,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              items: [
                DropdownMenuItem(value: 'bug',      child: Text(l.feedbackCategoryBug)),
                DropdownMenuItem(value: 'feature',  child: Text(l.feedbackCategoryFeature)),
                DropdownMenuItem(value: 'feedback', child: Text(l.feedbackCategoryFeedback)),
              ],
              onChanged: (v) => setState(() => _category = v ?? 'bug'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _messageController,
              minLines: 5,
              maxLines: 12,
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(
                hintText: l.feedbackMessageHint,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              icon: const Icon(Icons.send_outlined),
              label: Text(l.feedbackSendButton),
              onPressed: _send,
            ),
          ],
        ),
      ),
    );
  }
}
