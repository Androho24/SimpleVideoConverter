package com.androho.simplevideoconverter

import android.content.ContentValues
import android.content.Context
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import android.webkit.MimeTypeMap
import androidx.annotation.RequiresApi
import java.io.File
import java.io.IOException

/**
 * Speichert ein Video nach `Movies/<Album>`.
 *
 * Gal (2.3.2) kann das nicht: Mit Album legt es auch Videos unter
 * `Pictures/<Album>` ab (`GalPlugin.createContentValues`:
 * `isImage || album != null ? DIRECTORY_PICTURES : DIRECTORY_MOVIES`), ohne
 * Album lose in `Movies/`. Ab Android 10 geht das Einfügen über
 * `RELATIVE_PATH` ohne Berechtigung; darunter bräuchte es
 * WRITE_EXTERNAL_STORAGE samt Abfrage, das übernimmt dort weiter Gal.
 */
@RequiresApi(Build.VERSION_CODES.Q)
object VideoGallerySaver {

    // Wie in OriginalVideoPicker: 8 KB pro Schreibaufruf wären bei großen
    // Videos sehr viele Aufrufe über MediaStore/FUSE.
    private const val COPY_BUFFER_BYTES = 1024 * 1024

    /**
     * Name und Endung kommen von der Quelldatei. Gibt es den Namen im Album
     * schon, hängt MediaStore selbst „ (1)“ an.
     */
    fun save(context: Context, sourcePath: String, album: String): Uri {
        val source = File(sourcePath)
        val resolver = context.contentResolver
        val values = ContentValues().apply {
            put(MediaStore.Video.Media.DISPLAY_NAME, source.name)
            put(
                MediaStore.Video.Media.RELATIVE_PATH,
                "${Environment.DIRECTORY_MOVIES}/$album"
            )
            // Ohne Typ leitet MediaStore ihn aus der Endung ab.
            MimeTypeMap.getSingleton()
                .getMimeTypeFromExtension(source.extension.lowercase())
                ?.let { put(MediaStore.Video.Media.MIME_TYPE, it) }
            // Bis die Kopie fertig ist, sehen Galerien den Eintrag nicht.
            put(MediaStore.Video.Media.IS_PENDING, 1)
        }
        val collection =
            MediaStore.Video.Media.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY)
        val uri = resolver.insert(collection, values)
            ?: throw IOException("MediaStore-Eintrag nicht angelegt")
        try {
            val output = resolver.openOutputStream(uri)
                ?: throw IOException("Kein Ausgabestrom für $uri")
            output.use { out ->
                source.inputStream().use { it.copyTo(out, COPY_BUFFER_BYTES) }
            }
            resolver.update(
                uri,
                ContentValues().apply { put(MediaStore.Video.Media.IS_PENDING, 0) },
                null,
                null
            )
        } catch (e: Exception) {
            // Kein halbes Video in der Galerie zurücklassen.
            try {
                resolver.delete(uri, null, null)
            } catch (_: Exception) {
            }
            throw e
        }
        return uri
    }
}
