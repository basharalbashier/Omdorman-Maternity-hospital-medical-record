import 'package:aldayat_screens/pages/gyne_addmission.dart';
import 'package:flutter/material.dart';
import '../models/user_hive.dart';


Widget gynAdmissionButton(context, Map patient, Map file, User user) {
  return MaterialButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => GynaeAdmission(
                    patient: patient,
                    file: file,
                    user: user,
                  )),
          (Route<dynamic> route) => true,
        );
      },
      color: Colors.teal,
      child: SizedBox(
          child: Center(
        child: Text("Gyne Admission",style: TextStyle(color: Colors.white),),
      )));
}
