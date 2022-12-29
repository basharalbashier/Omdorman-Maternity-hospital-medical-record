import 'package:aldayat_screens/widgets/table_raw.dart';
import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';
import '../models/user_hive.dart';

List<String> titles = [
  "Date & Time",
  "الساعة",
  "الضغط",
  "النبض",
  "التنفس",
  "الأدوية",
  "السوائل",
  "ملاحظات",
  'Dr Name'
];
List<String> keys = [
  "created_at",
  "time",
  "prus",
  "puls",
  "breath",
  "medic",
  "fluid",
  "note",
  'dr_id'
];
Widget refreshTable(List data, context, Map file, User user) {
  Size size = Size(500, 500);

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(width: 2, color: Colors.grey),
          columnWidths: <int, TableColumnWidth>{
            // 0: IntrinsicColumnWidth(),

            // 1: FlexColumnWidth(),
            2: FlexColumnWidth(3),
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
                        textAlign: TextAlign.center,
                        i,
                        style: fileTitle(size),
                      )),
                    ),
                  ),
              ],
            ),
            for (var row in data) makeTableRaw(row, keys)
          ],
        ),
      ),
    ],
  );
}
