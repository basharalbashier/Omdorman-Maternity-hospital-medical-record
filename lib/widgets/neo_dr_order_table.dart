import 'dart:convert';

import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/widgets/neo_add_order_button.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../models/add_for_table_model.dart';
import '../models/user_hive.dart';

Widget neoDoctorOrderTable(List data,context,Map file,User user) {
  List<String> titles=["Date & Time ", "Order", "Dr. Name"];
  Size size=Size(500,500);

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
          addButtonModel("+",(()async=>addOrder(context, file, user, size))),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
             
                    height: 32,
                    child: Center(child: Text(textAlign:TextAlign.center,i,style: fileTitle(size),)),
                  ),
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
                         Text(textAlign:TextAlign.center,i['created_at'].toString().substring(11,19)),
                        Text(textAlign:TextAlign.center,i['created_at'].toString().substring(0,11)),
                            
                      ],
                    )),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // height: 32,
                    child: Center(child: Text(i['order'],textAlign:TextAlign.center,)),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 32,
                    child: Center(child: Text(i['dr_id'],textAlign:TextAlign.center,)),
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

