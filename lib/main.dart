import 'dart:io';
import 'package:aldayat_screens/models/user_hive.dart';
import 'package:aldayat_screens/pages/login.dart';
import 'package:aldayat_screens/pages/operation_note.dart';
import 'package:aldayat_screens/pages/testo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constant.dart';
import 'models/error_message.dart';
import 'pages/delivery_note.dart';
import 'pages/neo_unit.dart';

String url = 'http://localhost:8000/api/';
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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: NeoUnit(
        file: {},
        user: User({}, ''),
      )
          //      Paragram(
          //   title: 'Fetal heart rate',
          // )

          //     Stack(
          //   fit: StackFit.expand,
          //   children: [

          //     Positioned(
          //       bottom: 0,
          //       right: 10,
          //       child: GestureDetector(
          //         onTap: () async {
          //           try {
          //             await launchUrl(
          //                 Uri.parse("https://wa.me/+249117630388?text=Dr."));
          //           } catch (e) {
          //             errono('+249117630388', '+249117630388', context, true,
          //                 Container(), 1);
          //           }
          //         },
          //         child: RichText(
          //           text: TextSpan(
          //             text: 'Do you need any help?',
          //             style: kHaveAnAccountStyle(Size(500, 500)),
          //             children: [
          //               TextSpan(
          //                 text: " Contact us",
          //                 style: kLoginOrSignUpTextStyle(Size(500, 500)),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // )
          ),
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
