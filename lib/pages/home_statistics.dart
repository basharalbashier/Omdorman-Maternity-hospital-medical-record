import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StatisticsHome extends StatefulWidget {
  const StatisticsHome({super.key});

  @override
  State<StatisticsHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<StatisticsHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
          child: Text(
        'Statistics Home',
        style: kLoginTitleStyle(size, Colors.black),
      )),
    );
  }
}
