import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../constant.dart';

class NurseProgess extends StatefulWidget {
  const NurseProgess({super.key});

  @override
  State<NurseProgess> createState() => _VaginalExamState();
}

class _VaginalExamState extends State<NurseProgess> {
  Size? size;
  var postion = TextEditingController();
  var effacement = TextEditingController();



  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
                

                Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Nurse Progress Note',
                  style: kLoginTitleStyle(size! /1.5, Colors.black),
                ),
              ),
            ),
            Divider(),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // decoration:
                    // BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: ResponsiveGridRow(children: [
                  textFi("Patient Condition", postion, true),
                  textFi("Remarks", effacement, true),
           
    
                ]),
              ),
            ),
         
          ],

        ),
      ),
    );
  }

  ResponsiveGridCol textFi(
      String title, TextEditingController controller, bool visable) {
    return ResponsiveGridCol(

      child: Container(
        height: 100,
        alignment: Alignment(0, 0),
        // color: Colors.purple,

        child: Visibility(
          visible: visable,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
           maxLines: 5,
              controller: controller,
              style: kTextFormFieldStyle(),
              decoration: InputDecoration(
                label: Text(title),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              // controller: nameController,
              // The validator receives the text that the user has entered.
            ),
          ),
        ),
      ),
    );
  }
}
