import 'package:aldayat_screens/pages/home_anesth.dart';
import 'package:aldayat_screens/pages/home_clinical_pharmacy.dart';
import 'package:aldayat_screens/pages/home_dentistry.dart';
import 'package:aldayat_screens/pages/home_insuranse.dart';
import 'package:aldayat_screens/pages/home_lab_spica.dart';
import 'package:aldayat_screens/pages/home_medicine.dart';
import 'package:aldayat_screens/pages/home_pediatric.dart';
import 'package:aldayat_screens/pages/home_pharmacy.dart';
import 'package:aldayat_screens/pages/home_psychiat.dart';
import 'package:aldayat_screens/pages/home_statistics.dart';
import 'package:aldayat_screens/pages/home_surgery.dart';
import 'package:aldayat_screens/pages/home_us.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/simpleUIController.dart';
import '../pages/home_nutrition.dart';
import '../pages/home_obs.dart';
import 'user_hive.dart';

routeManager(context, User user) {
  SimpleUIController simpleUIController = Get.find<SimpleUIController>();
  simpleUIController.getUsers(user, context);

  String level = user.user!['dep'];
  if (level == 'Department of Pediatrics') {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => PediatricHome(
                user: user,
              )),
      (Route<dynamic> route) => false,
    );
  } else if (level == 'Department of Obstetrics') {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => HomePage(
                user: user,
              )),
      (Route<dynamic> route) => false,
    );
  } else if (level == 'Department of Psychiatry') {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => PsychiatrcsHome()),
      (Route<dynamic> route) => false,
    );
  } else if (level == 'Department of Internal Medicine') {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MedicineHome()),
      (Route<dynamic> route) => false,
    );
  } else if (level == 'Department of Nutrition Medicine') {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => NutritioneHome(
                user: user,
              )),
      (Route<dynamic> route) => false,
    );
  } else if (level == 'Department of Clinical Pharmacy') {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => ClinicalHome()),
      (Route<dynamic> route) => false,
    );
  } else if (level == 'Department of Surgery') {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SurgeryHome()),
      (Route<dynamic> route) => false,
    );
  } else if (level == 'Department of Anesthesiology') {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => AnaesthiayHome(user: user)),
      (Route<dynamic> route) => false,
    );
  } else if (level == 'Department of Dentistry') {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => DentistryHome()),
      (Route<dynamic> route) => false,
    );
  } else if (level == 'Department of Statistics') {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => StatisticsHome(
                user: user,
              )),
      (Route<dynamic> route) => false,
    );
  } else if (level == 'Medical lab') {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LabHome(user: user)),
      (Route<dynamic> route) => false,
    );
  } else if (level == 'Department of Ultrasound') {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => UltrasoundHome(user: user)),
      (Route<dynamic> route) => false,
    );
  } else if (level == 'Insuranse') {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const InsuranseHome()),
      (Route<dynamic> route) => false,
    );
  } else if (level == 'Department of Pharmacy') {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => PharmacyHome()),
      (Route<dynamic> route) => false,
    );
  }
}
