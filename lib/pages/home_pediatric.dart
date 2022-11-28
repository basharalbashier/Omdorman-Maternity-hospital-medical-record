import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PediatricHome extends StatefulWidget {
  const PediatricHome({super.key});

  @override
  State<PediatricHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<PediatricHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
          child: Text(
        'Pediatric',
        style: kLoginTitleStyle(size, Colors.black),
      )),
    );
  }
}
