package com.rolan.oneday

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import io.flutter.embedding.android.FlutterActivityLaunchConfigs

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        findViewById<Button>(R.id.btn_flutter).setOnClickListener {
            var intent = Intent(this, DoFlutterActivity::class.java)
            intent.putExtra("cached_engine_id", Constants.Flutter_Engine_Id)
            intent.putExtra("background_mode", FlutterActivityLaunchConfigs.BackgroundMode.opaque.name)//透明模式不会采用RenderMode.surface绘制
            intent.putExtra("route","/")
            startActivity(intent)
        }
    }
}