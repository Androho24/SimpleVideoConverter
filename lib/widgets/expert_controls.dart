// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../l10n/app_localizations.dart';
import '../models/expert_settings.dart';
import '../models/video_metadata.dart';
import '../services/ffmpeg_codec_options.dart';
import '../services/media_format_compatibility.dart';
import '../services/output_size_estimator.dart';
import '../services/video_quality_scale.dart';
import 'target_bitrate_dialog.dart';

/// Maximale Auflösung pro Seite (4K).
const _maxDimension = 3840;

/// Verfügbare Ziel-Bitraten (kbps) für den Bitrate-Modus (als Schnellauswahl).
const _targetBitrateOptions = [500, 1000, 2000, 4000, 6000, 8000, 12000, 20000];

class ExpertControls extends StatefulWidget {
  final ExpertSettings settings;
  final bool isConverting;
  final VideoMetadata? metadata;
  final ValueChanged<ExpertSettings> onChanged;

  /// AV1 ist eine experimentelle Option und wird nur angeboten, wenn sie in den
  /// App-Einstellungen eingeschaltet wurde.
  final bool av1Enabled;

  /// Hat das Gerät einen HEVC-Hardware-Encoder? Nur dann gibt es unter H.265
  /// den Schalter „Hardware-Encoder“.
  final bool hardwareHevcAvailable;

  const ExpertControls({
    super.key,
    required this.settings,
    required this.isConverting,
    required this.onChanged,
    this.metadata,
    this.av1Enabled = false,
    this.hardwareHevcAvailable = false,
  });

  @override
  State<ExpertControls> createState() => _ExpertControlsState();
}

class _ExpertControlsState extends State<ExpertControls> {
  late final TextEditingController _widthController;
  late final TextEditingController _heightController;
  late final TextEditingController _targetBitrateController;
  bool _aspectLocked = true;

  @override
  void initState() {
    super.initState();
    // Bevorzuge explizit gesetzte Werte aus settings; falle auf Metadaten zurück
    // (z.B. beim Wechsel Normal → Expert mit bereits geladenem Video)
    final initWidth = widget.settings.width != 0
        ? widget.settings.width
        : (widget.metadata?.width ?? 0);
    final initHeight = widget.settings.height != 0
        ? widget.settings.height
        : (widget.metadata?.height ?? 0);
    _widthController = TextEditingController(
      text: initWidth == 0 ? '' : initWidth.toString(),
    );
    _heightController = TextEditingController(
      text: initHeight == 0 ? '' : initHeight.toString(),
    );
    _targetBitrateController = TextEditingController(
      text: _targetBitrateLabel(widget.settings.targetBitrateKbps),
    );
    // ExpertSettings im Parent synchronisieren, falls Metadaten verwendet wurden
    if (widget.settings.width == 0 &&
        widget.settings.height == 0 &&
        widget.metadata != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          widget.onChanged(
            widget.settings.copyWith(width: initWidth, height: initHeight),
          );
        }
      });
    }
  }

  @override
  void didUpdateWidget(ExpertControls oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.settings.targetBitrateKbps !=
        oldWidget.settings.targetBitrateKbps) {
      _targetBitrateController.text = _targetBitrateLabel(
        widget.settings.targetBitrateKbps,
      );
    }
    if (widget.metadata != oldWidget.metadata && widget.metadata != null) {
      _widthController.text = widget.metadata!.width.toString();
      _heightController.text = widget.metadata!.height.toString();
      setState(() => _aspectLocked = true);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        var updated = widget.settings.copyWith(
          width: widget.metadata!.width,
          height: widget.metadata!.height,
        );
        // AC3 zurücksetzen wenn neues Video kein Surround hat
        if (updated.audioCodec == 'ac3' &&
            (widget.metadata?.audioChannels ?? 0) < 3) {
          updated = updated.copyWith(audioCodec: 'aac', audioBitrate: 128);
        }
        // Kanal-Auswahl zurücksetzen wenn nicht mehr mit Quelle kompatibel
        final srcCh = widget.metadata?.audioChannels ?? 0;
        if ((updated.audioChannels == 6 && srcCh < 6) ||
            (updated.audioChannels == 2 && srcCh == 1)) {
          updated = updated.copyWith(audioChannels: 0);
        }
        updated = _withCompatibleContainer(updated);
        widget.onChanged(updated);
      });
    }
  }

  @override
  void dispose() {
    _widthController.dispose();
    _heightController.dispose();
    _targetBitrateController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Auflösungs-Hilfsmethoden
  // ---------------------------------------------------------------------------

  void _onWidthChanged(String v) {
    int newWidth = int.tryParse(v) ?? 0;
    if (newWidth > _maxDimension) {
      newWidth = _maxDimension;
      _widthController.text = _maxDimension.toString();
      _widthController.selection = TextSelection.collapsed(
        offset: _widthController.text.length,
      );
    }
    final s = widget.settings;
    final meta = widget.metadata;
    if (_aspectLocked && newWidth > 0 && meta != null && meta.height > 0) {
      final aspectRatio = meta.width / meta.height;
      int newHeight = (newWidth / aspectRatio).round();
      newHeight = ((newHeight ~/ 2) * 2).clamp(2, _maxDimension);
      _heightController.text = newHeight.toString();
      widget.onChanged(s.copyWith(width: newWidth, height: newHeight));
    } else {
      widget.onChanged(s.copyWith(width: newWidth));
    }
  }

  void _onHeightChanged(String v) {
    int newHeight = int.tryParse(v) ?? 0;
    if (newHeight > _maxDimension) {
      newHeight = _maxDimension;
      _heightController.text = _maxDimension.toString();
      _heightController.selection = TextSelection.collapsed(
        offset: _heightController.text.length,
      );
    }
    final s = widget.settings;
    final meta = widget.metadata;
    if (_aspectLocked && newHeight > 0 && meta != null && meta.width > 0) {
      final aspectRatio = meta.width / meta.height;
      int newWidth = (newHeight * aspectRatio).round();
      newWidth = ((newWidth ~/ 2) * 2).clamp(2, _maxDimension);
      _widthController.text = newWidth.toString();
      widget.onChanged(s.copyWith(width: newWidth, height: newHeight));
    } else {
      widget.onChanged(s.copyWith(height: newHeight));
    }
  }

  void _toggleAspectLock() {
    final meta = widget.metadata;
    if (!_aspectLocked && meta != null) {
      // Sperren: dominante Seite des Originalvideos bestimmt welcher Wert berechnet wird
      final currentWidth = int.tryParse(_widthController.text) ?? 0;
      final currentHeight = int.tryParse(_heightController.text) ?? 0;
      if (currentWidth > 0 || currentHeight > 0) {
        if (meta.width >= meta.height) {
          // Querformat: Breite dominant → Höhe neu berechnen
          _onWidthChanged(
            currentWidth > 0 ? currentWidth.toString() : meta.width.toString(),
          );
        } else {
          // Hochformat: Höhe dominant → Breite neu berechnen
          _onHeightChanged(
            currentHeight > 0
                ? currentHeight.toString()
                : meta.height.toString(),
          );
        }
      }
    }
    setState(() => _aspectLocked = !_aspectLocked);
  }

  Widget _buildLockButton(AppLocalizations l) {
    final meta = widget.metadata;
    return SizedBox(
      width: 40,
      child: IconButton(
        icon: Icon(_aspectLocked ? Icons.link : Icons.link_off, size: 20),
        onPressed: (meta != null && !widget.isConverting)
            ? _toggleAspectLock
            : null,
        tooltip: _aspectLocked ? l.aspectLocked : l.aspectUnlocked,
        padding: EdgeInsets.zero,
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Hilfsmethoden
  // ---------------------------------------------------------------------------

  /// Gibt die sinnvollen Bitrate-Einträge für den gewählten Codec zurück.
  List<DropdownMenuEntry<int>> _bitrateEntries(
    String codec,
    AppLocalizations l,
  ) {
    if (codec == 'ac3') {
      return [
        DropdownMenuEntry(value: 0, label: l.silent),
        for (final b in [192, 256, 320, 384, 448, 640])
          DropdownMenuEntry(value: b, label: '$b kbps'),
      ];
    }
    final maxBitrate = codec == 'opus' ? 192 : 320;
    return [
      DropdownMenuEntry(value: 0, label: l.silent),
      for (final b in [64, 96, 128, 192, 320])
        if (b <= maxBitrate) DropdownMenuEntry(value: b, label: '$b kbps'),
    ];
  }

  List<ButtonSegment<int>> _channelSegments(
    ExpertSettings s,
    AppLocalizations l,
  ) {
    final srcCh = widget.metadata?.audioChannels ?? 0;
    return [
      ButtonSegment(value: 0, label: Text(l.audioChannelOriginal)),
      if (srcCh >= 6 && s.audioCodec != 'mp3')
        const ButtonSegment(value: 6, label: Text('5.1')),
      if (srcCh != 1) const ButtonSegment(value: 2, label: Text('Stereo')),
      const ButtonSegment(value: 1, label: Text('Mono')),
    ];
  }

  ExpertSettings _withCompatibleContainer(ExpertSettings settings) {
    final container = MediaFormatCompatibility.preferredContainer(
      videoCodec: settings.videoCodec,
      audioCodec: settings.audioCodec,
      currentContainer: settings.container,
    );
    return settings.copyWith(container: container);
  }

  /// Der Hardware-Schalter gehört zu H.265. Wechselt der Codec, fällt er weg,
  /// damit er bei einer späteren Rückkehr zu H.265 nicht unbemerkt noch an ist.
  ExpertSettings _withValidHardwareEncoder(ExpertSettings settings) =>
      settings.videoCodec == MediaFormatCompatibility.videoCodecH265
      ? settings
      : settings.copyWith(hardwareEncoder: false);

  void _emitCodecChange(ExpertSettings updated) {
    final compatible = _withValidHardwareEncoder(
      _withCompatibleContainer(updated),
    );
    widget.onChanged(compatible);
    if (!updated.audioOnly &&
        compatible.container != widget.settings.container) {
      final l = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              l.outputFormatAdjusted(
                MediaFormatCompatibility.labelFor(compatible.container),
              ),
            ),
          ),
        );
    }
  }

  String _videoCodecLabel(AppLocalizations l, String codec) => switch (codec) {
    MediaFormatCompatibility.videoCodecH264 => 'H.264',
    MediaFormatCompatibility.videoCodecH265 => 'H.265',
    MediaFormatCompatibility.videoCodecVp9 => 'VP9',
    MediaFormatCompatibility.videoCodecAv1 => 'AV1',
    MediaFormatCompatibility.videoCodecXvid => l.xvidLegacyLabel,
    _ => codec.toUpperCase(),
  };

  /// VP9 und AV1 haben eine 0–63-Skala mit anderer Bedeutung als die 0–51 von
  /// x264/x265/Xvid, deshalb ein eigener Hilfetext.
  String _crfInfoContent(AppLocalizations l, String codec) =>
      VideoQualityScale.usesWideScale(codec)
      ? l.crfInfoContentWideScale
      : l.crfInfoContent;

  /// Die Bitraten-Richtwerte im Hilfetext sind auf H.264 geeicht.
  String _targetBitrateInfoContent(AppLocalizations l, String codec) =>
      VideoQualityScale.usesWideScale(codec)
      ? '${l.targetBitrateInfoContent}\n\n${l.targetBitrateWideScaleHint}'
      : l.targetBitrateInfoContent;

  /// Der Hinweis gehört zum Good-Quality-Modus von libaom: dort ist AV1 auf
  /// Mobilgeräten deutlich langsamer als x264/x265 (Pixel 10: 46 s 1080p ≈
  /// 28 min), oberhalb von 720p wird zusätzlich zum Herunterskalieren geraten.
  /// AV1 läuft derzeit mit `-usage realtime` und ist damit schnell genug, dass
  /// die Warnung nicht mehr stimmt — deshalb ausgeblendet statt entfernt: sie
  /// wird wieder gebraucht, falls der Good-Quality-Modus zurückkommt.
  /// Die Strings `av1SlowHint`/`av1HighResHint` bleiben aus demselben Grund in
  /// allen Locales stehen.
  static const _showAv1Hint = false;

  String _av1Hint(AppLocalizations l, ExpertSettings settings) {
    final metadata = widget.metadata;
    if (metadata == null) return l.av1SlowHint;
    final (width, height) = OutputSizeEstimator.expertOutputDimensions(
      metadata,
      settings,
    );
    final shortSide = width < height ? width : height;
    return shortSide > 720
        ? '${l.av1SlowHint} ${l.av1HighResHint}'
        : l.av1SlowHint;
  }

  String _audioCodecLabel(String codec) => switch (codec) {
    MediaFormatCompatibility.audioCodecAac => 'AAC',
    MediaFormatCompatibility.audioCodecMp3 => 'MP3',
    MediaFormatCompatibility.audioCodecOpus => 'Opus',
    MediaFormatCompatibility.audioCodecAc3 => 'AC3',
    MediaFormatCompatibility.audioCodecVorbis => 'Vorbis',
    _ => codec.toUpperCase(),
  };

  Widget _choiceChip({
    required Key key,
    required String label,
    required bool selected,
    required bool enabled,
    required VoidCallback onSelected,
    bool muted = false,
  }) => ChoiceChip(
    key: key,
    label: Text(label),
    selected: selected,
    onSelected: enabled ? (_) => onSelected() : null,
    labelStyle: muted
        ? TextStyle(color: Theme.of(context).disabledColor)
        : null,
    backgroundColor: muted
        ? Theme.of(context).disabledColor.withAlpha(20)
        : null,
    side: muted
        ? BorderSide(color: Theme.of(context).disabledColor.withAlpha(90))
        : null,
  );

  void _selectContainer(MediaContainerOption container) {
    final s = widget.settings;
    final currentlyCompatible = MediaFormatCompatibility.supports(
      container: container.id,
      videoCodec: s.videoCodec,
      audioCodec: s.audioCodec,
    );
    if (currentlyCompatible) {
      widget.onChanged(s.copyWith(container: container.id));
      return;
    }

    final videoCodec = MediaFormatCompatibility.defaultVideoCodecFor(
      container.id,
    );
    final audioCodec = container.audioCodecs.contains(s.audioCodec)
        ? s.audioCodec
        : MediaFormatCompatibility.defaultAudioCodecFor(container.id);
    final audioBitrate = switch (audioCodec) {
      MediaFormatCompatibility.audioCodecAc3 => 384,
      MediaFormatCompatibility.audioCodecOpus when s.audioBitrate > 192 => 192,
      _ => s.audioBitrate.clamp(0, 320),
    };
    final audioChannels =
        audioCodec == MediaFormatCompatibility.audioCodecMp3 &&
            s.audioChannels == 6
        ? 0
        : s.audioChannels;

    widget.onChanged(
      _withValidHardwareEncoder(
        s.copyWith(
          container: container.id,
          videoCodec: videoCodec,
          audioCodec: audioCodec,
          audioBitrate: audioBitrate,
          audioChannels: audioChannels,
        ),
      ),
    );
  }

  /// Gibt einen lesbaren Label für eine Ziel-Bitrate in kbps zurück.
  String _targetBitrateLabel(int kbps) {
    if (kbps < 1000) return '$kbps kbps';
    final mbps = kbps / 1000;
    return mbps == mbps.truncateToDouble()
        ? '${mbps.toInt()} Mbps'
        : '$mbps Mbps';
  }

  /// Öffnet den Eingabedialog für einen eigenen Bitraten-Wert. Der bestätigte
  /// Wert landet im Dropdown, auch wenn er keiner der Vorgaben entspricht.
  Future<void> _editTargetBitrate(ExpertSettings settings) async {
    final kbps = await showTargetBitrateDialog(
      context,
      currentKbps: settings.targetBitrateKbps,
    );
    if (kbps == null || !mounted) return;
    _targetBitrateController.text = _targetBitrateLabel(kbps);
    if (kbps != settings.targetBitrateKbps) {
      widget.onChanged(settings.copyWith(targetBitrateKbps: kbps));
    }
  }

  // ---------------------------------------------------------------------------
  // Info-Dialoge
  // ---------------------------------------------------------------------------

  void _showInfo(BuildContext context, String title, String content) {
    final l = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: Text(l.ok)),
        ],
      ),
    );
  }

  Widget _hardwareHint(ThemeData theme, String text, Key key) => Text(
    text,
    key: key,
    style: theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    ),
  );

  Widget _infoButton(BuildContext context, String title, String content) =>
      IconButton(
        icon: Icon(
          Icons.info_outline,
          size: 16,
          color: Theme.of(context).colorScheme.outline,
        ),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        tooltip: title,
        onPressed: () => _showInfo(context, title, content),
      );

  // ---------------------------------------------------------------------------
  // UI
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final s = widget.settings;
    final theme = Theme.of(context);
    final labelStyle = theme.textTheme.labelMedium;
    final showHardwareSwitch =
        widget.hardwareHevcAvailable &&
        s.videoCodec == MediaFormatCompatibility.videoCodecH265;
    // Der Hardware-Encoder kennt kein CQ (auf keinem getesteten Gerät), daher
    // nur Bitraten-Modus, solange der Schalter an ist.
    final crfLocked = showHardwareSwitch && s.hardwareEncoder;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── CRF / Bitrate-Toggle, Auflösung, FPS — nur im Video-Modus ──────
        if (!s.audioOnly) ...[
          // ── Encoding-Modus-Toggle ────────────────────────────────────────
          Text(l.encodingModeLabel, style: labelStyle),
          const SizedBox(height: 4),
          SegmentedButton<String>(
            showSelectedIcon: false,
            segments: [
              ButtonSegment(
                value: 'crf',
                label: Text(l.encodingModeCrf),
                enabled: !crfLocked,
              ),
              ButtonSegment(
                value: 'bitrate',
                label: Text(l.encodingModeBitrate),
              ),
            ],
            selected: {s.bitrateMode},
            onSelectionChanged: widget.isConverting
                ? null
                : (sel) => widget.onChanged(s.copyWith(bitrateMode: sel.first)),
          ),
          const SizedBox(height: 12),

          // ── CRF-Dropdown (nur bei CRF-Modus) ────────────────────────────
          if (s.bitrateMode == 'crf') ...[
            Row(
              children: [
                Expanded(
                  child: DropdownMenu<int>(
                    key: ValueKey(s.crf),
                    expandedInsets: EdgeInsets.zero,
                    enabled: !widget.isConverting,
                    menuHeight: 400,
                    initialSelection: s.crf,
                    label: Text(l.crfLabel),
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    menuStyle: MenuStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    dropdownMenuEntries: [
                      for (
                        int i = 1;
                        i <= VideoQualityScale.maxCrf(s.videoCodec);
                        i++
                      )
                        DropdownMenuEntry(value: i, label: '$i'),
                    ],
                    onSelected: (v) {
                      if (v != null) widget.onChanged(s.copyWith(crf: v));
                    },
                  ),
                ),
                const SizedBox(width: 4),
                _infoButton(
                  context,
                  l.crfInfoTitle,
                  _crfInfoContent(l, s.videoCodec),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],

          // ── Ziel-Bitrate-Dropdown (nur bei Bitrate-Modus) ───────────────
          if (s.bitrateMode == 'bitrate') ...[
            Row(
              children: [
                Expanded(
                  child: DropdownMenu<int>(
                    key: const ValueKey('expert_target_bitrate_menu'),
                    expandedInsets: EdgeInsets.zero,
                    enabled: !widget.isConverting,
                    controller: _targetBitrateController,
                    // Kein Tippen im Feld: eigene Werte laufen über den
                    // Stift-Button daneben. Das Feld ist reine Auswahl.
                    requestFocusOnTap: false,
                    label: Text(l.targetBitrateLabel),
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    menuStyle: MenuStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    dropdownMenuEntries: [
                      for (final kbps in _targetBitrateOptions)
                        DropdownMenuEntry(
                          value: kbps,
                          label: _targetBitrateLabel(kbps),
                        ),
                    ],
                    onSelected: (v) {
                      if (v != null) {
                        widget.onChanged(s.copyWith(targetBitrateKbps: v));
                      }
                    },
                  ),
                ),
                const SizedBox(width: 4),
                IconButton(
                  key: const ValueKey('expert_target_bitrate_edit'),
                  icon: Icon(
                    Icons.edit_outlined,
                    size: 20,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  tooltip: l.targetBitrateEditTooltip,
                  onPressed: widget.isConverting
                      ? null
                      : () => _editTargetBitrate(s),
                ),
                const SizedBox(width: 4),
                _infoButton(
                  context,
                  l.targetBitrateInfoTitle,
                  _targetBitrateInfoContent(l, s.videoCodec),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],

          // ── Auflösung ───────────────────────────────────────────────────────
          Row(
            children: [
              Text(l.resolutionLabel, style: labelStyle),
              const SizedBox(width: 2),
              _infoButton(
                context,
                l.resolutionInfoTitle,
                l.resolutionInfoContent,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: TextField(
                  enabled: !widget.isConverting,
                  controller: _widthController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: l.widthLabel,
                    hintText: l.emptyEqualsOriginal,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixText: 'px',
                  ),
                  onChanged: _onWidthChanged,
                ),
              ),
              _buildLockButton(l),
              Expanded(
                child: TextField(
                  enabled: !widget.isConverting,
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    labelText: l.heightLabel,
                    hintText: l.emptyEqualsOriginal,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixText: 'px',
                  ),
                  onChanged: _onHeightChanged,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── FPS ─────────────────────────────────────────────────────────────
          Row(
            children: [
              Text(l.fpsLabel, style: labelStyle),
              const SizedBox(width: 2),
              _infoButton(context, l.fpsInfoTitle, l.fpsInfoContent),
            ],
          ),
          const SizedBox(height: 4),
          SegmentedButton<int>(
            showSelectedIcon: false,
            segments: [
              ButtonSegment(value: 0, label: Text(l.orig)),
              ButtonSegment(value: 24, label: Text('24')),
              ButtonSegment(value: 25, label: Text('25')),
              ButtonSegment(value: 30, label: Text('30')),
              ButtonSegment(value: 60, label: Text('60')),
            ],
            selected: {s.fps},
            onSelectionChanged: widget.isConverting
                ? null
                : (sel) => widget.onChanged(s.copyWith(fps: sel.first)),
          ),
          const SizedBox(height: 12),
        ],

        // ── Audio-Codec ───────────────────────────────────────────────────────
        Row(
          children: [
            Text(l.audioCodecLabel, style: labelStyle),
            const SizedBox(width: 2),
            _infoButton(context, l.audioCodecLabel, l.audioCodecInfoContent),
          ],
        ),
        const SizedBox(height: 4),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: [
            for (final codec in [
              MediaFormatCompatibility.audioCodecAac,
              MediaFormatCompatibility.audioCodecMp3,
              MediaFormatCompatibility.audioCodecOpus,
              if ((widget.metadata?.audioChannels ?? 0) >= 3)
                MediaFormatCompatibility.audioCodecAc3,
              MediaFormatCompatibility.audioCodecVorbis,
            ])
              _choiceChip(
                key: ValueKey('expert_audio_codec_$codec'),
                label: _audioCodecLabel(codec),
                selected: s.audioCodec == codec,
                enabled: !widget.isConverting && s.audioBitrate != 0,
                onSelected: () {
                  final int newBitrate;
                  if (codec == MediaFormatCompatibility.audioCodecAc3) {
                    newBitrate = 384;
                  } else if (codec == MediaFormatCompatibility.audioCodecOpus &&
                      s.audioBitrate > 192) {
                    newBitrate = 192;
                  } else {
                    newBitrate = s.audioBitrate.clamp(0, 320);
                  }
                  final newChannels =
                      codec == MediaFormatCompatibility.audioCodecMp3 &&
                          s.audioChannels == 6
                      ? 0
                      : s.audioChannels;
                  _emitCodecChange(
                    s.copyWith(
                      audioCodec: codec,
                      audioBitrate: newBitrate,
                      audioChannels: newChannels,
                    ),
                  );
                },
              ),
          ],
        ),
        const SizedBox(height: 12),

        // ── Audio-Bitrate ─────────────────────────────────────────────────────
        Row(
          children: [
            Expanded(
              child: DropdownMenu<int>(
                key: ValueKey('${s.audioBitrate}_${s.audioCodec}'),
                expandedInsets: EdgeInsets.zero,
                enabled: !widget.isConverting,
                initialSelection: s.audioBitrate,
                label: Text(l.audioBitrateLabel),
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                menuStyle: MenuStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                dropdownMenuEntries: _bitrateEntries(s.audioCodec, l),
                onSelected: (v) {
                  if (v != null) widget.onChanged(s.copyWith(audioBitrate: v));
                },
              ),
            ),
            const SizedBox(width: 4),
            _infoButton(
              context,
              l.audioBitrateLabel,
              l.audioBitrateInfoContent,
            ),
          ],
        ),
        const SizedBox(height: 12),

        // ── Audiokanäle ───────────────────────────────────────────────────────
        if (s.audioBitrate != 0) ...[
          Row(
            children: [
              Text(l.audioChannelsLabel, style: labelStyle),
              const SizedBox(width: 2),
              _infoButton(
                context,
                l.audioChannelsLabel,
                l.audioChannelsInfoContent,
              ),
            ],
          ),
          const SizedBox(height: 4),
          SegmentedButton<int>(
            showSelectedIcon: false,
            segments: _channelSegments(s, l),
            selected: {s.audioChannels},
            onSelectionChanged: widget.isConverting
                ? null
                : (sel) =>
                      widget.onChanged(s.copyWith(audioChannels: sel.first)),
          ),
          const SizedBox(height: 12),
        ],

        // ── Output-Format — nur im Video-Modus ───────────────────────────────
        if (!s.audioOnly) ...[
          Row(
            children: [
              Text(l.videoCodecTitle, style: labelStyle),
              const SizedBox(width: 2),
              _infoButton(
                context,
                l.videoCodecTitle,
                l.expertVideoCodecInfoContent,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              for (final codec in [
                MediaFormatCompatibility.videoCodecH264,
                MediaFormatCompatibility.videoCodecH265,
                MediaFormatCompatibility.videoCodecVp9,
                if (widget.av1Enabled) MediaFormatCompatibility.videoCodecAv1,
                MediaFormatCompatibility.videoCodecXvid,
              ])
                _choiceChip(
                  key: ValueKey('expert_video_codec_$codec'),
                  label: _videoCodecLabel(l, codec),
                  selected: s.videoCodec == codec,
                  enabled: !widget.isConverting,
                  onSelected: () => _emitCodecChange(
                    s.copyWith(
                      videoCodec: codec,
                      crf: VideoQualityScale.convertCrf(
                        s.crf,
                        fromCodec: s.videoCodec,
                        toCodec: codec,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (showHardwareSwitch) ...[
            const SizedBox(height: 4),
            SwitchListTile(
              key: const ValueKey('expert_hardware_encoder'),
              contentPadding: EdgeInsets.zero,
              title: Text(l.hwEncoderTitle),
              subtitle: Text(l.hwEncoderSubtitle),
              value: s.hardwareEncoder,
              onChanged: widget.isConverting
                  ? null
                  : (on) => widget.onChanged(
                      on
                          ? s.copyWith(
                              hardwareEncoder: true,
                              bitrateMode: 'bitrate',
                            )
                          : s.copyWith(hardwareEncoder: false),
                    ),
            ),
            // HDR braucht 10 Bit, der Hardware-Pfad kann nur 8 Bit; MKV
            // scheitert auf den Testgeräten. Der Auftrag läuft dann mit
            // libx265 — das soll vor dem Start sichtbar sein, nicht erst im
            // Ergebnis. Der Schalter bleibt an und greift wieder, sobald
            // Quelle und Format passen.
            if (s.hardwareEncoder && (widget.metadata?.isHdr ?? false))
              _hardwareHint(
                theme,
                l.hwEncoderHdrHint,
                const ValueKey('expert_hardware_encoder_hdr_hint'),
              ),
            if (s.hardwareEncoder &&
                !FfmpegCodecOptions.supportsHardwareContainer(s.container))
              _hardwareHint(
                theme,
                l.hwEncoderContainerHint(
                  MediaFormatCompatibility.labelFor(s.container),
                ),
                const ValueKey('expert_hardware_encoder_container_hint'),
              ),
          ],
          if (_showAv1Hint &&
              s.videoCodec == MediaFormatCompatibility.videoCodecAv1) ...[
            const SizedBox(height: 6),
            Text(
              _av1Hint(l, s),
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ],
          const SizedBox(height: 12),

          Row(
            children: [
              Text(l.outputFormatLabel, style: labelStyle),
              const SizedBox(width: 2),
              _infoButton(
                context,
                l.outputFormatLabel,
                l.outputFormatInfoContent,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              for (final container in MediaFormatCompatibility.containers)
                Builder(
                  builder: (context) {
                    final compatible = MediaFormatCompatibility.supports(
                      container: container.id,
                      videoCodec: s.videoCodec,
                      audioCodec: s.audioCodec,
                    );
                    return _choiceChip(
                      key: ValueKey('expert_container_${container.id}'),
                      label: container.label,
                      selected: s.container == container.id,
                      enabled: !widget.isConverting,
                      muted: !compatible,
                      onSelected: () => _selectContainer(container),
                    );
                  },
                ),
            ],
          ),
          const SizedBox(height: 6),
          Builder(
            builder: (context) {
              final compatible = MediaFormatCompatibility.compatibleContainers(
                videoCodec: s.videoCodec,
                audioCodec: s.audioCodec,
              ).map((option) => option.label).join(', ');
              return Text(
                l.compatibleFormatsHint(
                  _videoCodecLabel(l, s.videoCodec),
                  _audioCodecLabel(s.audioCodec),
                  compatible,
                ),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              );
            },
          ),
        ],
      ],
    );
  }
}
