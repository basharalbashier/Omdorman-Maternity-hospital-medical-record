import 'dart:convert';

import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/models/am_or_pm_time.dart';
import 'package:aldayat_screens/models/make_request.dart';
import 'package:flutter/material.dart';
import '../models/user_hive.dart';
import 'package:aldayat_screens/widgets/waiting_widget.dart';

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
    i;
    contForVital.add(TextEditingController());
  }
  contForVital[0].text = amOrPm(DateTime.now().toString(), false);
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
                      setState(() => show = !show);

                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        final body = jsonEncode({
                          'time': contForVital[0].text,
                          'prus':
                              contForVital[1].text + "/" + contForVital[2].text,
                          'puls': contForVital[3].text,
                          'breath': contForVital[4].text,
                          'medic': contForVital[5].text,
                          'fluid': contForVital[6].text,
                          'note': contForVital[7].text,
                          "dr_id": user.user['id'].toString(),
                          "file_id": file['id'].toString(),
                          "patient_id": file['patient_id'].toString(),
                        });

                        var value = await makeHttpRequest(
                            url + "refresh/add", body, true, user);
                        if (value[1] == "Successfully sent") {
                          Navigator.of(context).pop();
                        } else {
                          setState(() => show = true);
                        }
                      } else {
                        setState(() => show = true);
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "سجل الإنعاش".toUpperCase(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: size.height / 8,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int i = 0;
                                      i < titlesForVital.length;
                                      i++)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: size.width / 1.2,
                                        child: Container(
                                          alignment: Alignment(0, 0),
                                          // color: Colors.green,
                                          child: TextFormField(
                                            style: kTextFormFieldStyle(),
                                            controller: contForVital[i],
                                            decoration: InputDecoration(
                                              // prefixIcon: Icon(Icons.person),
                                              label: Text(titlesForVital[i]),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                            ),
                                            validator: ((v) {
                                              if (v!.length < 1) {
                                                return "Is this an ${titlesForVital[i]}?";
                                              }
                                              return null;
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
                    ),
            );
          },
        ),
      );
    },
  );
}
