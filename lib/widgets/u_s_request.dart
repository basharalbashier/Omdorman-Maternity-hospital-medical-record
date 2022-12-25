import 'dart:convert';
import 'package:aldayat_screens/models/error_message.dart';
import 'package:aldayat_screens/models/make_request.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../constant.dart';
import '../models/user_hive.dart';

Widget uSRequest(contexte, size, Map file, User user, String type) {
  var remarksController = TextEditingController();
  var usOneController = TextEditingController();
  var usTwoController = TextEditingController();
  var usThreeController = TextEditingController();
  var usFourController = TextEditingController();

  var usFiveController = TextEditingController();
  var usSixController = TextEditingController();
  int number = 1;

  return MaterialButton(
      color: Colors.amber,
      child: Text(
        'U/S Request',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: (() async {
        await showDialog<void>(
          context: contexte,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return SizedBox(
                    width: size.width,
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ResponsiveGridRow(children: [
                              ResponsiveGridCol(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    alignment: Alignment(0, 0),
                                    // color: Colors.green,
                                    child: TextFormField(
                                      maxLines: 2,
                                      controller: remarksController,
                                      style: kTextFormFieldStyle(),
                                      decoration: const InputDecoration(
                                        // prefixIcon: Icon(Icons.person),
                                        label: Text('Remarks'),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                      ),
                                      // controller: nameController,
                                      // The validator receives the text that the user has entered.
                                    ),
                                  ),
                                ),
                              ),
                              ResponsiveGridCol(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Complaint of',
                                        style: kLoginTitleStyle(
                                            size, Colors.black),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            if (number < 6) {
                                              number++;
                                            }
                                          });
                                        },
                                        child: Text(
                                          'Add',
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              for (int i = 0; i < number; i++)
                                ResponsiveGridCol(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      alignment: Alignment(0, 0),
                                      // color: Colors.green,
                                      child: TextFormField(
                                        style: kTextFormFieldStyle(),
                                        controller: usOneController,
                                        decoration: InputDecoration(
                                          // prefixIcon: Icon(Icons.person),
                                          label: Text('${i + 1} /'),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                          ),
                                        ),
                                        // controller: nameController,
                                        // The validator receives the text that the user has entered.
                                      ),
                                    ),
                                  ),
                                ),
                            ]),
                            Row(
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
                                    final body = jsonEncode({
                                      'remarks': remarksController.text,
                                      'unit': user.user!['unit'].toString(),
                                      'us_one': usOneController.text,
                                      'us_two': usTwoController.text,
                                      'us_three': usThreeController.text,
                                      'us_four': usFourController.text,
                                      'us_five': usFiveController.text,
                                      'us_six': usSixController.text,
                                      'status': "0",
                                      "dr_id": user.user!['id'].toString(),
                                      "patient_id":
                                          file['patient_id'].toString(),
                                      "file_id": file['id'].toString(),
                                      'money': "free",
                                      'type': type,
                                    });
                                    var value = await makeHttpRequest(
                                        '${url}usrequest/add',
                                        body,
                                        true,
                                        user);
                                    if (value[1] == "Successfully sent") {
                                      errono(
                                          "Request sent successfully",
                                          "Request sent successfully",
                                          context,
                                          true,
                                          Container(),
                                          2);
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: Text(
                                    'Confirm',
                                    style: confirmStyle(size),
                                  ),
                                ),
                              ],
                            )
                          ]),
                    ),
                  );
                },
              ),
            );
          },
        );
      }));
}



// 
  
  