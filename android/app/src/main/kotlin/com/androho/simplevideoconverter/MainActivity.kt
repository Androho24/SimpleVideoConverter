package com.androho.simplevideoconverter

import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.TextView
import com.google.android.gms.ads.nativead.MediaView
import com.google.android.gms.ads.nativead.NativeAd
import com.google.android.gms.ads.nativead.NativeAdView
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        // Plugins explizit registrieren bevor registerNativeAdFactory aufgerufen wird.
        // super.configureFlutterEngine registriert auf manchen Geräten zu spät.
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine,
            "nativeAd",
            NativeAdFactoryImpl(layoutInflater)
        )
    }

    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "nativeAd")
        super.cleanUpFlutterEngine(flutterEngine)
    }
}

class NativeAdFactoryImpl(
    private val layoutInflater: LayoutInflater
) : GoogleMobileAdsPlugin.NativeAdFactory {

    override fun createNativeAd(
        nativeAd: NativeAd,
        customOptions: MutableMap<String, Any>?
    ): NativeAdView {
        val adView = layoutInflater.inflate(R.layout.native_ad, null) as NativeAdView

        adView.mediaView        = adView.findViewById<MediaView>(R.id.ad_media)
        adView.headlineView     = adView.findViewById<TextView>(R.id.ad_headline)
        adView.advertiserView   = adView.findViewById<TextView>(R.id.ad_advertiser)
        adView.callToActionView = adView.findViewById<Button>(R.id.ad_call_to_action)

        (adView.headlineView     as TextView).text = nativeAd.headline
        (adView.callToActionView as Button).text   = nativeAd.callToAction
        adView.mediaView?.mediaContent             = nativeAd.mediaContent

        val advertiser = nativeAd.advertiser
        (adView.advertiserView as TextView).text = advertiser ?: ""
        adView.advertiserView?.visibility =
            if (advertiser != null) View.VISIBLE else View.INVISIBLE

        adView.setNativeAd(nativeAd)
        return adView
    }
}
