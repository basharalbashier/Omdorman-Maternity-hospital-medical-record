import 'dart:io';
import 'package:aldayat_screens/models/user_hive.dart';
import 'package:aldayat_screens/pages/login.dart';
import 'package:aldayat_screens/pages/neo_discharg.dart';
import 'package:aldayat_screens/pages/neonatal_addmission.dart';
import 'package:aldayat_screens/pages/testo.dart';
import 'package:aldayat_screens/widgets/accept_or_not_lab_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';



String url = 'https://aldayat.loca.lt/api/';
var headr = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
  //  'Authorization': '<Your token>'
};
//🐒💁👌🎍😍🦊👨
void main() {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Hive.registerAdapter(UserAdapter());
 FlutterNativeSplash.remove();
  HttpOverrides.global = MyHttpOverrides();
  runApp( DayatApp());
}

class DayatApp extends StatelessWidget {
   DayatApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:Testo(),
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
