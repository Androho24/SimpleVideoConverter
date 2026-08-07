// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

class MediaContainerOption {
  final String id;
  final String label;
  final Set<String> videoCodecs;
  final Set<String> audioCodecs;

  const MediaContainerOption({
    required this.id,
    required this.label,
    required this.videoCodecs,
    required this.audioCodecs,
  });
}

class MediaFormatCompatibility {
  const MediaFormatCompatibility._();

  static const videoCodecH264 = 'h264';
  static const videoCodecH265 = 'h265';
  static const videoCodecVp9 = 'vp9';
  static const videoCodecAv1 = 'av1';
  static const videoCodecXvid = 'xvid';

  static const audioCodecAac = 'aac';
  static const audioCodecMp3 = 'mp3';
  static const audioCodecOpus = 'opus';
  static const audioCodecAc3 = 'ac3';
  static const audioCodecVorbis = 'vorbis';

  static const containers = <MediaContainerOption>[
    MediaContainerOption(
      id: 'mp4',
      label: 'MP4',
      videoCodecs: {videoCodecH264, videoCodecH265, videoCodecAv1},
      audioCodecs: {audioCodecAac, audioCodecAc3},
    ),
    MediaContainerOption(
      id: 'mkv',
      label: 'MKV',
      videoCodecs: {
        videoCodecH264,
        videoCodecH265,
        videoCodecVp9,
        videoCodecAv1,
        videoCodecXvid,
      },
      audioCodecs: {
        audioCodecAac,
        audioCodecMp3,
        audioCodecOpus,
        audioCodecAc3,
        audioCodecVorbis,
      },
    ),
    MediaContainerOption(
      id: 'mov',
      label: 'MOV',
      videoCodecs: {videoCodecH264, videoCodecH265},
      audioCodecs: {audioCodecAac, audioCodecAc3},
    ),
    MediaContainerOption(
      id: 'avi',
      label: 'AVI',
      videoCodecs: {videoCodecXvid},
      audioCodecs: {audioCodecMp3, audioCodecAc3},
    ),
    MediaContainerOption(
      id: 'ts',
      label: 'MPEG-TS',
      videoCodecs: {videoCodecH264, videoCodecH265},
      audioCodecs: {audioCodecAac, audioCodecAc3},
    ),
    MediaContainerOption(
      id: 'webm',
      label: 'WebM',
      videoCodecs: {videoCodecVp9, videoCodecAv1},
      audioCodecs: {audioCodecOpus, audioCodecVorbis},
    ),
  ];

  static bool supports({
    required String container,
    required String videoCodec,
    required String audioCodec,
  }) {
    final option = optionFor(container);
    return option != null &&
        option.videoCodecs.contains(videoCodec) &&
        option.audioCodecs.contains(audioCodec);
  }

  static List<MediaContainerOption> compatibleContainers({
    required String videoCodec,
    required String audioCodec,
  }) => containers
      .where(
        (option) =>
            option.videoCodecs.contains(videoCodec) &&
            option.audioCodecs.contains(audioCodec),
      )
      .toList(growable: false);

  static String preferredContainer({
    required String videoCodec,
    required String audioCodec,
    String? currentContainer,
  }) {
    if (currentContainer != null &&
        supports(
          container: currentContainer,
          videoCodec: videoCodec,
          audioCodec: audioCodec,
        )) {
      return currentContainer;
    }

    final compatible = compatibleContainers(
      videoCodec: videoCodec,
      audioCodec: audioCodec,
    );
    if (compatible.isEmpty) return 'mkv';

    final preferredId = switch (videoCodec) {
      videoCodecVp9
          when audioCodec == audioCodecOpus || audioCodec == audioCodecVorbis =>
        'webm',
      videoCodecAv1
          when audioCodec == audioCodecOpus || audioCodec == audioCodecVorbis =>
        'webm',
      videoCodecAv1
          when audioCodec == audioCodecAac || audioCodec == audioCodecAc3 =>
        'mp4',
      videoCodecXvid
          when audioCodec == audioCodecMp3 || audioCodec == audioCodecAc3 =>
        'avi',
      videoCodecH264
          when audioCodec == audioCodecAac || audioCodec == audioCodecAc3 =>
        'mp4',
      videoCodecH265
          when audioCodec == audioCodecAac || audioCodec == audioCodecAc3 =>
        'mp4',
      _ => 'mkv',
    };
    return compatible.any((option) => option.id == preferredId)
        ? preferredId
        : compatible.first.id;
  }

  static String defaultVideoCodecFor(String container) => switch (container) {
    'avi' => videoCodecXvid,
    'webm' => videoCodecVp9,
    _ => videoCodecH264,
  };

  static String defaultAudioCodecFor(String container) => switch (container) {
    'avi' => audioCodecMp3,
    'webm' => audioCodecOpus,
    _ => audioCodecAac,
  };

  static MediaContainerOption? optionFor(String id) {
    for (final option in containers) {
      if (option.id == id) return option;
    }
    return null;
  }

  static String labelFor(String id) => optionFor(id)?.label ?? id.toUpperCase();
}
