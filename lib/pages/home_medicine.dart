import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';

class MedicineHome extends StatefulWidget {
  const MedicineHome({super.key});

  @override
  State<MedicineHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<MedicineHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
          child: Text(
        'Medicine',
        style: kLoginTitleStyle(size, Colors.black),
      )),
    );
  }
}
