import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/nfc_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFC Card Emulation'),
      ),
      body: Consumer<NfcService>(
        builder: (context, nfcService, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  nfcService.isEmulating
                      ? Icons.nfc_rounded
                      : Icons.nfc_outlined,
                  size: 100,
                  color: nfcService.isEmulating
                      ? Colors.green
                      : Colors.grey,
                ),
                const SizedBox(height: 20),
                Text(
                  nfcService.isEmulating
                      ? 'NFC Emulation Active'
                      : 'NFC Emulation Inactive',
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (nfcService.isEmulating) {
                      nfcService.stopNfcEmulation();
                    } else {
                      nfcService.startNfcEmulation();
                    }
                  },
                  child: Text(
                      nfcService.isEmulating
                          ? 'Stop Emulation'
                          : 'Start Emulation'
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Status: ${nfcService.status}',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}