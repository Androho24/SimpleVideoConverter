package com.androho.simplevideoconverter.ads

import android.app.Activity
import android.util.Log
import com.google.android.ump.ConsentRequestParameters
import com.google.android.ump.UserMessagingPlatform

/**
 * Verwaltet den GDPR/CCPA-Einwilligungsfluss via Google UMP SDK.
 *
 * Muss vor MobileAds.initialize() aufgerufen werden (Google-Anforderung).
 * Wird von der SplashActivity gestartet, da ein Activity-Kontext benötigt wird.
 *
 * Fehler-Strategie: Bei jedem Fehler wird onDone(canShowAds=true) aufgerufen,
 * damit der Ad-Flow nicht blockiert wird.
 */
object ConsentHelper {

    private const val TAG = "ConsentHelper"

    /**
     * Startet den Consent-Informations-Update und zeigt ggf. das Consent-Formular.
     *
     * @param activity  Die SplashActivity (benötigt für Formular-Anzeige)
     * @param onDone    Callback nach Abschluss: canShowAds = ob Werbung erlaubt ist
     */
    fun requestAndShowIfRequired(activity: Activity, onDone: (canShowAds: Boolean) -> Unit) {
        Log.d(TAG, "requestAndShowIfRequired() gestartet")

        val consentInformation = UserMessagingPlatform.getConsentInformation(activity)

        // Debug-Einstellungen: NUR für Tests aktivieren!
        // Geräte-Hash beim ersten Start aus Logcat kopieren:
        // Suche nach: "Use ConsentDebugSettings.Builder().addTestDeviceHashedId(...)"

        // Debug (nur zum Testen aktivieren):
        // val debugSettings = ConsentDebugSettings.Builder(activity)
        //     .setDebugGeography(ConsentDebugSettings.DebugGeography.DEBUG_GEOGRAPHY_EEA)
        //     .addTestDeviceHashedId("DEIN_GERAETE_HASH_HIER")
        //     .build()
        // val params = ConsentRequestParameters.Builder()
        //     .setConsentDebugSettings(debugSettings)
        //     .setTagForUnderAgeOfConsent(false)
        //     .build()

        val params = ConsentRequestParameters.Builder()
            .setTagForUnderAgeOfConsent(false)
            .build()

        consentInformation.requestConsentInfoUpdate(
            activity,
            params,
            {
                // onConsentInfoUpdateSuccess
                Log.d(TAG, "ConsentInfoUpdate erfolgreich. Status: ${consentInformation.consentStatus}")
                Log.d(TAG, "canRequestAds: ${consentInformation.canRequestAds()}")

                UserMessagingPlatform.loadAndShowConsentFormIfRequired(activity) { formError ->
                    if (formError != null) {
                        Log.w(TAG, "Consent-Formular-Fehler: ${formError.errorCode} - ${formError.message}")
                    } else {
                        Log.d(TAG, "Consent-Formular abgeschlossen oder nicht benötigt")
                    }

                    val canShowAds = consentInformation.canRequestAds()
                    Log.d(TAG, "Consent-Flow abgeschlossen. canShowAds=$canShowAds")
                    onDone(canShowAds)
                }
            },
            { requestConsentError ->
                // onConsentInfoUpdateFailure - fortfahren damit Ad-Flow nicht blockiert wird
                Log.w(TAG, "ConsentInfoUpdate fehlgeschlagen: ${requestConsentError.errorCode} - ${requestConsentError.message}")
                onDone(true)
            }
        )
    }
}
