import 'dart:convert';

import 'package:aldayat_screens/models/error_message.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../main.dart';
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
  var controllers = [
    usOneController,
    usTwoController,
    usThreeController,
    usFourController,
    usFiveController,
    usSixController
  ];
  Widget submit(size, file, User user, String type, context) {
    return Padding(
      padding: const EdgeInsets.only(left: 80.0, right: 80, bottom: 80),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          style: ButtonStyle(
            // backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
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
              "patient_id": file['patient_id'].toString(),
              "file_id": file['id'].toString(),
              'money': "free",
              'type': type,
            });
            try {
              await http
                  .post(Uri.parse('${url}usrequest/add'),
                      headers: {
                        'Content-type': 'application/json',
                        'Accept': 'application/json',
                        'Authorization': 'Bearer ${user.token!}'
                      },
                      body: body)
                  .then((value) {
                if (value.statusCode == 200 || value.statusCode == 201) {
                  errono(
                      "Request sent successfully",
                      "Request sent successfully",
                      context,
                      true,
                      Container(),
                      2);
                  Navigator.of(context).pop();
                }
              });
            } catch (e) {
              errono("Connection Error", "Connection Error", context, true,
                  Container(), 2);
            }
          },
          child: Text(
            'Confirm',
            style: confirmStyle(size),
          ),
        ),
      ),
    );
  }

  return MaterialButton(
      color: Colors.amber,
      child: Text('U/S Request'),
      onPressed: (() async {
        await showDialog<void>(
          context: contexte,
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
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: PopupMenuButton<int>(
                            //       itemBuilder: (context) => [
                            //             for (int i = 0; i < forHow.length; i++)
                            //               PopupMenuItem(
                            //                 value: i,
                            //                 // row with 2 children
                            //                 child: Row(
                            //                   children: [
                            //                     const SizedBox(
                            //                       width: 10,
                            //                     ),
                            //                     Text(
                            //                       forHow[i],
                            //                     )
                            //                   ],
                            //                 ),
                            //               ),
                            //           ],
                            //       offset: const Offset(0, 100),
                            //       elevation: 2,
                            //       // on selected we show the dialog box
                            //       onSelected: (value) {
                            //         // if value 1 show dialog
                            //         setState(() {
                            //           whichforHow = forHow[value];
                            //         });
                            //       },
                            //       child: Row(
                            //         children: [
                            //           Text(
                            //               whichforHow == ''
                            //                   ? 'For'
                            //                   : whichforHow,
                            //               style: insuranceStyle(size)),
                            //           const Icon(Icons.arrow_drop_down)
                            //         ],
                            //       )),
                            // ),

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
                            submit(size, file, user, type, context)
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
  
  