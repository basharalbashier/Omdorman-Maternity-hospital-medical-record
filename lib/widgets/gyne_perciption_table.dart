import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../models/add_for_table_model.dart';
import '../models/user_hive.dart';

Widget gynePerciptionTable(List data,context,Map file,User user) {
  List<String> titles=["Start Date","End Date", "Name Of Drug - Dose & Route", "Dr. Name"];
  Size size=Size(500,500);

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
          addButtonModel("+",(()async=>addgynePerciptionTable(context, file, user, size))),
        ],),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(width: 2,color: Colors.grey),
          
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: IntrinsicColumnWidth(),
            2: FlexColumnWidth(),
            3: IntrinsicColumnWidth(),
         
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
                    child: Center(child: Text(i['start']??'',textAlign:TextAlign.center,)),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // height: 32,
                    child: Center(child: Text(i['end']??'',textAlign:TextAlign.center,)),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // height: 32,
                    child: Center(child: Text(i['name_drug']??'',textAlign:TextAlign.center,)),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 32,
                    child: Center(child: Text(i['dr_name']??'',textAlign:TextAlign.center,)),
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


Future<void> addgynePerciptionTable(
  contexte,
  Map file,
  User user,
  size,
) async {
  var stCont = TextEditingController();
  var endController = TextEditingController();
    var druCont = TextEditingController();
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
                        setState(() => show = !show);
                        final body = jsonEncode({
                          'start': stCont.text,
                          'end': endController.text,
                             'name_drug': druCont.text,
                          "dr_id": user.user['id'].toString(),
                          "file_id": file['id'].toString(),
                          "patient_id": file['patient_id'].toString(),
                        });
                        try {
                          await http
                              .post(Uri.parse('${url}gyndrug/add'),
                                  headers: {
                                    'Content-type': 'application/json',
                                    'Accept': 'application/json',
                                    'Authorization': 'Bearer ${user.token}'
                                  },
                                  body: body)
                              .then((value) {
                            if (value.statusCode == 200 ||
                                value.statusCode == 201) {
                              Navigator.of(context).pop();
                            } else {
                              print(value.body);
                              setState(() => show = !show);
                            }
                          });
                        } catch (e) {
                          setState(() => show = !show);
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
              child: !show
                  ? waitingWidget("3")
                  : SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Fill these fields please !',
                                style: fileTitle(size),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 8,
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
                                            controller: stCont,
                                            decoration: const InputDecoration(
                                              // prefixIcon: Icon(Icons.person),
                                              label: Text('Start'),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                            ),
                                            validator: ((v) {
                                              if (v!.length < 5) {
                                                return "Is this a Start?";
                                              }
                                              return null;
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
                                            style: kTextFormFieldStyle(),
                                            controller: endController,
                                            decoration: const InputDecoration(
                                              // prefixIcon: Icon(Icons.person),
                                              label: Text('End'),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                            ),
                                            validator: ((v) {
                                              if (v!.length < 5) {
                                                return "Is this an End?";
                                              }
                                              return null;
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
                                            controller: druCont,
                                            decoration: const InputDecoration(
                                              // prefixIcon: Icon(Icons.person),
                                              label: Text('Name Of Drug - Dose & Route'),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                            ),
                                            validator: ((v) {
                                              if (v!.length < 5) {
                                                return "Is this a Drug?";
                                              }
                                              return null;
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

