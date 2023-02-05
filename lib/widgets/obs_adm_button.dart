import 'package:flutter/material.dart';

import '../models/user_hive.dart';
import '../pages/add_obsHistory.dart';

Widget obsAdmissionButton(context, Map patient, Map file, User user) {
  return Visibility(
    visible: user.user['dep'] == 'Department of Obstetrics',
    child: MaterialButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => AddObs(
                      patient: patient,
                      file: file,
                      user: user,
                    )),
            (Route<dynamic> route) => true,
          );
        },
        color: Colors.teal,
        child: SizedBox(
            // height: 30,
            child: Center(
          child: Text("Obs Admission"),
        ))),
  );
}
