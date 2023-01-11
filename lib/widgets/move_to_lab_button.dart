import 'package:flutter/material.dart';
import '../models/user_hive.dart';
import '../pages/lab_request_form.dart';

Widget labButton(context, patient, file, type, User user) {
  return MaterialButton(
    color: Colors.blue,
    onPressed: () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => AddRequestForm(
                patient: patient, file: file, type: type, user: user)),
        (Route<dynamic> route) => true,
      );
    },
    child: Center(
      child: SizedBox(
          height: 30,
          child: Center(
            child: Text(
              "Lab Request",
              style: TextStyle(color: Colors.white),
            ),
          )),
    ),
  );
}
