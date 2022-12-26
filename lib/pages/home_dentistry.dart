import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';

class DentistryHome extends StatefulWidget {
  const DentistryHome({super.key});

  @override
  State<DentistryHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<DentistryHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
          child: Text(
        'Dentistry',
        style: kLoginTitleStyle(size, Colors.black),
      )),
    );
  }
}
