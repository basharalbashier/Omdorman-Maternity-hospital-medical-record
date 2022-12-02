import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';

import '../models/add_for_table_model.dart';
import 'add_to_problem_list.dart';

Widget neoProblemListTable(List data,context, file, user) {
  List<String> titles = ["Date & Time", "Problem", "Comment"];
  Size size = Size(500, 500);
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
          addButtonModel("+",(()async=>addToProblemListDialog(context, file, user, size))),
        ],),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(width: 2, color: Colors.grey),
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
          },
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                for (var i in titles)
                  Container(
                    height: 32,
                    child: Center(
                        child: Text(
                      i,
                      style: fileTitle(size),
                    )),
                  ),
              ],
            ),
            for (var i in data)
              TableRow(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 32,
                      child: Center(
                          child: Column(
                        children: [
                          Text(i['created_at'].toString().substring(11, 19)),
                          Text(i['created_at'].toString().substring(0, 11)),
                        ],
                      )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // height: 32,
                      child: Center(child: Text(i['problem'])),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 32,
                      child: Center(child: Text(i['comment'])),
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
