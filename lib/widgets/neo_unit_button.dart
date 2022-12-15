import 'package:aldayat_screens/pages/maturational_assesment.dart';
import 'package:aldayat_screens/pages/neo_unit.dart';
import 'package:aldayat_screens/pages/neonatal_addmission.dart';
import 'package:flutter/material.dart';

import '../models/user_hive.dart';

Widget naoUnitButton(context, Map file, User user) {
  return MaterialButton(
      color: Colors.teal,
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => NeoUnit(
                    file: file,
                    user: user,
                  )),
          (Route<dynamic> route) => true,
        );
      },
      child: SizedBox(
          // height: 30,
          child: Center(
        child: Text(
          "Neonatal Unit",
          style: TextStyle(color: Colors.white),
        ),
      )));
}
