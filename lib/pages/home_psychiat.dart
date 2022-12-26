import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';

class PsychiatrcsHome extends StatefulWidget {
  const PsychiatrcsHome({super.key});

  @override
  State<PsychiatrcsHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<PsychiatrcsHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
          child: Text(
        'Psychiatrcs',
        style: kLoginTitleStyle(size, Colors.black),
      )),
    );
  }
}
