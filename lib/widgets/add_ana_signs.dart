import 'dart:convert';

import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../models/add_for_table_model.dart';
import '../models/error_message.dart';
import '../models/make_request.dart';
import '../models/user_hive.dart';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;

MaterialButton addAnaethSignButton(
    contexte, Map patient, Map file, User user, size) {
  return MaterialButton(
      onPressed: (() async => addAnaethSign(
            contexte,
            patient,
            file,
            user,
            size,
          )),
      color: Colors.deepOrangeAccent,
      child: SizedBox(
          // height: 30,
          child: Center(
        child: Text(
          "Add vital signs".toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      )));
}

Future<void> addAnaethSign(
    contexte, Map patient, Map file, User user, size) async {
  List<String> titlesForVital = [
    'Temp',
    "Pulse",
    "BP",
    "/",
    'Breath',
    'other',
    'Comment'
  ];
  List<TextEditingController> contForVital = [];
  for (var i in titlesForVital) {
    contForVital.add(TextEditingController());
  }
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
                          'temp': contForVital[0].text,
                          'puls': contForVital[1].text,
                          'bp':
                              " ${contForVital[2].text} /${contForVital[3].text}",
                          'breath': contForVital[4].text,
                          'other': contForVital[5].text,
                          'comment': contForVital[6].text,
                          "dr_id": user.user!['id'].toString(),
                          "file_id": file['id'].toString(),
                          "patient_id": file['patient_id'].toString(),
                        });
                        // String root =
                        //     "${isFirst ? 'beforana' : isSecond ? 'whileana' : 'afterana'}";
                        String respons = await makeHttpRequest(
                            url + "icuvital/add",
                            body,
                            true,
                            User({}, 'token'));

                        if (respons == "Successfully Sent") {
                          Navigator.of(context).pop();
                          errono("Successfully Sent", "Successfully Sent",
                              context, true, Container(), 3);
                        } else {
                          errono(
                              respons, respons, context, true, Container(), 3);

                          setState(() {
                            show = !show;
                          });
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
                                "Add vital signs".toUpperCase(),
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            for (int i = 0; i < 2; i++)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  width: size.width / 4.2,
                                                  child: Container(
                                                    alignment: Alignment(0, 0),
                                                    // color: Colors.green,
                                                    child: TextFormField(
                                                      style:
                                                          kTextFormFieldStyle(),
                                                      controller:
                                                          contForVital[i],
                                                      decoration:
                                                          InputDecoration(
                                                        // prefixIcon: Icon(Icons.person),
                                                        label: Text(
                                                            titlesForVital[i]),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15)),
                                                        ),
                                                      ),
                                                      validator: ((v) {
                                                        if (v!.length < 1) {
                                                          return "Is this an ${titlesForVital[i]}?";
                                                        }
                                                      }),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            for (int i = 2; i < 4; i++)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  width: size.width / 4.2,
                                                  child: Container(
                                                    alignment: Alignment(0, 0),
                                                    // color: Colors.green,
                                                    child: TextFormField(
                                                      style:
                                                          kTextFormFieldStyle(),
                                                      controller:
                                                          contForVital[i],
                                                      decoration:
                                                          InputDecoration(
                                                        // prefixIcon: Icon(Icons.person),
                                                        label: Text(
                                                            titlesForVital[i]),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15)),
                                                        ),
                                                      ),
                                                      validator: ((v) {
                                                        if (v!.length < 1) {
                                                          return "Is this an ${titlesForVital[i]}?";
                                                        }
                                                      }),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            for (int i = 4; i < 6; i++)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  width: size.width / 4.2,
                                                  child: Container(
                                                    alignment: Alignment(0, 0),
                                                    // color: Colors.green,
                                                    child: TextFormField(
                                                      style:
                                                          kTextFormFieldStyle(),
                                                      controller:
                                                          contForVital[i],
                                                      decoration:
                                                          InputDecoration(
                                                        // prefixIcon: Icon(Icons.person),
                                                        label: Text(
                                                            titlesForVital[i]),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          15)),
                                                        ),
                                                      ),
                                                      validator: ((v) {
                                                        if (v!.length < 0) {
                                                          return "Is this an ${titlesForVital[i]}?";
                                                        }
                                                      }),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: size.width / 4.2,
                                            child: Container(
                                              alignment: Alignment(0, 0),
                                              // color: Colors.green,
                                              child: TextFormField(
                                                maxLines: 3,
                                                style: kTextFormFieldStyle(),
                                                controller: contForVital[6],
                                                decoration: InputDecoration(
                                                  // prefixIcon: Icon(Icons.person),
                                                  label:
                                                      Text(titlesForVital[6]),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15)),
                                                  ),
                                                ),
                                                validator: ((v) {
                                                  if (v!.length < 0) {
                                                    return "Is this an ${titlesForVital[6]}?";
                                                  }
                                                }),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
