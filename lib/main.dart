import 'dart:io';

import 'package:aldayat_screens/models/user_hive.dart';
import 'package:aldayat_screens/pages/add_file.dart';
import 'package:aldayat_screens/pages/add_obsHistory.dart';
import 'package:aldayat_screens/pages/login.dart';
import 'package:aldayat_screens/pages/add_patient.dart';
import 'package:aldayat_screens/pages/add_user.dart';
import 'package:aldayat_screens/pages/maturational_assesment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'pages/gyne_addmission.dart';
import 'pages/icu_follow_up.dart';

String url = 'https://aldayat.loca.lt/api/';
var headr = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  //  'Authorization': '<Your token>'
};
void main() {
  Hive.registerAdapter(UserAdapter());

  HttpOverrides.global = MyHttpOverrides();
  runApp(const DayatApp());
}

class DayatApp extends StatelessWidget {
  const DayatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:GynaeAdmission(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
