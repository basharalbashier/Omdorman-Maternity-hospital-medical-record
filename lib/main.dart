import 'dart:io';
import 'package:aldayat_screens/models/user_hive.dart';
import 'package:aldayat_screens/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'pages/add_user.dart';


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
      home:LoginView(),
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
/*

add patient

     Material(
                        child: Center(
                          child: ElevatedButton(

                              // style:ButtonStyle(backgroundColor:Colors.te ),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AddPatient()),
                                  (Route<dynamic> route) => true,
                                );
                              },
                              child: SizedBox(
                                  height: 30,
                                  child: Center(
                                    child: Text("Add Patient"),
                                  ))),
                        ),
                      ),
*/