import 'package:flutter/material.dart';

import '../pages/home_page.dart';


routeManager(String level, context) {
  if (level == 'Consultant') {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
      (Route<dynamic> route) => false,
    );
  } else if (level == 'Specialist') {
        Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) =>  Container(child: Text(level),)),
                (Route<dynamic> route) => false,
              );
  } else if (level == 'Registrar') {
        Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) =>  Container(child: Text(level),)),
                (Route<dynamic> route) => false,
              );
  } else if (level == 'Medical') {
        Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context)  =>  const HomePage()),
                (Route<dynamic> route) => false,
              );
  } else if (level == 'House Officer') {
        Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context)=> Container(child: Text(level),)),
                (Route<dynamic> route) => false,
              );
  } else if (level == 'Medical Director') {
        Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) =>   Container(child: Text(level),)),
                (Route<dynamic> route) => false,
              );
  } else if (level == 'Nurse') {
        Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) =>  Container(child: Text(level),)),
                (Route<dynamic> route) => false,
              );
  } else if (level == 'Clinical Pharmacist') {
        Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) =>  Container(child: Text(level),)),
                (Route<dynamic> route) => false,
              );
  } else if (level == 'Ultrasound specialist') {
        Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context)  => Container(child: Text(level),)),
                (Route<dynamic> route) => false,
              );
  } else if (level == 'Pharmacist') {
        Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Container(child: Text(level),)),
                (Route<dynamic> route) => false,
              );
  } else if (level == 'Lab specialist') {
        Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) =>  Container(child: Text(level),)),
                (Route<dynamic> route) => false,
              );
  } else if (level == 'Insuranse Agent') {
        Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Container(child: Text(level),)),
                (Route<dynamic> route) => false,
              );
  } else if (level == 'Statistics Officer') {
        Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (Route<dynamic> route) => false,
              );
  } else if (level == 'Nutritionist') {
        Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) =>  Container(child: Text(level),)),
                (Route<dynamic> route) => false,
              );
  } else if (level == 'Psychiatrist') {
        Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) =>  Container(child: Text(level),)),
                (Route<dynamic> route) => false,
              );
  }
}
