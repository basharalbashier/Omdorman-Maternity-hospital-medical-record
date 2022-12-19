import 'dart:convert';

import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../models/add_for_table_model.dart';
import '../models/user_hive.dart';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;

MaterialButton addAnaethRescuationRecordButton(
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
          "Add Rescuation Record".toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      )));
}

Future<void> addAnaethSign(
    contexte, Map patient, Map file, User user, size) async {
  List<String> titlesForVital = [
    'الساعة',
    "الضغط",
    "على",
    "النبض",
    "التنفس R/R",
    "العقاقير",
    "السوائل",
    "سجل الملاحضات الأتية إذا وجدت تقيأ،إستنشق إعياء،يشعر بألم،إستجاب للمخاطبة ، قلق عادي،تشنج،توقف النبض،توقف التنفس،إستجاب للألم"
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
                          // 'order': orderController.text,
                          //   'progress': orderController.text,
                          "dr_id": user.user!['id'].toString(),
                          "file_id": file['id'].toString(),
                          "mother_id": file['patient_id'].toString(),
                        });
                        try {
                          await http
                              .post(Uri.parse('${url}neodoctor/add'),
                                  headers: {
                                    'Content-type': 'application/json',
                                    'Accept': 'application/json',
                                    'Authorization': 'Bearer ${user.token!}'
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
                                "سجل الإنعاش".toUpperCase(),
                                style: fileTitle(size),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 8,
                            ),
                           Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            for (int i = 0; i < titlesForVital.length; i++)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  width: size.width / 1.2,
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
