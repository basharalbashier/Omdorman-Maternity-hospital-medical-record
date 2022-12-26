import 'package:aldayat_screens/pages/maturational_assesment.dart';
import 'package:flutter/material.dart';

import '../models/user_hive.dart';

Widget maturalAssessment(context,  Map file, User user) {
  return MaterialButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => Neuromuscular(
              
                    file: file,
                    user: user,
                  )),
          (Route<dynamic> route) => true,
        );
      },
      color: Colors.pink,
      child: SizedBox(
          // height: 30,
          child: Center(
        child: Text("Matura. Assessment",style: TextStyle(color: Colors.white),),
      )));
}
