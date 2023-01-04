import 'package:aldayat_screens/pages/vaginal_exam_button.dart';
import 'package:aldayat_screens/widgets/table_raw.dart';
import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';
import '../../models/user_hive.dart';

List<String> titles = [
  "Date",
  "Dilatation",
  "Position",
  'Effacement',
  'Consistency',
  'Position',
  'Station',
  'Caput',
  'Moulding',
  "Intact or Ruptured",
  "Time",
  'Amount',
  'Meconium',
  'HB',
  'Urine',
  'USS',
  'CTG',
  'Comment',
  'Dr Name'
];
List<String> topTitles = [
  "CX",
  "Presenting Part",
  'Membranes',
  'Investigations',
];
List<String> keys = [
  "created_at",
  "dil",
  "position_cx",
  "eff",
  "cons",
  "position",
  "station",
  "cap",
  "moul",
  "intact_rup",
  "time",
  "amount",
  "mec",
  "hb",
  "urine",
  "uss",
  "ctg",
  "comm",
  "dr_id",
];
Widget vaginalExamTable(List data, context, Map patient, Map file, User user) {
  return Column(
    children: [
      Visibility(
        // visible: user.user!['dep'] == 'Department of Obstetrics',
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              vaginalFindingButtonB(context, patient, file, user),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
        child: Table(
            border: TableBorder.all(width: 2, color: Colors.grey),
            columnWidths: <int, TableColumnWidth>{
              // 0: IntrinsicColumnWidth(),

              // 1: FlexColumnWidth(),
              // 9: FlexColumnWidth(3),
            },
            children: <TableRow>[
              TableRow(
                children: <Widget>[
                  for (var i in topTitles)
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          textAlign: TextAlign.center,
                          i,
                          // style: fileTitle(size),
                        )),
                      ),
                    ),
                ],
              ),
            ]),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Table(
          border: TableBorder.all(width: 2, color: Colors.grey),
          columnWidths: <int, TableColumnWidth>{
            // 0: IntrinsicColumnWidth(),

            // 1: FlexColumnWidth(),
            // 9: FlexColumnWidth(3),
          },
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                for (var i in titles)
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 32,
                      child: Center(
                          child: Text(
                        textAlign: TextAlign.center,
                        i,
                        // style: fileTitle(size),
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
