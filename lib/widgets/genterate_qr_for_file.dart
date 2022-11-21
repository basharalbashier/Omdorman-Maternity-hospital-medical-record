




import 'package:qr_flutter/qr_flutter.dart';

QrImage generatQr(Map patientId, Map fileId){


  return  QrImage(
                data: "${patientId['id']}-${fileId['id']}",
                version: QrVersions.auto,
                size: 200.0,
              );


}