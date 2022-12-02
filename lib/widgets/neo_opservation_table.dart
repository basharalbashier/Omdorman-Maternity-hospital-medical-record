import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/widgets/add_to_opservation_dialoge.dart';
import 'package:flutter/material.dart';

import '../models/add_for_table_model.dart';

Widget neoOpservationTable(List data, Size size, context, file, user) {
  List<String> titles = [
    "Date",
    "Time",
    "Temp",
    "R.R",
    "HR",
    "Wt.",
    "Oxygen\nSatoration",
    "Activity",
    "Urine",
    "Stool",
    "Remarks",
    "Sig."
  ];
  double height = 32;
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            addButtonModel("+",
                (() async => addToOpservationDialoge(context, file, user))),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(width: 2, color: Colors.grey),
          columnWidths: <int, TableColumnWidth>{},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              // decoration: BoxDecoration(color: Colors.lime),
              children: <Widget>[
                for (var i in titles)
                  Center(
                    child: Container(
                      // color: Colors.orangeAccent,

                      child: Center(
                          child: Text(
                        i,
                        style: TextStyle(
                            color: Colors.blueGrey.shade900,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
              ],
            ),
            for (var i in data)
              TableRow(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height,
                      child: Center(
                          child: Text(
                              i['created_at'].toString().substring(0, 11))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height,
                      child: Center(
                          child: Text(
                              i['created_at'].toString().substring(11, 19))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height,
                      child: Center(child: Text(i['temp'])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height,
                      child: Center(child: Text(i['r_r'])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height,
                      child: Center(child: Text(i['hr'])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height,
                      child: Center(child: Text(i['wt'])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height,
                      child: Center(child: Text(i['oxygen'])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height,
                      child: Center(child: Text(i['activity'])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height,
                      child: Center(child: Text(i['urine'])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height,
                      child: Center(child: Text(i['stool']??'')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height,
                      child: Center(child: Text(i['remarks'])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height,
                      child: Center(child: Text(i['dr_id'])),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    ],
  );
}
