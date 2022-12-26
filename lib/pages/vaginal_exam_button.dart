import 'package:aldayat_screens/models/user_hive.dart';
import 'package:aldayat_screens/widgets/vaginal_exam_finding.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

Widget vaginalFindingButton(context, patient, file, User user) {
  return MaterialButton(
    color: Colors.blueGrey.shade800,
    onPressed: () => Get.to(() => VaginalExam(
          patient: patient,
          file: file,
          user: user,
        ),),
    child: Center(
      child: SizedBox(
          height: 30,
          child: Center(
            child: Text(
              "Vaginal Exam",
              style: TextStyle(color: Colors.white),
            ),
          )),
    ),
  );
}
