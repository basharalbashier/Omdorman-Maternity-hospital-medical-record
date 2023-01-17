import 'dart:convert';

import 'package:aldayat_screens/models/am_or_pm_time.dart';
import 'package:aldayat_screens/models/get_request.dart';
import 'package:aldayat_screens/models/replace_key.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../models/user_hive.dart';

labRequstDialog(Map request, contexte, size, User user) async {
  bool arabicOrEnglish = F;
  bool show = F;
  bool showAll = F;
  Map patientInfo = {};

  var why = [
    ['Specimen is received without a requistion', "وصول العينة بدون فورمة فحص"],
    ['Requistion is received without sample', "وصول طلب الفحص من غير العينة "],
    [
      'Requistion or specimen label lacks full patient\'s name',
      "وصول طلب الفحص او العينة لمريضين بنفس التعريف "
    ],
    [
      'Requistion or specimen label information\'s in not identical',
      "طلب الفحص غير مطابق للتعريف في العينة"
    ],
    [
      'Requistion or specimen label  information is illegible',
      "معلومات طلب الفحص او العينة غير منطقية"
    ],
    [
      'Requistion and/or specimen mislabeled (patient identifiers inaccurate)',
      "طلب الفحص او العينة غير مرقم او مرقم بالخطأ "
    ],
    [
      'Incorrect specimen container/tube are used',
      "إستخدام الحاوية الغير صحيحة "
    ],
    ['Date of collection is not recorded', "تاريخ أخذ العينة غير محدد "],
    ['Time of collection is not recorded', "زمن جمع العينات غير محدد"],
    ['Specimen is colotted', "العينة متجلطة"],
    ['Specimen is too old for testing', "العينة قديمة جداً"],
    ['Specimen continer is leaking', "حاوية العينة مفتوحة"],
    ['Specimen quantity is insufficient', "العينة غير كافية"],
    [
      'Specimen contamination, dilution or other interfering substances affect specimen integrity example haemolysed, lipemic.',
      "العينة ملوثة او مخففة -مأخوذة من يد بها درب- او اي عامل آخر متداخل مثل العينة المتكسرة والعينة الدهنية"
    ],
    ['Inappropriate specimen', "العينة غير مناسبة"],
    ['Duplicate test request', "تكرار طلب الفحص  قبل ظهور النتيجة الأولى"],
  ];
  var whyIsItRejected = '';
  List<MapEntry> singles = request.entries.map((e) => e).toList();

  if (request['patient_id'] == 'null') {
    print(request['patient_id']);
  } else {
    await getIt("patient", user, contexte, request['patient_id'])
        .then((value) => patientInfo = value[0]);
  }

  showAll = T;
  await showDialog<void>(
    barrierDismissible: F,
    context: contexte,
    builder: (BuildContext context) {
      return AlertDialog(
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            if (!showAll) {
              return Center(
                child: LinearProgressIndicator(
                  color: setUniColor("general"),
                  backgroundColor: Colors.white,
                ),
              );
            }
            return SizedBox(
              child: SizedBox(
                child: Container(
                  height: size.height,
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: request['patient_id'] != 'null',
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("Name :  ", style: fileTitle(size)),
                                  Text(patientInfo['name'].toString(),
                                      style: fileTitle(size)),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Age :  ", style: fileTitle(size)),
                                  Text(patientInfo['age'].toString(),
                                      style: fileTitle(size)),
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("ID :  ", style: fileTitle(size)),
                                Text(request['id'].toString(),
                                    style: fileTitle(size)),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Investigation  ", style: fileTitle(size)),
                                Divider(),
                                for (var i = 0; i < singles.length; i++)
                                  singles[i].value == "true"
                                      ? Column(
                                          children: [
                                            Container(
                                                child: Text(
                                              replacLabKey(singles[i].key),
                                              style: fileTitle(size),
                                            )),
                                          ],
                                        )
                                      : Container(),
                              ],
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("By :  ", style: fileTitle(size)),
                            Text(drName(request['dr_id']),
                                style: fileTitle(size)),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Message :  ", style: fileTitle(size)),
                            Text(request['comm'] ?? '', style: fileTitle(size)),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sent :  ", style: fileTitle(size)),
                            Text(amOrPm(request['created_at'], true),
                                style: fileTitle(size)),
                          ],
                        ),
                        Divider(),
                        Visibility(
                          visible: show,
                          child: Column(
                            // crossAxisAlignment: arabicOrEnglish?CrossAxisAlignment.end:CrossAxisAlignment.start,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  setState(
                                      () => arabicOrEnglish = !arabicOrEnglish);
                                },
                                color: Colors.blue,
                                child: Text(
                                  'A/ع',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              for (int i = 0; i < why.length; i++)
                                PopupMenuItem(
                                  value: i,
                                  // row with 2 children
                                  child: GestureDetector(
                                      onTap: (() async {
                                        setState(() {
                                          whyIsItRejected =
                                              "${why[i][0]}\n${why[i][1]}";
                                          showAll = F;
                                        });

                                        try {
                                          await http
                                              .post(
                                                  Uri.parse(url +
                                                      "lab/update/${request['id']}"),
                                                  headers: {
                                                    'Content-type':
                                                        'application/json',
                                                    'Accept':
                                                        'application/json',
                                                    'Authorization':
                                                        'Baerer ${user.token}'
                                                  },
                                                  body: jsonEncode({
                                                    "got_by_id": user
                                                        .user!['id']
                                                        .toString(),
                                                    "seen_at":
                                                        "${DateTime.now()}",
                                                    "status": "5",
                                                    "if_rejected_why":
                                                        whyIsItRejected
                                                  }))
                                              .then((value) {
                                            if (value.statusCode == 200 ||
                                                value.statusCode == 201) {
                                              Navigator.of(context).pop();
                                            }
                                          });
                                        } catch (e) {
                                          setState(() {
                                            showAll = F;
                                          });
                                        }
                                      }),
                                      child: Text(
                                        why[i][arabicOrEnglish ? 1 : 0],
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: arabicOrEnglish
                                            ? TextAlign.end
                                            : null,
                                      )),
                                ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                setState(() => show = !show);
                              },
                              color: Colors.red,
                              child: Text(
                                'Reject',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () async {
                                setState(() {
                                  showAll = F;
                                });

                                try {
                                  await http
                                      .post(
                                          Uri.parse(url +
                                              "lab/update/${request['id']}"),
                                          headers: {
                                            'Content-type': 'application/json',
                                            'Accept': 'application/json',
                                            'Authorization':
                                                'Baerer ${user.token}'
                                          },
                                          body: jsonEncode({
                                            "got_by_id":
                                                user.user!['id'].toString(),
                                            "seen_at": "${DateTime.now()}",
                                            "status": "1",
                                          }))
                                      .then((value) {
                                    if (value.statusCode == 200 ||
                                        value.statusCode == 201) {
                                      Navigator.of(context).pop();
                                    }
                                  });
                                } catch (e) {
                                  setState(() {
                                    showAll = F;
                                  });
                                }
                              },
                              color: Colors.green,
                              child: Text(
                                'Accept',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
