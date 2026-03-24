// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPreview extends StatefulWidget {
  final VideoPlayerController controller;
  final double trimStart;
  final double trimEnd;

  const VideoPreview({
    super.key,
    required this.controller,
    required this.trimStart,
    required this.trimEnd,
  });

  @override
  State<VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onControllerUpdate);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerUpdate);
    super.dispose();
  }

  void _onControllerUpdate() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    return Column(
      children: [
        AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.replay_10),
              onPressed: () {
                final totalMs = controller.value.duration.inMilliseconds;
                final minMs = (widget.trimStart * totalMs).toInt();
                final pos = controller.value.position - const Duration(seconds: 10);
                final clamped = pos.inMilliseconds < minMs
                    ? Duration(milliseconds: minMs)
                    : pos;
                controller.seekTo(clamped);
              },
            ),
            IconButton(
              icon: Icon(
                controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
              onPressed: () {
                controller.value.isPlaying ? controller.pause() : controller.play();
              },
            ),
            IconButton(
              icon: const Icon(Icons.forward_10),
              onPressed: () {
                final totalMs = controller.value.duration.inMilliseconds;
                final maxMs = (widget.trimEnd * totalMs).toInt();
                final pos = controller.value.position + const Duration(seconds: 10);
                final clamped = pos.inMilliseconds > maxMs
                    ? Duration(milliseconds: maxMs)
                    : pos;
                controller.seekTo(clamped);
              },
            ),
          ],
        ),
      ],
    );
  }
}
