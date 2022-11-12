import 'package:flutter/material.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class ScanCode extends StatefulWidget {
  const ScanCode({Key? key}) : super(key: key);

  @override
  State<ScanCode> createState() => _MyAppState();
}

class _MyAppState extends State<ScanCode> {
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  String? code;
  runQrCode() {
    try {
      _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
          context: context,
          onCode: (code) {
            print(code);
            setState(() {
              this.code = code;
            });
          });
    } catch (e) {
      print(e);
      runQrCode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              try {
                runQrCode();
              } catch (e) {
                runQrCode();
              }
            },
            child: SizedBox(
                height: 30,
                width: 20,
                child: Center(
                  child: Icon(Icons.qr_code),
                ))),
      ),
    );
    ;
  }
}
