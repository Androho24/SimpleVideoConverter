package com.androho.simplevideoconverter.ads

import android.content.Context
import android.util.Log
import com.google.android.ump.ConsentInformation
import com.google.android.ump.UserMessagingPlatform
import com.google.firebase.analytics.FirebaseAnalytics
import com.google.firebase.crashlytics.FirebaseCrashlytics

/**
 * Koppelt Firebase Analytics & Crashlytics an den UMP-Consent.
 *
 * Ableitung der vier Google-Consent-Mode-Signale aus den IAB-TCF-Daten, die das
 * UMP-SDK in den Default-SharedPreferences ablegt (`IABTCF_*`). Mapping nach Googles
 * Schema:
 *   analytics_storage  = Purpose 1
 *   ad_storage         = Purpose 1
 *   ad_user_data       = Purpose 1 & Purpose 7 & Google-Vendor (755)
 *   ad_personalization = Purpose 3 & Purpose 4
 *
 * Gilt GDPR nicht (consentStatus NOT_REQUIRED bzw. IABTCF_gdprApplies=0), werden alle
 * vier Signale auf `granted` gesetzt.
 *
 * Collection-Gate: Analytics- **und** Crashlytics-Collection werden nur aktiviert, wenn
 * `analytics_storage` granted ist (Nutzer hat zugestimmt) oder GDPR nicht gilt.
 * Ohne Zustimmung bleibt beides hart aus (keine Pings).
 *
 * Fehler-Strategie: Bei jedem Fehler wird konservativ nichts aktiviert; die Methode
 * wirft nie.
 */
object ConsentModeHelper {

    private const val TAG = "ConsentModeHelper"

    // IAB-TCF v2 Keys in den Default-SharedPreferences
    private const val KEY_GDPR_APPLIES = "IABTCF_gdprApplies"
    private const val KEY_PURPOSE_CONSENTS = "IABTCF_PurposeConsents"
    private const val KEY_VENDOR_CONSENTS = "IABTCF_VendorConsents"

    // Google als IAB-Vendor
    private const val GOOGLE_VENDOR_ID = 755

    /**
     * Die Default-SharedPreferences, in die das UMP-SDK die IAB-TCF-Daten schreibt
     * (IAB-Spec: `<packageName>_preferences`). Bewusst ohne die deprecated
     * `PreferenceManager.getDefaultSharedPreferences`.
     */
    private fun tcfPrefs(context: Context) =
        context.getSharedPreferences("${context.packageName}_preferences", Context.MODE_PRIVATE)

    /** Berechnete Consent-Mode-Signale plus abgeleiteter Collection-Schalter. */
    private data class Signals(
        val analyticsStorage: Boolean,
        val adStorage: Boolean,
        val adUserData: Boolean,
        val adPersonalization: Boolean,
    ) {
        /** Collection nur bei erteilter analytics_storage-Zustimmung. */
        val collectionEnabled: Boolean get() = analyticsStorage
    }

    /**
     * Liest den aktuellen Consent aus, setzt die vier Consent-Mode-Signale und
     * schaltet Analytics-/Crashlytics-Collection entsprechend ein oder aus.
     *
     * Idempotent — kann bei jedem App-Start und nach jeder Consent-Änderung
     * (Formular, Privacy-Options) aufgerufen werden.
     */
    fun apply(context: Context) {
        try {
            val signals = computeSignals(context)
            Log.d(
                TAG,
                "Consent-Signale: analytics=${signals.analyticsStorage} " +
                    "adStorage=${signals.adStorage} adUserData=${signals.adUserData} " +
                    "adPersonalization=${signals.adPersonalization} " +
                    "→ collection=${signals.collectionEnabled}"
            )
            applyToFirebase(context, signals)
        } catch (e: Exception) {
            Log.e(TAG, "apply() fehlgeschlagen – Collection bleibt aus", e)
        }
    }

    private fun computeSignals(context: Context): Signals {
        // Kein Dialog-Land (GDPR gilt nicht) → volle Zustimmung.
        if (!gdprApplies(context)) {
            Log.d(TAG, "GDPR gilt nicht → alle Signale granted")
            return Signals(true, true, true, true)
        }

        val prefs = tcfPrefs(context)
        val purposes = prefs.getString(KEY_PURPOSE_CONSENTS, null)
        val vendors = prefs.getString(KEY_VENDOR_CONSENTS, null)

        val p1 = hasBit(purposes, 1)
        val p3 = hasBit(purposes, 3)
        val p4 = hasBit(purposes, 4)
        val p7 = hasBit(purposes, 7)
        val google = hasBit(vendors, GOOGLE_VENDOR_ID)

        return Signals(
            analyticsStorage = p1,
            adStorage = p1,
            adUserData = p1 && p7 && google,
            adPersonalization = p3 && p4,
        )
    }

    /**
     * Ob GDPR gilt. Kombiniert UMP-consentStatus (NOT_REQUIRED = kein Dialog-Land)
     * mit dem TCF-Flag `IABTCF_gdprApplies`. Solange der Consent-Flow noch nicht lief
     * (Status UNKNOWN, kein TCF-Flag), wird konservativ „gilt" angenommen.
     */
    private fun gdprApplies(context: Context): Boolean {
        val status = UserMessagingPlatform.getConsentInformation(context).consentStatus
        if (status == ConsentInformation.ConsentStatus.NOT_REQUIRED) return false

        val prefs = tcfPrefs(context)
        // -1 = Wert nicht gesetzt (Flow lief noch nicht). 0 = gilt nicht, 1 = gilt.
        return when (prefs.getInt(KEY_GDPR_APPLIES, -1)) {
            0 -> false
            else -> true
        }
    }

    private fun applyToFirebase(context: Context, signals: Signals) {
        val analytics = FirebaseAnalytics.getInstance(context)
        analytics.setConsent(
            mapOf(
                FirebaseAnalytics.ConsentType.ANALYTICS_STORAGE to status(signals.analyticsStorage),
                FirebaseAnalytics.ConsentType.AD_STORAGE to status(signals.adStorage),
                FirebaseAnalytics.ConsentType.AD_USER_DATA to status(signals.adUserData),
                FirebaseAnalytics.ConsentType.AD_PERSONALIZATION to status(signals.adPersonalization),
            )
        )
        analytics.setAnalyticsCollectionEnabled(signals.collectionEnabled)
        FirebaseCrashlytics.getInstance().setCrashlyticsCollectionEnabled(signals.collectionEnabled)
        // Ad-Personalisierung selbst regelt das GMA-SDK automatisch aus den TCF-Daten.
    }

    private fun status(granted: Boolean): FirebaseAnalytics.ConsentStatus =
        if (granted) FirebaseAnalytics.ConsentStatus.GRANTED
        else FirebaseAnalytics.ConsentStatus.DENIED

    /**
     * Prüft ein IAB-TCF-Bitfeld ('0'/'1'-String, 1-indiziert). Google-Vendor bzw.
     * Purpose-Positionen sind 1-basiert.
     */
    private fun hasBit(binaryString: String?, position: Int): Boolean {
        if (binaryString == null || position < 1 || position > binaryString.length) return false
        return binaryString[position - 1] == '1'
    }
}
