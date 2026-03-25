# Simple Video Converter

A Flutter app for Android that converts and trims videos using FFmpegKit with software encoding (libx264) for superior text and screen recording quality.

## Features

- Video selection from device storage
- Live preview with trim slider
- 8 quality presets (Original to 360p)
- Mute audio option
- Estimated file size display
- Share / save converted video

## Tech Stack

- **Framework**: Flutter (Dart)
- **Encoding**: [ffmpeg_kit_flutter_new](https://pub.dev/packages/ffmpeg_kit_flutter_new) — libx264 software encoder
- **Video Preview**: video_player
- **File Picker**: file_picker
- **Sharing**: share_plus

## License

GPL-3.0 — see [LICENSE](LICENSE).

This app uses FFmpegKit which includes x264 (GPL). As a result, this app is also GPL-licensed.

## Building

### Prerequisites

- Flutter SDK
- Android SDK (minSdk 24)

### Setup

1. Clone the repo:
   ```bash
   git clone https://github.com/YOUR_USERNAME/simple_video_converter.git
   cd simple_video_converter
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. For release builds — create `android/key.properties` from the template:
   ```bash
   cp android/key.properties android/key.properties
   # Edit android/key.properties with your signing credentials
   ```

4. Run:
   ```bash
   flutter run
   ```

## Note on Secrets

`android/key.properties`, `google-services.json` and signing keystores are excluded from the repository via `.gitignore`. These files contain credentials and must be set up locally.
