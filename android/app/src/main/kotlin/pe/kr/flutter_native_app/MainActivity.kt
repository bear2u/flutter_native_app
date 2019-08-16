package pe.kr.flutter_native_app

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity() {

  private val CHANNEL = "flutter.native/helper"

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    initChannel()
  }


  fun initChannel() {
    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
      if (call.method == "helloFromNativeCode") {
        val greetings = "Hello"
        result.success(greetings)
      }
    }
  }

}
