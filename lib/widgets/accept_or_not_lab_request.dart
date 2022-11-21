import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../constant.dart';

Widget labRequstDialog(contexte, size) {
  bool arabicOrEnglish = F;
    bool show = F;
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
  return MaterialButton(
      color: Colors.amber,
      child: Text('check'),
      onPressed: (() async {
        await showDialog<void>(
          context: contexte,
          builder: (BuildContext context) {
            return AlertDialog(
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return SizedBox(
                    child: SizedBox(
                      child: Container(
                        height: size.height,
                        width: size.width,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  MaterialButton(
                                    onPressed: () {
                                      setState(() => show=!show);
                                    },
                                    color: Colors.red,
                                    child: Text(
                                      'Reject',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () {},
                                    color: Colors.green,
                                    child: Text(
                                      'Accept',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                             Visibility(visible: show,
                               child: Column(
                                // crossAxisAlignment: arabicOrEnglish?CrossAxisAlignment.end:CrossAxisAlignment.start,
                                children: [
                                MaterialButton(
                                    onPressed: () {setState(() => arabicOrEnglish=!arabicOrEnglish);},
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
                                      onTap: (() => setState(() => whyIsItRejected="${why[i][0]}\n${why[i][1]}",)),
                                      child: SizedBox(
                                   
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(why[i][arabicOrEnglish ? 1 : 0])
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                               ],),
                             )
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
      }));
}
