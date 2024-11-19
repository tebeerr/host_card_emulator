package com.example.nfc_emulation_app
import android.nfc.cardemulation.HostApduService
import android.os.Bundle

class MyHostApduService : HostApduService() {
    override fun processCommandApdu(commandApdu: ByteArray, extras: Bundle?): ByteArray? {
        // Example APDU command processing
        // Here you would implement your specific card emulation logic

        // Sample response for SELECT AID command
        if (commandApdu.size >= 4) {
            if (commandApdu[0] == 0x00.toByte() && // CLA
                commandApdu[1] == 0xA4.toByte() && // INS
                commandApdu[2] == 0x04.toByte() && // P1
                commandApdu[3] == 0x00.toByte()    // P2
            ) {
                // Return success response
                return byteArrayOf(0x90.toByte(), 0x00.toByte())
            }
        }

        // Default response for unknown commands
        return byteArrayOf(0x6F.toByte(), 0x00.toByte())
    }

    override fun onDeactivated(reason: Int) {
        // Handle deactivation (e.g., cleanup)
    }
}
