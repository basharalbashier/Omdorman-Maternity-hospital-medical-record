import 'dart:io';
import 'package:aldayat_screens/models/user_hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constant.dart';
import 'models/error_message.dart';
import 'pages/anea_and_refresh_follow_up.dart';

String url = 'http://192.168.0.110/app/api/';
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
  runApp(DayatApp());
}

class DayatApp extends StatelessWidget {
  DayatApp({Key? key}) : super(key: key);
//Unauthenticated.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Stack(
        fit: StackFit.expand,
        children: [
          AnaesthiaAndRefreshFollowUp(
            file: {},
            patient: {},
            user: User({}, ''),
          ),
          // Home(
          //   file: {'id': 123, "dr_id": 2, 'patient_id': 1},
          //   user: User({"id": 1, "unit": "1", 'dep': 'hhh'}, ''),
          // ),
          Positioned(
            bottom: 0,
            right: 10,
            child: GestureDetector(
              onTap: () async {
                try {
                  await launchUrl(
                      Uri.parse("https://wa.me/+249117630388?text=Dr."));
                } catch (e) {
                  errono('+249117630388', '+249117630388', context, true,
                      Container(), 2);
                }
              },
              child: RichText(
                text: TextSpan(
                  text: 'Do you need any help?',
                  style: kHaveAnAccountStyle(Size(500, 500)),
                  children: [
                    TextSpan(
                      text: " Contact us",
                      style: kLoginOrSignUpTextStyle(Size(500, 500)),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
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
