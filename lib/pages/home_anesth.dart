import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnaesthiayHome extends StatefulWidget {
  const AnaesthiayHome({super.key});

  @override
  State<AnaesthiayHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<AnaesthiayHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
          child: Text(
        'Anaesthia',
        style: kLoginTitleStyle(size, Colors.black),
      )),
    );
  }
}
