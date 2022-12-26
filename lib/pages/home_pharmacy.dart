import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';

class PharmacyHome extends StatefulWidget {
  const PharmacyHome({super.key});

  @override
  State<PharmacyHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<PharmacyHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
          child: Text(
        'Pharmacy',
        style: kLoginTitleStyle(size, Colors.black),
      )),
    );
  }
}
