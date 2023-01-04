import 'package:aldayat_screens/models/replace_key.dart';
import 'package:aldayat_screens/widgets/table_raw.dart';
import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';
import '../models/user_hive.dart';
import '../widgets/move_to_lab_button.dart';

List<String> titles = ["Date & Time", "Investigation", "Result", 'Dr Name'];
List<String> keys = ["created_at", "inv", "result", 'dr_id'];
Widget fileInvestigationTable(List dataFromServe, context, Map file, User user,
    Map patient, String type) {
  Size size = Size(500, 500);
  List data = [];
  for (int i = 0; i < dataFromServe.length; i++) {
    //taking the false out
    dataFromServe[i].removeWhere((key, value) => value == 'false');

    List allinv = [];
    for (MapEntry m in dataFromServe[i]
        .entries
        .where((element) => element.value == "true")) {
      allinv.add(replacLabKey(m.key));
    }

    String item = allinv
        .toString()
        .replaceAll("[", '')
        .replaceAll("]", '')
        .replaceAll(",", "\n");
    dataFromServe[i]['inv'] = item;
    data.add(dataFromServe[i]);
  }
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            labButton(context, patient, file, type),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(width: 2, color: Colors.grey),
          columnWidths: <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: IntrinsicColumnWidth(),
            3: IntrinsicColumnWidth(),
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
