import 'package:aldayat_screens/pages/file_page.dart';
import 'package:flutter/material.dart';
import '../models/get_request.dart';
import '../models/user_hive.dart';

Widget naoOpenMotherFileButton(
  context,
  Map babyFile,
  User user,
) {
  return MaterialButton(
      color: Colors.purple,
      onPressed: () async {
        if (babyFile['file_id'] != "0") {
          var file = await getIt('file', user, context, babyFile['file_id']);
          var patient =
              await getIt('patient', user, context, babyFile['patient_id']);

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => FilePage(
                      file: file[0],
                      user: user,
                      type: "0",
                      patient: patient[0],
                    )),
            (Route<dynamic> route) => true,
          );
        }
      },
      child: SizedBox(
          // height: 30,
          child: Center(
        child: Text(
          babyFile['file_id'] != "0"
              ? "Open Mother\'s File"
              : "External Admission",
          style: TextStyle(color: Colors.white),
        ),
      )));
}
