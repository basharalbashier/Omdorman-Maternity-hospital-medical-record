import 'package:flutter/material.dart';

import '../pages/add_baby_file.dart';

Widget addBabyFileWidget(user, context, patientId, fileId) {
  return MaterialButton(
      color: Colors.lightGreen,
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => AddBabyFile(
                    user: user,
                    patientId: patientId,
                    fileId: fileId,
                  )),
          (Route<dynamic> route) => true,
        );
      },
      child: SizedBox(
          height: 30,
          child: Center(
            child: Text(
              "Add Baby file",
              style: TextStyle(color: Colors.white),
            ),
          )));
}
