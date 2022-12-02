import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/widgets/add_to_nurse_note_dialog.dart';
import 'package:flutter/material.dart';

import '../models/add_for_table_model.dart';

Widget neoNurseNoteTable(List data,context, file, user) {
  List<String> titles=["Date &Time", "Note", "Sign"];
  Size size=Size(500,500);
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
          addButtonModel("+",(()async=>addToNurseDialog(context, file, user, size))),
        ],),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(width: 2,color: Colors.grey),
          
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: IntrinsicColumnWidth(),
         
          },
        
          
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                for(var i in titles)
                Container(
               
                  height: 32,
                  child: Center(child: Text(i,style: fileTitle(size),)),
                ),
              
              ],
            ),
            for(var i in data)
             TableRow(
              children: <Widget>[
        
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 32,
                    child: Center(child: Column(
                      children: [
                         Text(i['created_at'].toString().substring(11,19)),
                        Text(i['created_at'].toString().substring(0,11)),
                            
                      ],
                    )),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // height: 32,
                    child: Center(child: Text(i['note'])),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 32,
                    child: Center(child: Text(i['nurse_id'])),
                  ),
                ),
              
              ],
            ),
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
    ],
  );
}
