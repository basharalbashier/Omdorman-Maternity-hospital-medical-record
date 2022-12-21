import 'dart:io';
import 'package:aldayat_screens/models/user_hive.dart';
import 'package:aldayat_screens/pages/login.dart';
import 'package:aldayat_screens/widgets/waiting_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'pages/anea_and_refresh_follow_up.dart';
import 'widgets/contact_me.dart';

//🐒💁👌🎍😍🦊👨
void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Hive.registerAdapter(UserAdapter());
  FlutterNativeSplash.remove();
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    DayatApp(),
  );
}

class DayatApp extends StatelessWidget {
  DayatApp({Key? key}) : super(key: key);
//Unauthenticated.

  AnaesthiaAndRefreshFollowUp v = AnaesthiaAndRefreshFollowUp(
    file: {},
    patient: {},
    user: User({}, ''),
  );
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
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
