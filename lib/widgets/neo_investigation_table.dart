import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';

import '../models/add_for_table_model.dart';

import 'dart:convert';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../main.dart';
import '../models/user_hive.dart';

Widget neoInvestgationAndResultTable(List data,context, file, user,) {
  List<String> titles=["Date & Time", "Investigation", "Result"];
  Size size=Size(500,500);
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
          addButtonModel("+",(()async=>addToInvDialog(context, file, user, size))),
        ],),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(width: 2,color: Colors.grey),
          
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: FlexColumnWidth(),
         
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
                    child: Center(child: Text(i['inv'])),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 32,
                    child: Center(child: Text(i['result'])),
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



Future <void> addToInvDialog(contexte, Map file, User user, size,)async{
    var invController = TextEditingController();
        var resultController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool show = true;
    return await showDialog<void>(
          context: contexte,
          barrierDismissible: false,
          builder: (BuildContext context) {
            
            return AlertDialog(
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  
                  Widget submit(size, file, User user) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          color: Colors.pink,
                          onPressed: () async {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancel',
                            style: confirmStyle(size),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.teal,
                          onPressed: () async {
                          
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                             setState(()=>show=!show);
                            final body = jsonEncode({
                              'inv': invController.text,
                               'result': resultController.text,
                              "dr_id": user.user!['id'].toString(),
                              "file_id": file['id'].toString(),
                                    "mother_id": file['patient_id'].toString(),
                            });
                            try {
                              await http
                                  .post(Uri.parse('${url}neoinv/add'),
                                      headers: {
                                        'Content-type': 'application/json',
                                        'Accept': 'application/json',
                                        'Authorization': 'Bearer ${user.token!}'
                                      },
                                      body: body)
                                  .then((value) {
                           if(value.statusCode==200||value.statusCode ==201){
                             Navigator.of(context).pop();
                           }else{
                            print(value.body);
                             setState(()=>show=!show);
                           }
                              });
                            } catch (e) {
                              setState(()=>show=!show);
                            }
                            }
                          },
                          child: Text(
                            'Confirm',
                            style: confirmStyle(size),
                          ),
                        ),
                      ],
                    );
                  }

                  return SizedBox(
                    width: size.width,
                    child: !show?waitingWidget("3"):SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Complete these fields please!',
                                style: fileTitle(size),
                              ),
                            ),
                           
                            ResponsiveGridRow(children: [
                              ResponsiveGridCol(
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                       Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          alignment: Alignment(0, 0),
                                          // color: Colors.green,
                                          child: TextFormField(
                                          
                                            style: kTextFormFieldStyle(),
                                            controller: invController,
                                            decoration: const InputDecoration(
                                              // prefixIcon: Icon(Icons.person),
                                              label: Text('Investigation'),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                            ),
                                           validator: ((v){
                                            if(v!.length<1){
                                              return "Is this an Investigation?";
                                            }
                                           }),
                                          ),
                                        ),
                                      ),
                                    
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          alignment: Alignment(0, 0),
                                          // color: Colors.green,
                                          child: TextFormField(
                                            maxLines: 5,
                                            style: kTextFormFieldStyle(),
                                            controller: resultController,
                                            decoration: const InputDecoration(
                                              // prefixIcon: Icon(Icons.person),
                                              label: Text('Result'),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                            ),
                                           validator: ((v){
                                            if(v!.length<5){
                                              return "Is this a Result?";
                                            }
                                             return "Is this a Result?";
                                           }),
                                          ),
                                        ),
                                      ),
                                    
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(
                              height: size.height / 8,
                            ),
                            submit(size, file, user)
                          ]),
                    ),
                  );
                },
              ),
            );
          },
        );
     
}