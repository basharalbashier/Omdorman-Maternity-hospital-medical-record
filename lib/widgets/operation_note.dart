import 'package:aldayat_screens/models/user_hive.dart';
import 'package:aldayat_screens/pages/operation_note.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Widget operationButtonButton(context, patient, file, User user) {
  return MaterialButton(
    color: Colors.cyan,
    onPressed: () => Get.to(() => OperationNote(
          patient: patient,
          file: file,
          user: user,
        )),
    child: Center(
      child: SizedBox(
          height: 30,
          child: Center(
            child: Text(
              "Operation Note",
              style: TextStyle(color: Colors.white),
            ),
          )),
    ),
  );
}
