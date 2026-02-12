plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.andrew.calculator"
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
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.andrew.calculator"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        if (System.getenv("ANDROID_KEYSTORE_PATH")) {
            release {
                storeFile file(System.getenv("ANDROID_KEYSTORE_PATH"))
                keyAlias System.getenv("ANDROID_KEYSTORE_ALIAS")
                keyPassword System.getenv("ANDROID_KEYSTORE_PRIVATE_KEY_PASSWORD")
                storePassword System.getenv("ANDROID_KEYSTORE_PASSWORD")
            }
        } else {
            release {
                keyAlias keystoreProperties['keyAlias']
                keyPassword keystoreProperties['keyPassword']
                storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
                storePassword keystoreProperties['storePassword']
            }
        }
    }

    flavorDimensions "default"
    productFlavors {
        production {
            dimension "default"
            applicationIdSuffix ""
            manifestPlaceholders = [appName: "Calculator"]
        }
        staging {
            dimension "default"
            applicationIdSuffix ".stg"
            manifestPlaceholders = [appName: "[STG] Calculator"]
        }
        development {
            dimension "default"
            applicationIdSuffix ".dev"
            manifestPlaceholders = [appName: "[DEV] Calculator"]
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            minifyEnabled true
            proguardFiles getDefaultProguardFile('proguard-android.txt')
        }
        debug {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
