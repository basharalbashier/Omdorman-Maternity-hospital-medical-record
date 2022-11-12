import 'package:aldayat_screens/pages/login.dart';
import 'package:aldayat_screens/pages/add_patient.dart';
import 'package:aldayat_screens/pages/add_user.dart';
import 'package:aldayat_screens/widgets/vaginal_exam_finding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/add_obsHistory.dart';
import 'pages/antenatal_addm.dart';
import 'widgets/bar_code.dart';
import 'pages/edd_expectation.dart';
import 'pages/lab_request_form.dart';
import 'pages/uSRespons.dart';
import 'widgets/dr_porogress.dart';
import 'widgets/nurse_prog.dart';

String url ='https://aldayat.loca.lt/api/';
var headr={
      //  'Content-type': 'application/json',
       'Accept': 'application/json',
      //  'Authorization': '<Your token>'
     };
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: VaginalExam(),


    );
  }
}
