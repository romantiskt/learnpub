package com.rolan.oneday

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

/**
 * Created by Rolan.Wang on 4/1/21.3:12 PM
 * 描述：
 */
class App : Application() {

    lateinit var flutterEngine: FlutterEngine
    override fun onCreate() {
        super.onCreate()
        initFlutter()
    }

    private fun initFlutter() {
        flutterEngine = FlutterEngine(this)
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )
        flutterEngine.navigationChannel.setInitialRoute("/")
        FlutterEngineCache
            .getInstance()
            .put(Constants.Flutter_Engine_Id, flutterEngine)
    }
}