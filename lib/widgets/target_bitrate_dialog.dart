// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/app_localizations.dart';

/// Erlaubter Bereich der Ziel-Bitrate in kbps.
///
/// Die Obergrenze orientiert sich am Quellmaterial, das diese App bekommt:
/// 4K60-Handyaufnahmen liegen bei 50–100 Mbps, UHD-Blu-ray bei ~80–100 Mbps.
/// Mehr als die Quellbitrate bringt beim Re-Encoding nichts. 100 Mbps deckt
/// außerdem den CRF-Bereich ab, den der Qualitätsmodus anbietet — CRF 1
/// entspricht nach der Kurve in `OutputSizeEstimator` rund 50 Mbps bei 1080p.
const kMinTargetBitrateKbps = 500;
const kMaxTargetBitrateKbps = 100000;

/// Rechnet eine Eingabe in kbps um.
///
/// Gibt `null` zurück, wenn die Eingabe keine Zahl ist oder außerhalb von
/// [kMinTargetBitrateKbps]–[kMaxTargetBitrateKbps] liegt. Bewusst kein Clamping:
/// eine stillschweigend veränderte Zahl ist verwirrender als eine Fehlermeldung.
int? parseTargetBitrateInput(String text, {required bool isMbps}) {
  final value = double.tryParse(text.trim().replaceAll(',', '.'));
  if (value == null) return null;
  final kbps = (isMbps ? value * 1000 : value).round();
  if (kbps < kMinTargetBitrateKbps || kbps > kMaxTargetBitrateKbps) return null;
  return kbps;
}

/// Formatiert kbps für die Anzeige in der gewählten Einheit — ohne unnötige
/// Nachkommastelle (8000 kbps → "8", 8500 kbps → "8.5").
String formatTargetBitrateInput(int kbps, {required bool isMbps}) {
  if (!isMbps) return '$kbps';
  final mbps = kbps / 1000;
  return mbps == mbps.truncateToDouble() ? '${mbps.toInt()}' : mbps.toString();
}

/// Fragt eine Ziel-Bitrate ab. Liefert den bestätigten Wert in kbps, oder
/// `null` bei Abbruch.
Future<int?> showTargetBitrateDialog(
  BuildContext context, {
  required int currentKbps,
}) => showDialog<int>(
  context: context,
  builder: (_) => _TargetBitrateDialog(currentKbps: currentKbps),
);

class _TargetBitrateDialog extends StatefulWidget {
  final int currentKbps;

  const _TargetBitrateDialog({required this.currentKbps});

  @override
  State<_TargetBitrateDialog> createState() => _TargetBitrateDialogState();
}

class _TargetBitrateDialogState extends State<_TargetBitrateDialog> {
  late final TextEditingController _controller;
  late bool _isMbps;
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    // Einheit passend zum aktuellen Wert vorbelegen: kleine Bitraten gibt man
    // eher in kbps ein, große in Mbps.
    _isMbps = widget.currentKbps >= 1000;
    _controller = TextEditingController(
      text: formatTargetBitrateInput(widget.currentKbps, isMbps: _isMbps),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Beim Einheitenwechsel den eingegebenen Wert umrechnen statt ihn stehen zu
  /// lassen — "8" darf nicht von 8 Mbps zu 8 kbps werden.
  void _changeUnit(bool isMbps) {
    if (isMbps == _isMbps) return;
    // Der eingetippte Wert steht noch in der alten Einheit.
    final value = double.tryParse(_controller.text.trim().replaceAll(',', '.'));
    final kbps = value == null
        ? null
        : (_isMbps ? value * 1000 : value).round();
    setState(() {
      _isMbps = isMbps;
      if (kbps != null) {
        _controller.text = formatTargetBitrateInput(kbps, isMbps: isMbps);
      }
    });
  }

  void _submit() {
    final kbps = parseTargetBitrateInput(_controller.text, isMbps: _isMbps);
    if (kbps == null) {
      setState(() => _showError = true);
      return;
    }
    Navigator.pop(context, kbps);
  }

  String get _rangeLabel {
    if (!_isMbps) return '$kMinTargetBitrateKbps–$kMaxTargetBitrateKbps kbps';
    final min = formatTargetBitrateInput(kMinTargetBitrateKbps, isMbps: true);
    final max = formatTargetBitrateInput(kMaxTargetBitrateKbps, isMbps: true);
    return '$min–$max Mbps';
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final hint = l.targetBitrateRangeHint(_rangeLabel);

    return AlertDialog(
      title: Text(l.targetBitrateLabel),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            key: const ValueKey('target_bitrate_field'),
            controller: _controller,
            autofocus: true,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
            ],
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              helperText: hint,
              errorText: _showError ? hint : null,
            ),
            onChanged: (_) {
              if (_showError) setState(() => _showError = false);
            },
            onSubmitted: (_) => _submit(),
          ),
          const SizedBox(height: 16),
          SegmentedButton<bool>(
            showSelectedIcon: false,
            segments: const [
              ButtonSegment(value: false, label: Text('kbps')),
              ButtonSegment(value: true, label: Text('Mbps')),
            ],
            selected: {_isMbps},
            onSelectionChanged: (sel) => _changeUnit(sel.first),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l.cancel),
        ),
        TextButton(onPressed: _submit, child: Text(l.ok)),
      ],
    );
  }
}
