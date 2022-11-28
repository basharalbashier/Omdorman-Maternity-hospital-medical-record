import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UltrasoundHome extends StatefulWidget {
  const UltrasoundHome({super.key});

  @override
  State<UltrasoundHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<UltrasoundHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
          child: Text(
        'Ultrasound',
        style: kLoginTitleStyle(size, Colors.black),
      )),
    );
  }
}
