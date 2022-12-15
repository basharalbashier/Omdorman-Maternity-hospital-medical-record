import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InsuranseHome extends StatefulWidget {
  const InsuranseHome({super.key});

  @override
  State<InsuranseHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<InsuranseHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
          child: Text(
        'Insuranse',
        style: kLoginTitleStyle(size, Colors.black),
      )),
    );
  }
}
