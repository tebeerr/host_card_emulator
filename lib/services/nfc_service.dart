import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NfcService extends ChangeNotifier {
  static const platform = MethodChannel('nfc/emulation');

  bool _isEmulating = false;
  String _status = 'Ready';

  bool get isEmulating => _isEmulating;
  String get status => _status;

  Future<void> startNfcEmulation() async {
    try {
      await platform.invokeMethod('startEmulation');
      _isEmulating = true;
      _status = 'Emulation started';
      notifyListeners();
    } catch (e) {
      _status = 'Failed to start emulation: $e';
      notifyListeners();
    }
  }

  Future<void> stopNfcEmulation() async {
    try {
      await platform.invokeMethod('stopEmulation');
      _isEmulating = false;
      _status = 'Emulation stopped';
      notifyListeners();
    } catch (e) {
      _status = 'Failed to stop emulation: $e';
      notifyListeners();
    }
  }
}