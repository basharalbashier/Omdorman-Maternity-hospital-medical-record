import 'package:aldayat_screens/pages/anea_and_refresh_follow_up.dart';
import 'package:flutter/material.dart';
import '../models/user_hive.dart';

Widget anaesthia_and_refreshFollowUp(
    context, Map patient, Map file, User user) {
  return Visibility(
    visible: user.user!['dep'] == 'Department of Anesthesiology',
    child: MaterialButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => AnaesthiaAndRefreshFollowUp(
                      patient: patient,
                      file: file,
                      user: user,
                    )),
            (Route<dynamic> route) => true,
          );
        },
        color: Colors.deepOrangeAccent,
        child: SizedBox(
            child: Center(
          child: Text(
            "Anesthesia and Resuscitation Record",
            style: TextStyle(color: Colors.white),
          ),
        ))),
  );
}
