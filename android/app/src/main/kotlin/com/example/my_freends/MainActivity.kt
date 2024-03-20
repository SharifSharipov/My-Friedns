package com.example.my_freends


import android.app.Application

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        //MapKitFactory.setLocale("RU") // Your preferred language. Not required, defaults to system language
        MapKitFactory.setApiKey("4055af6a-9f99-4ec0-8ebd-f8a53d20e2fc") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }
}
