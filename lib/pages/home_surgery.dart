import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';

class SurgeryHome extends StatefulWidget {
  const SurgeryHome({super.key});

  @override
  State<SurgeryHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<SurgeryHome> {
  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;

    return Scaffold(body: Center(child:Text('Surgery',style: kLoginTitleStyle(size, Colors.black),)),);
  }
}