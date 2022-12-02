import 'package:aldayat_screens/pages/maturational_assesment.dart';
import 'package:aldayat_screens/pages/neonatal_addmission.dart';
import 'package:flutter/material.dart';

import '../models/user_hive.dart';


Widget nauAdmissionButton(context,  Map file, User user) {
  return MaterialButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => NeonatalAdmission(
              
                    file: file,
                    user: user,
                  )),
          (Route<dynamic> route) => true,
        );
      },
      color: Colors.indigo,
      child: SizedBox(
          // height: 30,
          child: Center(
        child: Text("Neonatal Admission",style: TextStyle(color: Colors.white),),
      )));
}
