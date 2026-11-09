// Copyright (C) 2026 Androho Software info@androho.com
// SPDX-License-Identifier: GPL-3.0-or-later

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_video_converter/services/gallery_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('com.androho.simplevideoconverter/gallery');
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

  Future<void> fromAndroid(String method, [Object? arguments]) async {
    await messenger.handlePlatformMessage(
      channel.name,
      channel.codec.encodeMethodCall(MethodCall(method, arguments)),
      (_) {},
    );
  }

  tearDown(() {
    messenger.setMockMethodCallHandler(channel, null);
    GalleryService.listenForSharedVideos(null);
  });

  group('shared videos', () {
    test('reports whether a video is waiting', () async {
      messenger.setMockMethodCallHandler(
        channel,
        (call) async => call.method == 'hasSharedVideo',
      );
      expect(await GalleryService.hasSharedVideo(), isTrue);
    });

    test('counts a platform error as no video', () async {
      messenger.setMockMethodCallHandler(
        channel,
        (_) async => throw PlatformException(code: 'x'),
      );
      expect(await GalleryService.hasSharedVideo(), isFalse);
    });

    test('takes the video with its metadata and copy progress', () async {
      final progress = <double>[];
      messenger.setMockMethodCallHandler(channel, (call) async {
        expect(call.method, 'takeSharedVideo');
        await fromAndroid('pickProgress', 0.5);
        return {
          'source': '/cache/id/film.mp4',
          'displayName': 'film.mp4',
          'trashUri': null,
        };
      });

      final video = await GalleryService.takeSharedVideo(
        onCopyProgress: progress.add,
      );

      expect(video?.source, '/cache/id/film.mp4');
      expect(video?.displayName, 'film.mp4');
      expect(video?.trashUri, isNull);
      expect(progress, [0.5]);
    });

    test('returns null when nothing is waiting', () async {
      messenger.setMockMethodCallHandler(channel, (_) async => null);
      expect(await GalleryService.takeSharedVideo(), isNull);
    });

    test('hears about videos shared while the app runs', () async {
      var notified = 0;
      GalleryService.listenForSharedVideos(() => notified++);

      await fromAndroid('sharedVideoAvailable');

      expect(notified, 1);
    });

    test('keeps listening after a file was picked', () async {
      var notified = 0;
      GalleryService.listenForSharedVideos(() => notified++);
      messenger.setMockMethodCallHandler(channel, (_) async => null);

      await GalleryService.pickVideo();
      await fromAndroid('sharedVideoAvailable');

      expect(notified, 1);
    });

    test('stops reporting progress once the copy is done', () async {
      final progress = <double>[];
      messenger.setMockMethodCallHandler(channel, (_) async => null);

      await GalleryService.pickVideo(onCopyProgress: progress.add);
      await fromAndroid('pickProgress', 1.0);

      expect(progress, isEmpty);
    });
  });
}
