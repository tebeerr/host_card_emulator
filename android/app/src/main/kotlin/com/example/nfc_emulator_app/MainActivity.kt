package com.example.nfc_emulation_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Intent
import android.nfc.cardemulation.HostApduService

class MainActivity: FlutterActivity() {
    private val CHANNEL = "nfc/emulation"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            when (call.method) {
                "startEmulation" -> {
                    startNfcEmulation()
                    result.success(null)
                }
                "stopEmulation" -> {
                    stopNfcEmulation()
                    result.success(null)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun startNfcEmulation() {
        val intent = Intent(this, MyHostApduService::class.java)
        startService(intent)
    }

    private fun stopNfcEmulation() {
        val intent = Intent(this, MyHostApduService::class.java)
        stopService(intent)
    }
}
