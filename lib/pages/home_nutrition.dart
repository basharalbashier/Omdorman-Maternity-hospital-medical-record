import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NutritioneHome extends StatefulWidget {
  const NutritioneHome({super.key});

  @override
  State<NutritioneHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<NutritioneHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
          child: Text(
        'Nutrition',
        style: kLoginTitleStyle(size, Colors.black),
      )),
    );
  }
}
