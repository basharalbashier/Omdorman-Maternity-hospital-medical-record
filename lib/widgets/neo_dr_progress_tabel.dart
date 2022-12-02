import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/widgets/add_to_dr_porgress_dialog.dart';
import 'package:flutter/material.dart';

import '../models/add_for_table_model.dart';

Widget neoProgressTable(List data,context, file, user) {
  List<String> titles=["Date &Time", "Progress", "Dr. Name"];
  Size size=Size(500,500);
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
          addButtonModel("+",(()async=>addToDrProgressDialog(context, file, user, size))),
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
                    child: Center(child: Text(i['progress'])),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 32,
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
