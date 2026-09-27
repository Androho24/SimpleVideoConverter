// Copyright 2013 The Flutter Authors
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package io.flutter.plugins.videoplayer.platformview;

import android.os.Handler;
import android.os.Looper;
import androidx.annotation.NonNull;
import androidx.annotation.OptIn;
import androidx.annotation.Nullable;
import androidx.media3.common.Format;
import androidx.media3.common.util.UnstableApi;
import androidx.media3.exoplayer.ExoPlayer;
import io.flutter.plugins.videoplayer.ExoPlayerEventListener;
import io.flutter.plugins.videoplayer.VideoPlayerCallbacks;

public final class PlatformViewExoPlayerEventListener extends ExoPlayerEventListener {
  // LOCAL PATCH (SimpleVideoConverter), see third_party/video_player_android/PATCHES.md:
  // upstream dereferenced exoPlayer.getVideoFormat() through Objects.requireNonNull, which
  // crashes the whole process whenever the player reaches STATE_READY before a video format
  // is available (no usable decoder for the track, or simply a slow start). Instead of
  // crashing we wait for the format to show up and only give up after a bounded timeout.
  private static final long VIDEO_FORMAT_TIMEOUT_MS = 2000;
  private static final long VIDEO_FORMAT_POLL_INTERVAL_MS = 50;

  private final Handler formatHandler = new Handler(Looper.getMainLooper());
  @Nullable private Runnable pendingFormatPoll;

  public PlatformViewExoPlayerEventListener(
      @NonNull ExoPlayer exoPlayer, @NonNull VideoPlayerCallbacks events) {
    super(exoPlayer, events);
  }

  @Override
  protected void sendInitialized() {
    // We can't rely on VideoSize here, because at this point it is not available - the platform
    // view was not created yet. We use the video format instead.
    if (getVideoFormat() != null) {
      sendInitializedFromFormat();
      return;
    }
    // The base class has already flipped its isInitialized flag, so it will not call us a
    // second time. Holding the event back here is safe, and it is the only option we have:
    // the Dart side throws a StateError on a second initialized event, so we cannot send a
    // placeholder now and correct the size later.
    awaitVideoFormat(VIDEO_FORMAT_TIMEOUT_MS);
  }

  /** Cancels a pending wait for the video format when the player is disposed. */
  @Override
  public void dispose() {
    super.dispose();
    if (pendingFormatPoll != null) {
      formatHandler.removeCallbacks(pendingFormatPoll);
      pendingFormatPoll = null;
    }
  }

  private void awaitVideoFormat(long remainingMs) {
    final Runnable poll =
        () -> {
          pendingFormatPoll = null;
          if (getVideoFormat() != null) {
            sendInitializedFromFormat();
          } else if (remainingMs > 0) {
            awaitVideoFormat(remainingMs - VIDEO_FORMAT_POLL_INTERVAL_MS);
          } else {
            // Nothing decodable in sight - report an empty size rather than never
            // completing initialization, which would hang the Dart side forever.
            events.onInitialized(0, 0, exoPlayer.getDuration(), 0);
          }
        };
    pendingFormatPoll = poll;
    formatHandler.postDelayed(poll, VIDEO_FORMAT_POLL_INTERVAL_MS);
  }

  @OptIn(markerClass = UnstableApi.class)
  @Nullable
  private Format getVideoFormat() {
    return exoPlayer.getVideoFormat();
  }

  @OptIn(markerClass = UnstableApi.class)
  private void sendInitializedFromFormat() {
    Format videoFormat = getVideoFormat();
    if (videoFormat == null) {
      return;
    }
    RotationDegrees rotationCorrection;
    try {
      rotationCorrection = RotationDegrees.fromDegrees(videoFormat.rotationDegrees);
    } catch (IllegalArgumentException e) {
      // Rotation correction other than 0, 90, 180, 270 reported by Format. Because this is
      // unexpected we apply no rotation correction.
      rotationCorrection = RotationDegrees.ROTATE_0;
    }
    int width = videoFormat.width;
    int height = videoFormat.height;

    // Switch the width/height if video was taken in portrait mode and a rotation
    // correction was detected.
    if (rotationCorrection == RotationDegrees.ROTATE_90
        || rotationCorrection == RotationDegrees.ROTATE_270) {
      width = videoFormat.height;
      height = videoFormat.width;

      rotationCorrection = RotationDegrees.ROTATE_0;
    }

    events.onInitialized(width, height, exoPlayer.getDuration(), rotationCorrection.getDegrees());
  }
}
