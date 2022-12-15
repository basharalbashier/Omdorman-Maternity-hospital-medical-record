import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';
import '../pages/neo_unit.dart';

Widget neoUnitTable(List unit) {
  Size size = Size(500, 500);
  // if (unit.isNotEmpty) {
  //   for (int i = 0; i < unit[0].entries.toList().length; i++) {
  //     print(
  //         "$i  ${unit[0].entries.toList()[i].key} ${i < titles.length ? titles[i] : ''}");
  //   }
  // }
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            'Neonatal Unit',
            style: fileTitle(size),
          )),
        ),
        for (Map data in unit)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              border: TableBorder.all(width: 2, color: Colors.grey),
              columnWidths: const <int, TableColumnWidth>{
                0: IntrinsicColumnWidth(),
                1: FlexColumnWidth(),
              },
              children: <TableRow>[
                for (int i = 0; i < 11; i++)
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

                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          titles[12],
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
                          data.entries.toList()[14].value.toString(),
                          textAlign: TextAlign.center,
                          style: fileTitle(size),
                        )),
                      ),
                    ),
                  ],
                ),

                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          "Admitted to S.C.N",
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
                          data.entries.toList()[12].value.toString(),
                          textAlign: TextAlign.center,
                          style: fileTitle(size),
                        )),
                      ),
                    ),
                  ],
                ),

                for (int i = 13; i < 22; i++)
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
                            data.entries.toList()[i + 2].value.toString(),
                            textAlign: TextAlign.center,
                            style: fileTitle(size),
                          )),
                        ),
                      ),
                    ],
                  ),

                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          "Certain",
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
                          data.entries.toList()[24].value.toString(),
                          textAlign: TextAlign.center,
                          style: fileTitle(size),
                        )),
                      ),
                    ),
                  ],
                ),

                for (int i = 24; i < 30; i++)
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
                            data.entries.toList()[i + 2].value.toString(),
                            textAlign: TextAlign.center,
                            style: fileTitle(size),
                          )),
                        ),
                      ),
                    ],
                  ),

                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          "Fetal Distress",
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
                          data.entries.toList()[32].value.toString(),
                          textAlign: TextAlign.center,
                          style: fileTitle(size),
                        )),
                      ),
                    ),
                  ],
                ),

                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          "Cord",
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
                          data.entries.toList()[34].value.toString(),
                          textAlign: TextAlign.center,
                          style: fileTitle(size),
                        )),
                      ),
                    ),
                  ],
                ),

                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          titles[32],
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
                          data.entries.toList()[33].value.toString(),
                          textAlign: TextAlign.center,
                          style: fileTitle(size),
                        )),
                      ),
                    ),
                  ],
                ),

                for (int i = 33; i < 38; i++)
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
                            data.entries.toList()[i + 2].value.toString(),
                            textAlign: TextAlign.center,
                            style: fileTitle(size),
                          )),
                        ),
                      ),
                    ],
                  ),

                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          titles[38],
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
                          data.entries.toList()[42].value.toString(),
                          textAlign: TextAlign.center,
                          style: fileTitle(size),
                        )),
                      ),
                    ),
                  ],
                ),

                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          titles[39],
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
                          data.entries.toList()[43].value.toString(),
                          textAlign: TextAlign.center,
                          style: fileTitle(size),
                        )),
                      ),
                    ),
                  ],
                ),

                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          titles[40],
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
                          data.entries.toList()[44].value.toString(),
                          textAlign: TextAlign.center,
                          style: fileTitle(size),
                        )),
                      ),
                    ),
                  ],
                ),

                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          titles[41],
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
                          data.entries.toList()[45].value.toString(),
                          textAlign: TextAlign.center,
                          style: fileTitle(size),
                        )),
                      ),
                    ),
                  ],
                ),

                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          "Vitamin K given",
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
                          data.entries.toList()[40].value.toString(),
                          textAlign: TextAlign.center,
                          style: fileTitle(size),
                        )),
                      ),
                    ),
                  ],
                ),

                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          "Resusciation Necess",
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
                          data.entries.toList()[41].value.toString(),
                          textAlign: TextAlign.center,
                          style: fileTitle(size),
                        )),
                      ),
                    ),
                  ],
                ),

                for (int i = 46; i < 52; i++)
                  TableRow(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 32,
                          child: Center(
                              child: Text(
                            titles[i - 4],
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
                            data.entries.toList()[i].value.toString(),
                            textAlign: TextAlign.center,
                            style: fileTitle(size),
                          )),
                        ),
                      ),
                    ],
                  ),

                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          titles[49],
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
                          data.entries.toList()[52].value.toString(),
                          textAlign: TextAlign.center,
                          style: fileTitle(size),
                        )),
                      ),
                    ),
                  ],
                ),

                for (int i = 53; i < data.length - 5; i++)
                  TableRow(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 32,
                          child: Center(
                              child: Text(
                            titles[i - 3],
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
                            data.entries.toList()[i].value.toString(),
                            textAlign: TextAlign.center,
                            style: fileTitle(size),
                          )),
                        ),
                      ),
                    ],
                  ),

                //   keysOf[i]: example[i - 1],
                // 'vitamin_k_given': vitaminK ? "Yes " : 'No ',
                // 'res_necess': resu_necess ? "Yes " : 'No ',
                // for (int i = 41; i < 43; i++)
                //   keysOf[i]: example[i - 3],
                // for (int i = 43; i < 51; i++)
                //   keysOf[i]: example[i - 3],
                // for (int i = 51; i < 83; i++)
                //   keysOf[i]: example[i - 2],
                // 'dr_id': widget.user.user!['id'],
                // 'mother_id': widget.file['patient_id'],
                // 'file_id': widget.file['id']
              ],
            ),
          ),
      ],
    ),
  );
}
