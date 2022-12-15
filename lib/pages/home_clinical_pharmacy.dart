import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ClinicalHome extends StatefulWidget {
  const ClinicalHome({super.key});

  @override
  State<ClinicalHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<ClinicalHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
          child: Text(
        'Clinical',
        style: kLoginTitleStyle(size, Colors.black),
      )),
    );
  }
}
