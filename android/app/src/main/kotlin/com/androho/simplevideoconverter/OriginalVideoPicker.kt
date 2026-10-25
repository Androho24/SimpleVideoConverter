package com.androho.simplevideoconverter

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.MediaStore
import android.provider.OpenableColumns
import android.system.Os
import android.system.OsConstants
import android.util.Log
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.util.UUID

/**
 * Videoauswahl über die Dateiauswahl des Systems (SAF) und „Original löschen“.
 *
 * Bewusst nicht der Photo Picker (über image_picker): Der liefert als Namen nur
 * eine Nummer („45677.mp4“), und seine URI lehnt `createTrashRequest` ab
 * („All requested items must be referenced by specific ID“). SAF liefert den
 * echten Namen, und `MediaStore.getMediaUri` macht aus dem Dokument einen
 * MediaStore-Eintrag, den der Papierkorb-Dialog annimmt. Gerätetest
 * 2026-09-27, Pixel 10. Keiner der Wege braucht Medien-Leserechte: Die Auswahl
 * selbst gibt Zugriff auf genau diese eine Datei.
 *
 * Videos auf dem Gerät werden nicht kopiert, sondern direkt gelesen (Vorschau
 * per `content://`, FFmpeg per `saf:`): Das Kopieren war bei großen Videos
 * die ganze Ladezeit und belegte den Speicher doppelt. Nur Cloud- und andere
 * Anbieter, deren Datenstrom keine echte Datei ist, laufen weiter über die
 * Kopie im Cache.
 */
class OriginalVideoPicker(private val activity: Activity) {

    companion object {
        private const val TAG = "OriginalVideoPicker"
        private const val REQUEST_PICK = 7301
        private const val REQUEST_TRASH = 7302

        // Der Standardpuffer von copyTo (8 KB) bedeutet bei Dateien aus dem
        // MediaStore einen FUSE-Aufruf pro 8 KB — bei einem 1-GB-Video über
        // 130.000 Stück. 1 MB bündelt das.
        private const val COPY_BUFFER_BYTES = 1024 * 1024

        // Anbieter, deren Dokumente echte Dateien auf dem Gerät sind. Bei
        // allen anderen (Drive, OneDrive, …) kann der Datenstrom eine Pipe
        // sein, in der FFmpeg nicht springen kann, oder bei jedem Öffnen einen
        // Download auslösen, der offline scheitert.
        private val LOCAL_AUTHORITIES = setOf(
            "com.android.providers.media.documents",
            "com.android.externalstorage.documents",
            "com.android.providers.downloads.documents",
            MediaStore.AUTHORITY,
        )
    }

    private var pendingResult: MethodChannel.Result? = null

    /**
     * Kopierfortschritt 0.0–1.0, auf dem Main-Thread, höchstens einmal pro
     * Prozentpunkt. Bleibt stumm, wenn der Anbieter keine Dateigröße nennt.
     */
    var onCopyProgress: ((Double) -> Unit)? = null

    /**
     * Öffnet die Dateiauswahl. Ergebnis: null bei Abbruch, sonst
     * `source` (die `content://`-URI bei Dateien auf dem Gerät, sonst der Pfad
     * der Kopie im Cache mit echtem Namen), `displayName` und `trashUri`
     * (MediaStore-URI des Originals, nur ab Android 11 und nur für Dateien aus
     * dem MediaStore — sonst null, dann gibt es keinen Löschen-Button).
     */
    fun pickVideo(result: MethodChannel.Result) {
        if (!claim(result)) return
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT).apply {
            addCategory(Intent.CATEGORY_OPENABLE)
            type = "video/*"
        }
        try {
            activity.startActivityForResult(intent, REQUEST_PICK)
        } catch (e: Exception) {
            // Geräte ohne Dateiauswahl (manche TV-Boxen, abgespeckte Builds):
            // Ohne das Zurücksetzen bliebe pendingResult belegt, und jeder
            // weitere Versuch endete mit „busy“.
            Log.w(TAG, "Dateiauswahl nicht verfügbar", e)
            pendingResult = null
            result.error("no_picker", e.message, null)
        }
    }

    /** Legt das Original über den System-Dialog in den Papierkorb. Ergebnis: bestätigt ja/nein. */
    fun trashOriginal(uri: String?, result: MethodChannel.Result) {
        if (uri == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
            result.success(false)
            return
        }
        if (!claim(result)) return
        try {
            val request = MediaStore.createTrashRequest(
                activity.contentResolver, listOf(Uri.parse(uri)), true
            )
            activity.startIntentSenderForResult(request.intentSender, REQUEST_TRASH, null, 0, 0, 0)
        } catch (e: Exception) {
            Log.w(TAG, "createTrashRequest abgelehnt", e)
            pendingResult = null
            result.error("trash_failed", e.message, null)
        }
    }

    /**
     * Gibt alle dauerhaften Leseberechtigungen frei außer der für [keep] (die
     * URI des gerade geladenen Videos, null für alle). Android begrenzt sie auf
     * 128 bzw. ab Android 11 512 pro App.
     */
    fun releaseAccess(keep: String?) {
        val resolver = activity.contentResolver
        for (permission in resolver.persistedUriPermissions) {
            if (permission.uri.toString() == keep) continue
            try {
                resolver.releasePersistableUriPermission(
                    permission.uri, Intent.FLAG_GRANT_READ_URI_PERMISSION
                )
            } catch (e: Exception) {
                Log.w(TAG, "Freigabe abgelehnt: ${permission.uri}", e)
            }
        }
    }

    /** @return true, wenn der Request hierher gehörte. */
    fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode != REQUEST_PICK && requestCode != REQUEST_TRASH) return false
        val result = pendingResult ?: return true
        pendingResult = null
        if (requestCode == REQUEST_TRASH) {
            result.success(resultCode == Activity.RESULT_OK)
            return true
        }
        val picked = data?.data
        if (resultCode != Activity.RESULT_OK || picked == null) {
            result.success(null)
            return true
        }
        // Große Videos zu kopieren dauert, und auch das Öffnen zur Prüfung geht
        // über den Anbieter — nicht auf dem Main-Thread.
        Thread {
            val reply = try {
                resolvePicked(picked)
            } catch (e: Exception) {
                Log.w(TAG, "Kopieren fehlgeschlagen", e)
                null
            }
            activity.runOnUiThread {
                if (reply == null) {
                    result.error("copy_failed", "Video konnte nicht gelesen werden", null)
                } else {
                    result.success(reply)
                }
            }
        }.start()
        return true
    }

    private fun claim(result: MethodChannel.Result): Boolean {
        if (pendingResult != null) {
            result.error("busy", "Eine Auswahl läuft bereits", null)
            return false
        }
        pendingResult = result
        return true
    }

    private fun resolvePicked(uri: Uri): Map<String, Any?> {
        val (displayName, totalBytes) = queryNameAndSize(uri)
        val source = if (canReadDirectly(uri)) {
            uri.toString()
        } else {
            copyToCache(uri, displayName, totalBytes)
        }
        return mapOf(
            "source" to source,
            "displayName" to displayName,
            "trashUri" to mediaStoreUri(uri)?.toString(),
        )
    }

    /**
     * Direkt lesbar, wenn das Dokument von einem lokalen Anbieter stammt, als
     * echte Datei geöffnet wird (FFmpeg muss darin springen können, etwa zum
     * moov-Atom am Dateiende) und die Leseberechtigung dauerhaft wird.
     *
     * Dauerhaft, weil die normale Berechtigung aus der Auswahl an der Activity
     * hängt, die Flutter-Engine aber länger lebt: Nach Zurück und erneutem
     * Öffnen wäre das Video noch geladen, aber nicht mehr lesbar. Freigegeben
     * wird über [releaseAccess].
     */
    private fun canReadDirectly(uri: Uri): Boolean {
        if (uri.authority !in LOCAL_AUTHORITIES) return false
        val isRegularFile = try {
            activity.contentResolver.openFileDescriptor(uri, "r")?.use {
                OsConstants.S_ISREG(Os.fstat(it.fileDescriptor).st_mode)
            } ?: false
        } catch (e: Exception) {
            Log.i(TAG, "Nicht direkt lesbar: $uri: $e")
            false
        }
        if (!isRegularFile) return false
        return try {
            activity.contentResolver.takePersistableUriPermission(
                uri, Intent.FLAG_GRANT_READ_URI_PERMISSION
            )
            true
        } catch (e: SecurityException) {
            Log.i(TAG, "Keine dauerhafte Berechtigung für $uri: $e")
            false
        }
    }

    /**
     * Kopiert wie image_picker nach `cache/<UUID>/<Name>`. Den UUID-Ordner räumt
     * der App-Start wieder ab (`_cleanAppCache` in converter_screen.dart).
     * @return Pfad der Kopie.
     */
    private fun copyToCache(uri: Uri, displayName: String?, totalBytes: Long?): String {
        // Nur was als Dateiname im Cache nicht geht; die Bereinigung für den
        // Ausgabenamen macht OutputFileName auf der Dart-Seite.
        val safeName = displayName
            ?.replace(Regex("[\\u0000-\\u001f/]"), "_")
            ?.trim()
            ?.takeIf { it.isNotEmpty() && it != "." && it != ".." }
            ?: "video.mp4"
        val dir = File(activity.cacheDir, UUID.randomUUID().toString()).apply { mkdirs() }
        val target = File(dir, safeName)
        activity.contentResolver.openInputStream(uri).use { input ->
            requireNotNull(input) { "Kein Datenstrom für $uri" }
            target.outputStream().use { output ->
                val buffer = ByteArray(COPY_BUFFER_BYTES)
                var copied = 0L
                var lastPercent = -1
                while (true) {
                    val read = input.read(buffer)
                    if (read < 0) break
                    output.write(buffer, 0, read)
                    copied += read
                    if (totalBytes != null && totalBytes > 0) {
                        val percent = (copied * 100 / totalBytes).toInt().coerceAtMost(100)
                        if (percent != lastPercent) {
                            lastPercent = percent
                            reportProgress(percent / 100.0)
                        }
                    }
                }
            }
        }
        return target.path
    }

    private fun reportProgress(fraction: Double) {
        val callback = onCopyProgress ?: return
        activity.runOnUiThread { callback(fraction) }
    }

    /** Name und Größe in Bytes; beides null, wenn der Anbieter sie nicht kennt. */
    private fun queryNameAndSize(uri: Uri): Pair<String?, Long?> = try {
        activity.contentResolver
            .query(
                uri,
                arrayOf(OpenableColumns.DISPLAY_NAME, OpenableColumns.SIZE),
                null, null, null
            )
            ?.use {
                if (!it.moveToFirst()) return@use null to null
                val name = if (it.isNull(0)) null else it.getString(0)
                val size = if (it.isNull(1)) null else it.getLong(1)
                name to size
            }
            ?: (null to null)
    } catch (e: Exception) {
        null to null
    }

    /** Null, wenn das Dokument nicht aus dem MediaStore stammt (z. B. Cloud-Anbieter). */
    private fun mediaStoreUri(documentUri: Uri): Uri? {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) return null
        return try {
            MediaStore.getMediaUri(activity, documentUri)
        } catch (e: Exception) {
            Log.i(TAG, "Kein MediaStore-Eintrag für $documentUri: $e")
            null
        }
    }
}
