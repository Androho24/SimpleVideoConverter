// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get qualityLabel => '品質';

  @override
  String get quality2160pHigh => '2160p 高画質';

  @override
  String get quality2160pMedium => '2160p 中画質';

  @override
  String get quality2160pLow => '2160p 低画質';

  @override
  String get quality2160pVeryLow => '2160p 非常に低画質';

  @override
  String get quality1440pHigh => '1440p 高画質';

  @override
  String get quality1440pMedium => '1440p 中画質';

  @override
  String get quality1440pLow => '1440p 低画質';

  @override
  String get quality1440pVeryLow => '1440p 非常に低画質';

  @override
  String get quality1080pHigh => '1080p 高画質';

  @override
  String get quality1080pMedium => '1080p 中画質';

  @override
  String get quality1080pLow => '1080p 低画質';

  @override
  String get quality1080pVeryLow => '1080p 非常に低画質';

  @override
  String get quality720pHigh => '720p 高画質';

  @override
  String get quality720pMedium => '720p 中画質';

  @override
  String get quality720pLow => '720p 低画質';

  @override
  String get quality720pVeryLow => '720p 非常に低画質';

  @override
  String get quality480pHigh => '480p 高画質';

  @override
  String get quality480pMedium => '480p 中画質';

  @override
  String get quality480pLow => '480p 低画質';

  @override
  String get quality480pVeryLow => '480p 非常に低画質';

  @override
  String get quality360pHigh => '360p 高画質';

  @override
  String get quality360pMedium => '360p 中画質';

  @override
  String get quality360pLow => '360p 低画質';

  @override
  String get quality360pVeryLow => '360p 非常に低画質';

  @override
  String get mute => 'ミュート';

  @override
  String get ok => 'OK';

  @override
  String get selectVideo => '動画を選択する';

  @override
  String get videoLoading => '動画を読み込み中…';

  @override
  String get modeNormal => '通常';

  @override
  String get modeExpert => 'エキスパート';

  @override
  String get invalidVideoFile => '有効な動画ファイルを選択してください。';

  @override
  String get fileLoadError => 'ファイルを読み込めませんでした。動画ファイルを選択してください。';

  @override
  String get previewNotAvailable => 'プレビューは利用できません。ただし、動画は変換可能です。';

  @override
  String get previewNotAvailableLabel => 'プレビューは利用できません\n（このデバイスでは解像度が高すぎます）';

  @override
  String get noVideoLoaded => 'まず動画を読み込んでください。';

  @override
  String get cancelConversionTitle => '変換を中止しますか？';

  @override
  String get cancelConversionContent => 'これまでの処理内容は失われます。';

  @override
  String get continueConversion => '続行';

  @override
  String get cancel => 'キャンセル';

  @override
  String get discardVideoTitle => 'この動画を破棄しますか？';

  @override
  String get discardVideoContent => '変換された動画は削除され、保存されません。';

  @override
  String get keep => '残す';

  @override
  String get discard => '破棄する';

  @override
  String get save => '保存';

  @override
  String get saveVideoDialogTitle => '動画を保存する';

  @override
  String get savedSuccess => '保存しました！';

  @override
  String get open => '開く';

  @override
  String get openGallery => 'ギャラリーを開く';

  @override
  String get openVideo => '動画を開く';

  @override
  String get autoSaveTitle => '動画を自動的にギャラリーに保存する';

  @override
  String get autoSaveSubtitle => '動画は変換後に自動的に保存されます。';

  @override
  String get videoCodecTitle => '動画コーデック';

  @override
  String get videoCodecSubtitle => '通常モードの動画変換に使用するコーデック';

  @override
  String get videoCodecInfoTitle => 'H.264 と H.265/HEVC の違い';

  @override
  String get videoCodecInfoContent =>
      'H.264 は互換性が最も高く、通常はより速く変換できます。\n\nH.265/HEVC は同等の画質でファイルを小さくできますが、変換に時間がかかります。古い端末やアプリでは変換後の動画を再生できない場合があります。\n\nどちらのエンコーダーもアプリに含まれているため、端末にインストールされているコーデックには依存しません。';

  @override
  String get saveError => '保存中にエラーが発生しました。空き容量が不足している可能性があります。';

  @override
  String get saveErrorOutOfMemory =>
      '保存するのに十分なメモリがありません。より短いクリップか、画質を下げてみてください。';

  @override
  String get conversionDone => '完了！';

  @override
  String conversionProgress(String percent) {
    return '変換中: $percent%';
  }

  @override
  String conversionFailed(String error) {
    return '変換に失敗しました：$error';
  }

  @override
  String get settingsTitle => '設定';

  @override
  String get licensesTitle => 'ライセンス';

  @override
  String get licensesSubtitle => 'このアプリのオープンソースライセンス';

  @override
  String get gplLicenseTitle => 'GPL-3.0 ライセンス条文';

  @override
  String get sourceCodeTitle => 'ソースコード（GitHub）';

  @override
  String get privacyPolicyTitle => 'プライバシーポリシー';

  @override
  String get adConsentTitle => 'プライバシー設定';

  @override
  String get imprintTitle => 'サイト運営者情報';

  @override
  String get linkOpenError => 'リンクを開くことができませんでした。';

  @override
  String get muteTooltip => 'ミュート機能の解説';

  @override
  String get muteInfoContent =>
      '変換後の動画から音声を完全に削除します。\n\n例えば、バックグラウンドノイズを除去したり、ファイルサイズを縮小したりするのに便利です。';

  @override
  String estimatedSize(String size) {
    return '推定サイズ：${size}MB';
  }

  @override
  String get convertButton => '変換';

  @override
  String get crfLabel => '動画画質（CRF）';

  @override
  String get crfInfoTitle => 'CRF — 映像品質';

  @override
  String get crfInfoContent =>
      '0 → ロスレス（非常に大きなファイル）\n18 → 視覚的にはほぼロスレス\n23 → 標準（バランスが良い）\n28 → 画質の低下が目立つ\n51 → 最低品質\n\n推奨：18～28';

  @override
  String get crfInfoContentWideScale =>
      '0 → ロスレス（非常に大きなファイル）\n25 → 視覚的にはほぼロスレス\n30 → 標準（バランスが良い）\n38 → 画質の低下が目立つ\n63 → 最低品質\n\n推奨：25～38\n\nVP9とAV1は0～63のスケールを使用します。同じ数値でもH.264/H.265とは品質が異なります。';

  @override
  String get resolutionLabel => '解像度';

  @override
  String get resolutionInfoTitle => '一般的な解像度';

  @override
  String get resolutionInfoContent =>
      '3840 × 2160 — 4K UHD\n2560 × 1440 — 2K QHD\n1920 × 1080 — フルHD\n1280 ×  720 — HD\n 854 ×  480 — 480p\n 640 ×  360 — 360p\n 426 ×  240 — 240p\n\nヒント：一方の欄を空白にすると、もう一方の値が比例して計算されます。';

  @override
  String get widthLabel => '幅';

  @override
  String get heightLabel => '高さ';

  @override
  String get emptyEqualsOriginal => '空欄 = オリジナル';

  @override
  String get fpsLabel => 'FPS';

  @override
  String get fpsInfoTitle => '1秒あたりのフレーム数';

  @override
  String get fpsInfoContent =>
      'オリジナル  → ソース動画のFPSを維持\n24    → 映画用標準\n25    → PAL/テレビ用標準（ヨーロッパ）\n30    → NTSC/テレビ、ソーシャルメディア\n60    → 滑らかな映像、ゲーム、スポーツ';

  @override
  String get audioBitrateLabel => 'オーディオのビットレート';

  @override
  String get silent => '無音';

  @override
  String get audioBitrateInfoContent =>
      '無音    → 音声なし\n64 kbps  → 音声、ポッドキャスト\n96 kbps  → 良好な音声品質\n128 kbps → 標準的な音楽\n192 kbps → 高音質\n320 kbps → MP3の最高音質';

  @override
  String get audioCodecLabel => 'オーディオコーデック';

  @override
  String get expertVideoCodecInfoContent =>
      'H.264 → 互換性が最も高く、通常は高速\nH.265 → 同等品質でファイルが小さいが低速\nVP9 → WebMとMKV向けの高効率なオープンコーデック。ソフトウェアエンコードは低速\nAV1 → 圧縮率は最高、ソフトウェアエンコードのみ、実験的\nXvid → AVIや古いプレーヤー向けの旧式MPEG-4コーデック\n\n利用できる出力形式は、選択した映像・音声コーデックに応じて変わります。';

  @override
  String get xvidLegacyLabel => 'Xvid（レガシー）';

  @override
  String get av1SlowHint => 'AV1はソフトウェアのみでエンコードされ、H.264/H.265より大幅に低速です。';

  @override
  String get av1HighResHint => '720pを超える場合は、先に解像度を下げることをおすすめします。';

  @override
  String get av1ExperimentalTitle => 'AV1（実験的）';

  @override
  String get av1ExperimentalSubtitle =>
      '通常モードとエキスパートモードのコーデック選択にAV1を追加します。圧縮効率の高い最新コーデックですが、検証はまだ十分ではありません。';

  @override
  String get audioCodecInfoContent =>
      'AAC → MP4の標準、最高の互換性\nMP3 → 広く使われる旧式コーデック\nOpus → 最新で高効率、WebMとMKVに最適\nAC3 → Dolby Digital、サラウンド音源（3チャンネル以上）のみ\nVorbis → WebMとMKV向けのオープンコーデック\n\n互換性のない出力形式は自動的に無効になります。';

  @override
  String get outputFormatLabel => '出力形式';

  @override
  String get outputFormatInfoContent =>
      'MP4 → 汎用、最高の互換性\nMKV → 提供する全コーデックに対応する柔軟なコンテナ\nMOV → Apple/QuickTimeワークフロー\nAVI → Xvidを使うレガシー形式\nMPEG-TS → テレビ・配信用トランスポートストリーム\nWebM → VP9とOpusまたはVorbisを使う最新Web形式\n\n互換性のない形式は薄く表示されます。選択すると、既定の映像コーデックと、必要に応じて対応する音声コーデックが自動的に設定されます。';

  @override
  String compatibleFormatsHint(
    String videoCodec,
    String audioCodec,
    String formats,
  ) {
    return '$videoCodec + $audioCodec の対応形式: $formats';
  }

  @override
  String outputFormatAdjusted(String format) {
    return '出力形式を$formatに変更しました。';
  }

  @override
  String get orig => 'オリジナル';

  @override
  String get resolutionExplainTitle => '解像度にはどのような意味があるのでしょうか？';

  @override
  String get resolutionExplainContent =>
      '360p  (640×360)   → ファイルサイズが非常に小さい、\n（例：WhatsApp用） \n \n 480p  (854×480)   → 標準画質（SD）\n \n 720p  (1280×720)  → HD、モバイル端末に適しています \n \n 1080p (1920×1080) → フルHD、\n                          YouTubeやテレビの標準画質 \n \n 「高」「中」「低」は、同じ解像度における画質レベルを表します。数値が高いほどファイルサイズが大きくなります。';

  @override
  String get resolutionTooltip => '解像度の解説';

  @override
  String get trimArea => 'トリム範囲';

  @override
  String trimStartLabel(String time) {
    return '冒頭：$time';
  }

  @override
  String trimEndLabel(String time) {
    return '終わり：$time';
  }

  @override
  String get adLoading => '広告を読み込んでいます…';

  @override
  String get convertedPrefix => '変換済み_';

  @override
  String get removeAdsTitle => '広告を非表示にする';

  @override
  String removeAdsSubtitle(String price) {
    return '1回限りの購入 – $price';
  }

  @override
  String get removeAdsActiveTitle => '広告なし ✓';

  @override
  String get removeAdsActiveSubtitle => 'ご支援ありがとうございます！';

  @override
  String get restorePurchasesTitle => '購入を復元する';

  @override
  String get purchaseButton => '購入する';

  @override
  String get purchaseError => '購入に失敗しました。もう一度お試しください。';

  @override
  String get purchaseSuccess => 'ありがとうございます！広告は非表示になりました。';

  @override
  String get appName => '動画コンバーター';

  @override
  String get audioOnly => '音声のみ';

  @override
  String get audioOnlyTooltip => '音声のみの解説';

  @override
  String get audioOnlyInfoContent =>
      '動画から音声トラックのみを抽出します（映像は含まれません）。\n\n通常モード：192 kbpsのMP3。\nエキスパートモード：オーディオ設定からコーデックとビットレートを指定。\n\n例えば、動画から音楽やポッドキャストを保存するのに便利です。';

  @override
  String get aspectLocked => 'アスペクト比がロックされています';

  @override
  String get aspectUnlocked => 'アスペクト比のロック解除';

  @override
  String get cpuWarningTitle => '大規模なファイル';

  @override
  String get cpuWarningContent =>
      'この動画は5分以上あります。古い端末では、変換中にプロセッサの使用率が上昇することがありますが、これは正常な現象です。\n \n スマートフォンを横に置いておけば、アプリはバックグラウンドで動作し続けます。';

  @override
  String get cpuWarningCheckbox => '表示しない';

  @override
  String get storageWarningTitle => 'ストレージ容量が不足しています';

  @override
  String storageWarningContent(String available, String required) {
    return 'お使いのデバイスには、${available}MBの空き容量しかありません。変換には約${required}MBの容量が必要です。まず、空き容量を確保してください。';
  }

  @override
  String get feedbackTitle => 'ご意見・サポート';

  @override
  String get feedbackSubtitle => 'バグ、改善点、またはフィードバックを送信する';

  @override
  String get feedbackCategoryLabel => 'カテゴリー';

  @override
  String get feedbackCategoryBug => 'バグを報告する';

  @override
  String get feedbackCategoryFeature => '改善案';

  @override
  String get feedbackCategoryFeedback => '一般的なフィードバック';

  @override
  String get feedbackMessageHint => 'ご用件についてご説明ください…';

  @override
  String get feedbackSendButton => '送信';

  @override
  String get notificationPermissionTitle => 'バックグラウンド変換';

  @override
  String get notificationPermissionContent =>
      '他のアプリを使用している間も変換が継続されるよう、通知を許可してください。この権限がない場合、アプリを開いたままにしておく必要があります。';

  @override
  String get notificationPermissionNotNow => '今はしない';

  @override
  String get notificationPermissionAllow => '許可する';

  @override
  String get notificationPermissionDenied => 'バックグラウンド変換を行うには、設定で通知を有効にしてください。';

  @override
  String get notificationPermissionOpenSettings => '設定';

  @override
  String get backButton => '戻る';

  @override
  String get appSettingsTitle => 'アプリの設定';

  @override
  String get appSettingsSubtitle => '自動保存とプライバシー';

  @override
  String get openSourceTitle => 'オープンソース';

  @override
  String get openSourceSubtitle => 'ライセンスとソースコード';

  @override
  String get openSourceLicensesTitle => 'オープンソースライセンス';

  @override
  String get legalSectionTitle => '法的情報';

  @override
  String get proSectionTitle => 'Pro';

  @override
  String get encodingModeLabel => 'エンコーディングモード';

  @override
  String get encodingModeCrf => '品質（CRF）';

  @override
  String get encodingModeBitrate => 'ビットレート';

  @override
  String get audioChannelsLabel => 'オーディオチャンネル';

  @override
  String get audioChannelsInfoContent =>
      'オリジナル → ソースのチャンネル構成を維持 \n ステレオ → 2.0（必要に応じてダウンミックス）\n モノラル → 1チャンネル (最小ファイルサイズ)\n 5.1 → 6チャンネルサラウンド (サラウンド音源の場合のみ)\n \n ダウンミックス (例: 5.1 → ステレオ) はサポートされています。アップミックスは提供されていません。';

  @override
  String get audioChannelOriginal => 'オリジナル';

  @override
  String get targetBitrateLabel => '目標ビットレート';

  @override
  String get targetBitrateInfoTitle => '目標ビットレート';

  @override
  String get targetBitrateInfoContent =>
      '500 kbps–2 Mbps → 高圧縮、メッセージ送信向け\n4–8 Mbps → 1080pで標準～良好な画質\n12 Mbps → 1080pで高画質 / 4Kで低画質\n20 Mbps → 4Kストリーミング品質\n\n任意の値：鉛筆アイコンから（500〜100000 kbps）\n\nCRFとは異なり、画質はシーンによって変動する可能性があります。同じファイルサイズでより良い結果を得るには、CRFを使用してください。';

  @override
  String get targetBitrateWideScaleHint =>
      'VP9とAV1は、これらの約半分のビットレートで同等の画質になります。';

  @override
  String get rateAppTitle => 'アプリを評価する';

  @override
  String get proHintTitle => '広告なしで利用する';

  @override
  String get proHintBody => '一度の購入で広告を永久に削除できます。ご支援ありがとうございます。';

  @override
  String get proHintLater => '後で';

  @override
  String get restoreError =>
      '購入履歴を復元できませんでした。現在、Playストアに接続できません。しばらくしてからもう一度お試しください。';

  @override
  String get restoreNoPurchases => '過去の購入履歴は見つかりませんでした。';

  @override
  String get hdrCodecSwitched => 'HDR動画を検出しました。色を維持するため、この動画ではH.265を使用します。';

  @override
  String get themeTitle => '外観';

  @override
  String get themeSubtitle => 'システム設定、ライト、ダークから選択';

  @override
  String get themeSystem => 'システム';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get targetBitrateEditTooltip => 'ビットレートを入力';

  @override
  String targetBitrateRangeHint(String range) {
    return '入力可能な範囲：$range';
  }
}
