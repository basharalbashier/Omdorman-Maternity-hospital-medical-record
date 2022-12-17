import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../main.dart';
import '../models/user_hive.dart';

import '../models/add_for_table_model.dart';
import '../pages/icu_follow_up.dart';

Widget icuFollowUpTable(List data, context,Map patient,Map file, user) {
  List<String> titles = [
    'Initial diagnosis',
    'ICU diagnosis',
    "Problem",
    "Problem",
    "Problem",
    "Problem",
    'Brief History:',
    'Recent Event in 24 hours:',
    'Nervous system:',
    'PUPILS: EQUAl: Y',
    'E:',
    "N:",
    "REACTIVE: Y:",
    "N:",
    "Sedative drugs",
    "Analgesia",
    "Paraytics",
    "Anticonvulsant",
    "Sedation Score",
    "CT",
    "MRI",
    'Cardiovascular system:',
    'PULSE:',
    'BP:',
    'MAP:',
    "Vassopressor",
    "inotropes",
    "ecg/echo",
    'Chest Examination:',
    'On mv:',
    'Oxygenation',
    'Ventilation',
    'Dynamics',
    'Weaning Parameters',
    'Infectious Diseases',
    'Fever Pattern:',
    'Positive culture site:'
        'Organism:',
    'Sensitive to:',
    'Central line\nSITE and days:',
    'catheter days:',
    'drains:',
    'ETT',
    'Renal Electrolytes, Fluid Metabolic:'
        'Health Maintenance',
    'Plan of management:'
        "FIO2",
    "PEEP",
    "MAP",
    "PO2"
        "Mode",
    "VT",
    "RR",
    "O2 sat%",
    "PIP",
    "Plateau",
    "Resistance",
    "Compliance",
    "RSBI"
        "NIF",
    "Stress ulcer bleeding prophylaxis",
    "Feeding",
    "DVT prophylaxis"
        "Activity/PT/OT",
    "Na",
    "K",
    "Mg",
    "CI",
    "Bicarb",
    "PO4",
    "BUN",
    "Cr",
    "AVG hourly UOP",
    "24 hour intake",
    "24 hour output",
    "Fluid Balance",
    'GCS',
    'E:',
    "V:",
    "M:",
    '=/15',
    'Git : aBdominal exam',
    'Obst.examination: ',
    'U/S',
    'Fetal heart sounds/CTG'
        'Surgical drains:',
    'Pulmonary:',
    'Spont breathing with O2:',
    'Without O2:',
    'RR:',
    'SPO2:'
  ];

  Size size = Size(500, 500);
  return ListView(
    scrollDirection: Axis.horizontal,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                addButtonModel("+",
                    (() async => addToIcuFollowup(context,patient ,file, user, size))),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        width: size.width * 20,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            border: TableBorder.all(width: 2, color: Colors.grey),
            columnWidths: const <int, TableColumnWidth>{
              // 0: IntrinsicColumnWidth(),
              // 1: FlexColumnWidth(),
              // 2: IntrinsicColumnWidth(),
            },
            children: <TableRow>[
              TableRow(
                children: <Widget>[
                  for (var i in titles)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          i,
                          // style: fileTitle(size),
                        )),
                      ),
                    ),
                ],
              ),
              // for (var i in data)
              //   TableRow(
              //     children: <Widget>[
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           height: 32,
              //           child: Center(
              //               child: Column(
              //             children: [
              //               Text(i['created_at'].toString().substring(11, 19)),
              //               Text(i['created_at'].toString().substring(0, 11)),
              //             ],
              //           )),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           // height: 32,
              //           child: Center(child: Text(i['note'])),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Container(
              //           height: 32,
              //           child: Center(child: Text(i['nurse_id'])),
              //         ),
              //       ),
              //     ],
              //   ),

              // TableRow(
              //   children: <Widget>[
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Container(
              //         height: 32,
              //         child: Text("POSTURE"),
              //       ),
              //     ),
              //   ],
              // ),
              // TableRow(
              //   children: <Widget>[
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Container(
              //         height: 32,
              //         child: Text(
              //           "SQUARE WINDOW\n(Wrist)",
              //           textAlign: TextAlign.center,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // TableRow(
              //   children: <Widget>[
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Container(
              //         height: 32,
              //         child: Text("ARM RECOIL"),
              //       ),
              //     ),
              //   ],
              // ),
              // TableRow(
              //   children: <Widget>[
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Container(
              //         height: 32,
              //         child: Text("POPLITEAL ANGLE"),
              //       ),
              //     ),
              //   ],
              // ),
              // TableRow(
              //   children: <Widget>[],
              // ),
              // TableRow(
              //   children: <Widget>[
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Container(
              //         height: 32,
              //         child: Text("HEEL TO EAR"),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    ],
  );
}

Future<void> addToIcuFollowup(
  contexte,
  Map patient,
  Map file,
  User user,
  size,
) async {
     Navigator.pushAndRemoveUntil(
      contexte,
      MaterialPageRoute(
          builder: (context) => IcuFollow(
            file: file,
            patient: patient,
                user: user,
              )),
      (Route<dynamic> route) => false,
    );
}
