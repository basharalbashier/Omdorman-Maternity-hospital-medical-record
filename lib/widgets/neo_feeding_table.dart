import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/widgets/add_to_feeding_dialog.dart';
import 'package:flutter/material.dart';

import '../models/add_for_table_model.dart';

Widget neoFeedingAndMedication(List data, Size size,context, file, user) {
  List<String> titles = [
    "Date\n&\nTime",
    "Feeding",
    "Residual",
    "Fluid",
    "Medication",
    "Sig."
  ];

  double height = 32;
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
          addButtonModel("+",(()async=>addToFeedingDialog(context, file, user))),
        ],),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(width: 2, color: Colors.blueGrey),
          columnWidths: <int, TableColumnWidth>{},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
           
              children: <Widget>[
                for (var i in titles)
                  Center(
                    child: Container(
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
                      child: Column(
                        children: [
                          Center(
                              child:
                                  Text(i['created_at'].toString().substring(11, 19))),
                          Center(
                              child:
                                  Text(i['created_at'].toString().substring(0, 11))),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height,
                      child: Center(child: Text(i['feeding'])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height,
                      child: Center(child: Text(i['residual'])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height,
                      child: Center(child: Text(i['fluid'])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height,
                      child: Center(child: Text(i['medication'])),
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
