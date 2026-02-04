pluginManagement {
    val flutterSdkPath: String =
        run {
            val properties = java.util.Properties()
            file("local.properties").inputStream().use { properties.load(it) }
            val flutterSdk = properties.getProperty("flutter.sdk")
            require(flutterSdk != null) { "flutter.sdk not set in local.properties" }
            flutterSdk
        }

    // Include Flutter's Gradle build (Flutter Gradle plugin) from the SDK.
    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    // Ensure all Kotlin-related plugins across included builds use a single version (>= 2.1.0).
    resolutionStrategy {
        eachPlugin {
            if (requested.id.id.startsWith("org.jetbrains.kotlin")) {
                useVersion("2.1.10") // → Kotlin Version
            }
        }
    }

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

// See https://github.com/flutter/flutter/blob/master/docs/ecosystem/Plugins-and-Packages-repository-structure.md#gradle-structure
plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.11.1" apply false
    id("org.jetbrains.kotlin.android") version "2.2.20" apply false
}

include(":app")
