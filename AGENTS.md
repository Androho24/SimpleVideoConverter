# Repository Guidelines

Guidance for coding agents working in this repository (Claude Code reads this via CLAUDE.md, Codex reads it directly).

## Project

A Flutter video converter and trimmer for Android, built on FFmpegKit with software encoding (libx264/libx265) for good text and screen-recording quality. GPL-3.0, because FFmpegKit bundles x264. minSdk 24.

`lib/` holds the app: `screens/` assemble user flows, `widgets/` hold reusable UI, `models/` hold conversion settings and metadata, `services/` wrap FFmpeg, storage, purchases, ads, and platform channels. Localization sources are `lib/l10n/app_*.arb`; the adjacent `app_localizations*.dart` files are generated. Android Kotlin, manifests, and resources are under `android/app/src/`. `ios/` is the Flutter runner scaffold. Tests live in `test/`, assets in `assets/` and must be declared in `pubspec.yaml`.

## Environment: run Flutter through Windows, not WSL

The repo lives on a Windows drive and is built by Android Studio on Windows. The Flutter SDK at `C:\Users\matth\flutter\flutter` has CRLF line endings, so invoking `flutter` from WSL fails immediately with `bin/internal/shared.sh: line 5: $'\r': command not found`.

Use `cmd.exe` with Windows paths, and run it in the background — a full analyze or test takes ~170 s, most of which is dependency resolution:

```bash
cmd.exe /c "C:\Users\matth\flutter\flutter\bin\flutter.bat analyze lib test"
cmd.exe /c "C:\Users\matth\flutter\flutter\bin\flutter.bat test"
cmd.exe /c "C:\Users\matth\flutter\flutter\bin\flutter.bat test test\video_scale_service_test.dart"
cmd.exe /c "C:\Users\matth\flutter\flutter\bin\flutter.bat test --plain-name 'name of a single test'"
cmd.exe /c "C:\Users\matth\flutter\flutter\bin\flutter.bat gen-l10n"
cmd.exe /c "C:\Users\matth\flutter\flutter\bin\dart.bat format lib test"
```

The remaining commands follow the same pattern: `pub get` installs dependencies, `run` launches on a connected device, `build apk --debug` produces an installable development APK. `dart format --output=none --set-exit-if-changed lib test` checks formatting without rewriting.

`flutter analyze` and `flutter test` are expected to pass before handing work back. Release builds additionally need the local signing and service configuration that `.gitignore` excludes.

### Verifying FFmpeg behavior locally

A Windows FFmpeg 8 build sits at `C:\ffmpeg\bin\ffmpeg.exe` / `ffprobe.exe`. It is the fastest way to check that a filter chain or encoder argument set actually does what you think before shipping it into the app. It only accepts Windows paths (`C:\...`), not `/mnt/c/...`, and shell `eval` will eat the backslashes — pass paths as single-quoted literals.

Sample recordings used for past investigations sit in the repo root (screen recordings with variable frame rate, and `PXL_20260806_071353486.mp4` which is HLG HDR). They are untracked working files, not fixtures.

Note that the Android FFmpeg build does not always behave like the desktop one — `zscale`/zimg in particular rejected input parameters on Android that x86 inferred fine. Local success is evidence, not proof.

## Architecture

### The conversion pipeline

The whole flow is two screens plus a set of argument-building services:

1. **`lib/screens/converter_screen.dart`** — picks a video, probes it with `FFprobeKit.getMediaInformation`, and reduces the result to a `VideoMetadata` (duration, display-oriented square-pixel dimensions, audio channels, HDR transfer). It then builds the **entire FFmpeg command as a single string** in `_convertVideo` and pushes `ConversionScreen`.
2. **`lib/screens/conversion_screen.dart`** — runs that string with `FFmpegKit.executeAsync`, drives the progress UI from `FFmpegKitConfig.enableStatisticsCallback`, and handles save/share/discard.

The command string is parsed by FFmpegKit's own argument parser, not a shell. Filter graphs are therefore emitted as one quoted argument containing no spaces (`-vf "scale=…,zscale=…"`). `test/video_scale_service_test.dart` guards this by round-tripping through `FFmpegKitConfig.parseArguments` — keep that guarantee when touching filter construction.

`_convertVideo` has four branches that must stay in sync when adding a video option: expert audio-only, expert video, normal audio-only, normal video.

### Normal mode vs expert mode

Normal mode uses quality presets plus an app-wide codec preference from `PreferencesService`. Expert mode uses `ExpertSettings` (own codec, container, bitrate mode, CRF, fps, audio settings) and deliberately ignores the app-wide preference — a change to the setting must not leak into an expert conversion.

### Services that own FFmpeg arguments

Argument construction lives in services, not in the screen, and is unit-tested there:

- **`video_scale_service.dart`** — the video filter graph. Builds the scale expression (short side fixed, long side derived, `reset_sar=1`, never upscaling), detects HDR from `color_transfer`, and produces the HDR→SDR tone-mapping chain.
- **`ffmpeg_codec_options.dart`** — encoder names, quality arguments per codec scale, `-tag:v` for MP4-family containers, and HDR passthrough arguments.
- **`media_format_compatibility.dart`** — which video/audio codecs a container accepts. The source of truth for expert-mode combinations.
- **`video_quality_scale.dart`** — CRF translation between the 0–51 and 0–63 scales, since presets are calibrated for x264.
- **`output_size_estimator.dart`** — predicted output size shown before converting.

### HDR handling

HDR is detected from `color_transfer` being `arib-std-b67` (HLG) or `smpte2084` (PQ), and drives two mutually exclusive paths:

- Codec can carry HDR (H.265, AV1) → keep it: `-pix_fmt yuv420p10le` plus BT.2020 color tags, **no** tone mapping. The generic `-color_*` options are enough; no `-x265-params` needed. Watch out for encoder argument sets that hardcode BT.709 tags — they would overwrite the HDR ones.
- Codec cannot (H.264) → tone map to SDR through the `zscale`/`tonemap` chain. The chain declares its input side explicitly (`tin`/`min`/`pin`/`rin`) because Android's zimg fails with `generic error in an external library` when made to infer it.

In normal mode an HDR source silently upgrades the codec to H.265 for that job only and tells the user via a SnackBar. It must never write the preference back. Expert mode does not auto-switch.

### Progress reporting

`stats.getTime()` from the statistics callback is not always valid — FFmpeg reports `time=N/A` intermittently, more often with several output streams, and the plugin converts the native double with `.toInt()`. Progress must ignore non-positive values and never move backwards. Speed and output size from the same reports stay usable.

### Android platform side

`MainActivity.kt` wires three method channels: `…/conversion_service` (foreground service for the progress notification, implemented in `ConversionService.kt`), an ads channel, and a gallery channel. The Dart side of the service lives in `conversion_service_manager.dart`, which throttles progress updates to one per second. The Flutter engine is cached and deliberately outlives the activity.

### Video preview

The preview uses `VideoViewType.platformView` (SurfaceView) on Android. The default `textureView` routes every frame through Flutter's raster pipeline and cannot sustain 1080p60, which caused dropped frames and audio drift on screen recordings. `video_player_android`'s README discourages `platformView` because of a general platform-view issue (flutter/flutter#164899) — it works here, but changes around the preview should be checked against scrolling, seeking, dialogs over the video, and repeated video loads. iOS stays on `textureView`.

## Conventions

- Standard Dart formatting (two-space indent), `snake_case.dart` files, `UpperCamelCase` types, `lowerCamelCase` members. Kotlin uses four-space indent and existing Android naming.
- Code identifiers and test names are English; explanatory comments are German. Comments explain *why* — several encode measured findings and rejected alternatives, so prefer extending them over replacing them.
- Keep widgets small; platform and persistence logic belongs in services, not UI classes.
- User-visible text goes into `lib/l10n/app_en.arb` (the template, with `@`-descriptions) **and all 17 locale ARBs**, then `flutter gen-l10n`. Never hand-edit `app_localizations*.dart`.
- Keep the GPL SPDX header on files that already carry it.

## Testing

`flutter_test`, files named `*_test.dart`, grouped by feature or class. Unit tests for models and service-independent logic, widget tests for changed interactions. No coverage threshold is configured, but new behavior should come with regression coverage where practical — the argument-building services are pure functions and cheap to cover, which is why the FFmpeg logic lives there rather than in the screens.

## Session reports & memory (mandatory workflow)

Every working session gets a report in `session-reports/session_report_YYYY_MM_DD_thema.md`. Template and section list: `session-reports/session_report_TEMPLATE.md` (Zusammenfassung / Erledigte Features-Aufgaben / Bearbeitete Dateien / Wichtige Learnings / Offene TODOs, in German).

- **Create the file as soon as the task is clear** — not at the end. Fill in "Zusammenfassung" and the first checklist items with what is already known.
- **Update it continuously**: after every completed sub-area, append the finished item / edited file and save. The report must survive a laptop crash mid-session, so at most one sub-step may ever be missing. Never buffer the whole report to the end of the session.
- "Wichtige Learnings" and "Offene TODOs" are filled in at the end (or as soon as a learning is confirmed).
- "Offene TODOs" must explicitly separate what is *verified* from what only compiles — and name external prerequisites that block verification (e.g. no device test possible, a filter only checked against desktop FFmpeg, a release-build behavior unverified).
- Skip the report only for pure questions with no code change. A session that starts as a question and turns into changes still gets one.
- Keep it recovery-focused rather than a transcript, and leave out secrets, credentials, local keys, production identifiers, and transient user data. Existing reports carry measurement tables and rejected approaches; that level of detail is the point, since it stops the next session from re-testing dead ends.

Memory (`~/.claude/projects/-mnt-c-Users-matth-AndroidStudioProjects-SimpleVideoConverter/memory/`) is updated in the same session, without asking. This project stores one fact per file with frontmatter plus a one-line pointer in `MEMORY.md` — follow that layout rather than a single running context file, and link related memories with `[[slug]]`.

- Add or update a memory whenever the project state moved in a way the next session would otherwise have to rediscover, and point it at the session report.
- No memory for fixes that are recoverable from code + git history anyway (a null check, a renamed field, a layout tweak). Memory is for **non-derivable** insights: build-environment quirks, platform/OEM behaviour, differences between the desktop and Android FFmpeg builds, immutable API constraints, plugin bugs and their workarounds, regressions caused by an earlier documented fix — plus anything else that would *prevent* a mistake the next time someone touches that code.
- If an existing memory covers the area, extend that file instead of creating a duplicate; a regression caveat belongs in the memory of the fix that caused it.

## Push back before implementing

Judge each request on its merits — do not assume it has already been thought through, and do not manufacture objections either. When something genuinely does not add up, Matthias wants to hear it rather than a polite yes, and **before** the code is written, because afterwards it is wasted work. Silence counts as agreement here, so an unspoken doubt is a failure. Raise it when a request would:

- conflict with the architecture: FFmpeg arguments belong in the pure, unit-tested services (`video_scale_service`, `ffmpeg_codec_options`, `media_format_compatibility`, `video_quality_scale`), not inline in a screen; the command is one string parsed by FFmpegKit's own parser, so a filter graph must stay a single space-free quoted argument; expert mode's `ExpertSettings` is authoritative and the app-wide codec preference must not leak into it; the HDR codec upgrade applies to one job and must never write back to `PreferencesService`;
- reintroduce something that already burned us in this codebase — this is the actual history, do not wave it through:
  - Android's zimg rejects an inferred input side (`generic error in an external library / Failed to inject frame into filter network`); the tone-mapping chain must keep `tin`/`min`/`pin`/`rin` explicit, and it cannot be validated on desktop FFmpeg alone,
  - `videoEncoderArguments` hardcodes BT.709 tags for VP9/AV1 and will silently overwrite HDR color tags,
  - `stats.getTime()` can be invalid (`time=N/A`, converted with `.toInt()` by the plugin); progress must ignore non-positive values and never move backwards,
  - the AV1 realtime settings are load-bearing: FFmpeg's wrapper caps `cpu-used` at 8 and libaom rejects any `lag-in-frames` between 0 and `max-gf-interval + 2`. The long comments there record measurements — extend them, do not tidy them away,
  - the preview runs on `VideoViewType.platformView` against upstream advice; anything touching the preview needs re-checking for scrolling, seeking, dialogs over the video, and repeated loads,
  - R8 has stripped FFmpegKit in release builds before (white screen, `channel-error`). A working debug build is not evidence about release;
- risk a release requirement: UMP consent (`ConsentHelper`, `ConsentModeHelper`), foreground-service type and `POST_NOTIFICATIONS` for the conversion notification, real ad units leaking into debug builds, missing strings in any of the 17 locales, Play Billing acknowledgement;
- add a second source of truth for Pro entitlement — it is the persisted `PreferencesService.getIsPro()` with `PurchaseService.isProStream` for live updates;
- change the licensing position: the app is GPL-3.0 *because* it bundles FFmpegKit full-gpl with x264. Swapping the package variant or adding an incompatible dependency is a licensing decision, not a build tweak;
- only fix a symptom while the actual cause stays in place;
- contradict something we established earlier in the same session.

How: state the concern in one or two sentences, give **one** clear recommendation, then follow Matthias's decision. If he sticks with his approach, implement it — mention the risk once, do not relitigate. Do not invent objections for trivial requests, and do not open every task with a caveat — agreement is fine when the request is sound, and "gute Idee, mache ich" is a real answer.

Also flag it when a fix you just made is *not* verified (not built, not device-tested, no unit test, or only checked against desktop FFmpeg) instead of letting it read as done.

## Commits and pull requests

History favors short summaries such as `Bug fixes`. Improve on that with a concise imperative subject (`Fix trim range validation`) and keep unrelated changes separate. Pull requests explain user-visible impact, testing performed, and Android/API implications; link issues and include screenshots or recordings for UI changes. Never commit `android/local.properties`, signing keys, `google-services.json`, Firebase options, or ad configuration files.
