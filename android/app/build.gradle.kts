import java.util.Properties

configurations.configureEach {
    // Next-Gen enthält die für Mediation benötigten GMS-Klassen bereits selbst.
    // Die Legacy-Module der Adapter würden sonst Duplicate-Class-Fehler erzeugen.
    exclude(group = "com.google.android.gms", module = "play-services-ads")
    exclude(group = "com.google.android.gms", module = "play-services-ads-lite")
}

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// key.properties einlesen (liegt außerhalb des Repos, siehe .gitignore)
val keyPropertiesFile = rootProject.file("app/key.properties")
val keyProperties = Properties().apply {
    if (keyPropertiesFile.exists()) load(keyPropertiesFile.inputStream())
}

// local.properties einlesen (liegt außerhalb des Repos, siehe .gitignore)
val localPropertiesFile = rootProject.file("local.properties")
val localProperties = Properties().apply {
    if (localPropertiesFile.exists()) load(localPropertiesFile.inputStream())
}

android {
    namespace = "com.androho.simplevideoconverter"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    buildFeatures {
        buildConfig = true
    }

    packagingOptions {
        jniLibs {
            useLegacyPackaging = true
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.androho.simplevideoconverter"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 24  // ffmpeg_kit_flutter_full benötigt minSdk 24
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        manifestPlaceholders["admobAppId"] = localProperties.getProperty("admob.appId", "")
    }

    signingConfigs {
        create("release") {
            keyAlias = keyProperties["keyAlias"] as String?
            keyPassword = keyProperties["keyPassword"] as String?
            storeFile = keyProperties["storeFile"]?.let { file(it as String) }
            storePassword = keyProperties["storePassword"] as String?
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("com.google.android.ump:user-messaging-platform:4.0.0")

    // Next-Gen-Version wie in google_mobile_ads 9.2.0 (1.5.0). Meta und
    // Liftoff sind von Google genau dagegen getestet, Pangle gegen 1.4.0.
    // Beim Plugin-Update hier und bei den Adaptern mitziehen: Die Adapter
    // nennen auf den Next-Gen-Mediationsseiten ihre getestete SDK-Version.
    implementation("com.google.android.libraries.ads.mobile.sdk:ads-mobile-sdk:1.5.0")

    // Offiziell dokumentierte Next-Gen-kompatible Bidding-Adapter. Alle drei
    // lesen den UMP-Consent selbst (Additional Consent).
    implementation("com.google.ads.mediation:facebook:6.22.0.1")
    implementation("com.google.ads.mediation:pangle:8.3.0.4.0")
    implementation("com.google.ads.mediation:vungle:7.7.9.0")

    // Native Firebase-Artefakte für den Zugriff aus Kotlin (ConsentModeHelper).
    // Die FlutterFire-Plugins deklarieren diese nur als 'implementation' und stellen
    // sie damit nicht auf dem Compile-Classpath des App-Moduls bereit. BoM-Version
    // muss zu firebase_core passen (firebase_core/android/gradle.properties).
    implementation(platform("com.google.firebase:firebase-bom:34.12.0"))
    implementation("com.google.firebase:firebase-analytics")
    implementation("com.google.firebase:firebase-crashlytics")
}
