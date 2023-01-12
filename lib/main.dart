import 'dart:io';
import 'package:aldayat_screens/models/user_hive.dart';
import 'package:aldayat_screens/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'widgets/contact_me.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

//🐒💁👌🎍😍🦊👨
void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  if (kIsWeb) {
    Hive.registerAdapter(UserAdapter());
  }
  if (Platform.isLinux || Platform.isWindows) {
    initDataBase();
  }
  FlutterNativeSplash.remove();
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    DayatApp(),
  );
}

class DayatApp extends StatelessWidget {
  const DayatApp({Key? key}) : super(key: key);
//Unauthenticated.
  // var item = {
  //   "id": 1,
  //   "created_at": "2022-02-13T18:28:2.0000000000",
  //   "temp": "37",
  //   "bp": "120.80",
  //   "puls": "83",
  //   "breath": "33",
  //   "other": "70",
  // };

  // AnaesthiaAndRefreshFollowUp v = AnaesthiaAndRefreshFollowUp(
  //   file: {},
  //   patient: {},
  //   user: User({}, ''),
  // );
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.notoKufiArabicTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: PrivateScaffold(LoginView(), context));
  }
  // LoginView()
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
