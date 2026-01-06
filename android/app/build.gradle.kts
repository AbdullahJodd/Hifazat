plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.google.gms.google-services") // ✅ REQUIRED FOR FIREBASE
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.hifazat.app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.hifazat.app"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

dependencies {
    // ✅ Firebase BOM (REQUIRED)
    implementation(platform("com.google.firebase:firebase-bom:33.4.0"))

    // (Optional but safe)
    implementation("com.google.firebase:firebase-analytics")
}

flutter {
    source = "../.."
}
