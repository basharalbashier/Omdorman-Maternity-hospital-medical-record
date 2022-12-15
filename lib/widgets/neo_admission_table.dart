import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';

List<String> titles = [
  "Name",
  "MR",
  'Source of Admission',
  'Cause of Admission',
  "Weight",
  "Lenght",
  "O F C",
  "Gestation",
  "Dates",
  "US",
  "Assessment",
  "General Exam",
  'Resp. system',
  'Cardiovascular',
  'Abdomen',
  'C N A',
  'Other',
  'Admission Diagnosis',
];

Widget neoAdmissionTable(List admissionList) {
  Size size = Size(500, 500);
  // if (unit.isNotEmpty) {
  //   for (int i = 0; i < unit[0].entries.toList().length; i++) {
  //     print(
  //         "$i  ${unit[0].entries.toList()[i].key} ${i < titles.length ? titles[i] : ''}");
  //   }
  // }
  // print(admissionList);
  return SingleChildScrollView(
    child: Column(
      children: [
        for (Map data in admissionList)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              border: TableBorder.all(width: 2, color: Colors.grey),
              columnWidths: const <int, TableColumnWidth>{
                0: IntrinsicColumnWidth(),
                1: FlexColumnWidth(),
              },
              children: <TableRow>[
                for (int i = 0; i < data.length - 6; i++)
                  TableRow(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 32,
                          child: Center(
                              child: Text(
                            titles[i],
                            textAlign: TextAlign.center,
                            style: fileTitle(size),
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 32,
                          child: Center(
                              child: Text(
                            data.entries.toList()[i + 1].value.toString(),
                            textAlign: TextAlign.center,
                            style: fileTitle(size),
                          )),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
      ],
    ),
  );
}
