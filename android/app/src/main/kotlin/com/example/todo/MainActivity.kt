package com.example.todo

import io.flutter.embedding.android.FlutterActivity
import com.tekartik.sqflite.SqflitePlugin

class MainActivity: FlutterActivity() {
    @override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)      
        SqflitePlugin.registerWith(registrarFor("com.tekartik.sqflite.SqflitePlugin"))

    }
}
