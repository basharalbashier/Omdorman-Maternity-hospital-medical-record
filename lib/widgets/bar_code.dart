import 'package:aldayat_screens/pages/file_page.dart';
import 'package:aldayat_screens/pages/patient_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class ScanCode extends StatefulWidget {
  final context;
  final List patients;
  const ScanCode({Key? key, this.context, required this.patients})
      : super(key: key);

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
            var s = code!.substring(15);
            var file_id = code.split('-')[1];
            var type = code.split('-')[2];
              var patient_id = s.split('-')[0];
            // print(patient_id);
            //    print(file_id);
            //        print(type);
            for (var patient in widget.patients) {
              //  print(patient_id);
              if (patient['id'].toString() == patient_id) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PatientPage(
                            patient: patient,
                            fileId: int.parse(file_id),
                            type: type,
                          )),
                  (Route<dynamic> route) => true,
                );
              }
            }

            setState(() {
              this.code = code;
            });
          });
    } catch (e) {
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
