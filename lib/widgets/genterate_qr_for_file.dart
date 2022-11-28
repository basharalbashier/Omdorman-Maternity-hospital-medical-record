




import 'package:qr_flutter/qr_flutter.dart';

QrImage generatQr(Map patientId, Map fileId,String type){


  return  QrImage(
                data: "${patientId['id']}-${fileId['id']}-$type",
                version: QrVersions.auto,
                size: 200.0,
              );


}