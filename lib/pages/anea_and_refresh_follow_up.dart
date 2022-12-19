import 'dart:convert';
import 'package:aldayat_screens/models/make_request.dart';
import 'package:aldayat_screens/models/user_hive.dart';
import 'package:aldayat_screens/widgets/add_ana_signs.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../constant.dart';
import '../main.dart';
import '../models/error_message.dart';
import '../widgets/ana_add_rescu_record_button.dart';
import '../widgets/title.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../widgets/waiting_widget.dart';

class AnaesthiaAndRefreshFollowUp extends StatefulWidget {
  final Map patient;
  final Map file;
  final User user;
  const AnaesthiaAndRefreshFollowUp(
      {super.key,
      required this.file,
      required this.user,
      required this.patient});

  @override
  State<AnaesthiaAndRefreshFollowUp> createState() => _NeoUnitState();
}

class _NeoUnitState extends State<AnaesthiaAndRefreshFollowUp> {
  List<String> keys = [
    "head",
    'assistant',
    'first_year',
    'second_year',
    // 'room',
    // 'type',
    // 'type_of_surg',
    'past_ill',
    'curent_drugs',
    'allerg',
    'hemo',
    'urin',
    'bg',
    'urin_bolina',
    'blood_pruser',
    'puls',
    'first_aid',
    'note',
    'benth',
    'iscolen',
    'trobeen',
    'baflyon',
    'ox_nitroz',
    'air_tube',
    'hand_tube',
    'ear_tube',
    'halw',
    'normal_breath',
    'not_normal_breath',
    'cpr',
    'machinaical_breath',
    'without_soda',
    'bro_atro',
    'other_info',
    'hard_visils',
    'hard_sleep',
    'hard_to_satel',
    'another',
    'investigations',
    'another_medicin',
    'respn',
    'know',
    'can_protect',
    'back_normal',
    'painless',
    'vomit',
    'time_of_accedent',
    'blood_drop',
    'breath_drop',
    'coma',
    'contin_paralisied',
    'allerg',
    'breath_vomit',
    'heart_attack'
  ];
  List<String> titles = [
    "أخصائي التخدير",
    "مساعد التخدير ",
    "طالب الصف الثاني",
    "طالب الصف الأول",
    " الأمراض السابقة",
    "العقاقير التي يتعاطاها المريض حالياً",
    "أي حساسية للعقاقير",
    "الهيموقلبين",
    "البول",
    "فصيلة الدم",
    "بولينا الدم",
    "ضغط الدم",
    "النبض",
    "3",
    "1",
    // "2",
    // "3",
    "بنتوثال",
    "أسكولين",
    "أتروبين",
    "بافليون",
    "أكسجين/نايتروز",
    "أكسجين",
    "هالوثن",
    "تنفس طبيعي",
    "تنفس إصطناعي باليد",
    "بماكينة",
    "بروستقمين",
    "أتروبين",
    "كمام ممر هواء",
    "أنبوب بقصبة بكف",
    "أنبوب بأنف",
    "بدون جير صودا",
    "معلومات أخرى",
    "أوردة صلبة",
    "صعوبة في التنويم",
    "صعوبة في التثبيت",
    " صعوبات أخرى",
    "تحاليل",
    "عقاقير أخرى",
    "عام",
    "نصفي",
    "موضعي",
    "إنتقالية",
    "عاجلة",
    "يستجيب للمخاطبة",
    "يعرف الزمان والمكان",
    "إستعادة مقدرته على حماية الحنجرة",
    "عاد الى الطبيعي والنبض /الضغط/التنفس",
    "خال من الألم",
    "تقيأ ، إستنشق ،أفياءه، يشعر بالألم،إستجاب للمخاطبة، قلق",
    "في حالة مضاعفات التخدير والجراحة:أكتب وبإختصار وقت وسبب الحدوث",
    "هبوط الدورة الدموية",
    "هبوط التنفس",
    "عدم رجوع الوعي",
    "شلل مستمر ",
    "حساسية لدم غير مطابق",
    "إستنشاق الإقياء",
    "سكته قلبية",
  ];
  var bloodDrop = ["قفل ممر الهوا", "هبوط مركزي", "ثقل عضلات"];
  List<TextEditingController> controllers = [];
  List<bool> bools = [];
  bool isAttended = true;
  @override
  void initState() {
    for (var i in titles) {
      controllers.add(TextEditingController());
      bools.add(false);
    }
    for(int i =0;i<keys.length;i++){
      print("${titles[i]}===== ${keys[i]}");
    }
print(titles.length);
print(keys.length);
    super.initState();
  }

  var anaType = '';
  var sergType = '';
  bool show = true;
  @override
  Widget build(BuildContext context) {
    if (!show) {
      return Scaffold(
        body: waitingWidget('color'),
      );
    }

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleD(Colors.deepOrangeAccent, size),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Anesthesia & Resuscitation Record",
                style: kLoginTitleStyle(size / 1.5, Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepOrangeAccent)),
                  child: firstPartWidget(size)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: Colors.teal,
                      onPressed: () async {
                        setState(() {
                          show = !show;
                        });
                        List<String> controllersText = [];
                        for (int i = 0; i < controllers.length; i++) {
                          controllersText.add(controllers[i].text);
                        }
                        var example = controllersText;
                        // var body = json.encode({
                        //   for (int i = 0; i < 11; i++) keysOf[i]: example[i],
                        //   'admitted_to_scn': admit ? "Yes" : 'No',
                        //   for (int i = 12; i < 15; i++) keysOf[i]: titles[i],
                        //   for (int i = 12; i < 23; i++)
                        //     keysOf[i]: example[i - 1],
                        //   'certain': certain
                        //       ? "Yes | ${example[22]}"
                        //       : 'No | ${example[22]}',
                        //   for (int i = 24; i < 31; i++)
                        //     keysOf[i]: example[i - 1],
                        //   'fetal_distress': fetall_distrces
                        //       ? "Yes | ${example[30]}"
                        //       : 'No | ${example[30]}',
                        //   for (int i = 32; i < 33; i++) keysOf[i]: example[i],
                        //   'cord_round': cord_round
                        //       ? "Yes | ${example[31]}"
                        //       : 'No | ${example[31]}',
                        //   for (int i = 34; i < 39; i++)
                        //     keysOf[i]: example[i - 1],
                        //   'vitamin_k_given': vitaminK ? "Yes " : 'No ',
                        //   'res_necess': resu_necess ? "Yes " : 'No ',
                        //   for (int i = 41; i < 43; i++)
                        //     keysOf[i]: example[i - 3],
                        //   for (int i = 43; i < 51; i++)
                        //     keysOf[i]: example[i - 3],
                        //   for (int i = 51; i < 83; i++)
                        //     keysOf[i]: example[i - 2],
                        //   'dr_id': widget.user.user!['id'],
                        //   'mother_id': widget.file['patient_id'],
                        //   'file_id': widget.file['id']
                        // });

                        String respons = await makeHttpRequest(
                            url + "kjvi/add", {}, true, User({}, 'token'));

                        if (respons == "Successfully Sent") {
                          Navigator.of(context).pop();
                        } else {
                          errono(
                              respons, respons, context, true, Container(), 3);
                          setState(() {
                            show = !show;
                          });
                        }
                      },
                      child: Text(
                        'Send',
                        style: fileTitle(size),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget firstPartWidget(Size size) {
    return SizedBox(
      width: size.width,
      child: ResponsiveGridRow(children: [
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'المشاركين',
                style: kLoginTitleStyle(size / 2, Colors.black),
              )
            ],
          ),
        )),
        for (int i = 0; i < 4; i++)
          ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controllers[i],
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text(titles[i])),
                ),
              )),
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(),
        )),
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'سجل قبل التخدير',
                style: kLoginTitleStyle(size / 2, Colors.black),
              )
            ],
          ),
        )),
        for (int i = 4; i < 9; i++)
          ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controllers[i],
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text(titles[i])),
                ),
              )),
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'فحوصات قبل الجراحة',
                style: kLoginTitleStyle(size / 2, Colors.black),
              )
            ],
          ),
        )),
        for (int i = 9; i < 13; i++)
          ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controllers[i],
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text(titles[i])),
                ),
              )),
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'نتائج الكشف ',
                style: kLoginTitleStyle(size / 2, Colors.black),
              )
            ],
          ),
        )),
        for (int i = 13; i < 16; i++)
          ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controllers[i],
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text(titles[i])),
                ),
              )),
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'المعالجة الأولية ',
                style: kLoginTitleStyle(size / 2, Colors.black),
              )
            ],
          ),
        )),
        for (int i = 16; i < 19; i++)
          ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controllers[i],
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text(titles[i])),
                ),
              )),
      ]),
    );
  }

  Widget secondPartWidget(Size size) {
    return SizedBox(
      width: size.width,
      child: ResponsiveGridRow(children: [
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: addAnaethSignButton(
              context, widget.patient, widget.file, widget.user, size),
        )),
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'نوع الجراحة',
                style: kLoginTitleStyle(size / 2, Colors.black),
              )
            ],
          ),
        )),
        for (int i = 44; i < 46; i++)
          ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      titles[i],
                    ),
                    Checkbox(
                        value: sergType == titles[i],
                        onChanged: ((value) =>
                            {setState(() => sergType = titles[i])}))
                  ],
                ),
              )),
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(),
        )),
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'نوع التخدير',
                style: kLoginTitleStyle(size / 2, Colors.black),
              )
            ],
          ),
        )),
        for (int i = 41; i < 44; i++)
          ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      titles[i],
                    ),
                    Checkbox(
                        value: anaType == titles[i],
                        onChanged: ((value) =>
                            {setState(() => anaType = titles[i])}))
                  ],
                ),
              )),
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(),
        )),
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'طريقة التخدير',
                    style: kLoginTitleStyle(size / 2, Colors.black),
                  ),
                  Text(
                    'أعط أوكسجين لمدة خمس دقائق قبل العمليات الكبيرة',
                  ),
                ],
              )
            ],
          ),
        )),
        ResponsiveGridCol(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: Column(
                        children: [
                          for (int i = 31; i < 41; i++)
                            i < 35
                                ? Row(
                                    children: [
                                      Checkbox(
                                          value: "Yes" == controllers[i].text,
                                          onChanged: ((value) => {
                                                setState(() => value!
                                                    ? controllers[i].text =
                                                        'Yes'
                                                    : controllers[i].text =
                                                        'No')
                                              })),
                                      Text(titles[i]),
                                    ],
                                  )
                                : Container()
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (int i = 19; i < 31; i++)
                        Row(
                          children: [
                            Checkbox(
                                value: "Yes" == controllers[i].text,
                                onChanged: ((value) => {
                                      setState(() => value!
                                          ? controllers[i].text = 'Yes'
                                          : controllers[i].text = 'No')
                                    })),
                            Text(titles[i]),
                          ],
                        )
                    ],
                  )
                ],
              ),
            )
          ],
        )),
        for (int i = 35; i < 36; i++)
          ResponsiveGridCol(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.end,
                maxLines: 3,
                controller: controllers[i],
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text(titles[i])),
              ),
            ),
          ),
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Divider(),
        )),
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'صعوبات في بداية التخدير',
                style: kLoginTitleStyle(size / 2, Colors.black),
              )
            ],
          ),
        )),
        for (int i = 36; i < 40; i++)
          ResponsiveGridCol(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.end,
                controller: controllers[i],
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      titles[i],
                      textAlign: TextAlign.end,
                    )),
              ),
            ),
          ),
        for (int i = 40; i < 42; i++)
          ResponsiveGridCol(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.end,
                maxLines: 3,
                controller: controllers[i],
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      titles[i],
                      textAlign: TextAlign.end,
                    )),
              ),
            ),
          ),
      ]),
    );
  }

  Widget lastPart(Size size) {
    return SizedBox(
      width: size.width,
      child: ResponsiveGridRow(children: [
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: addAnaethRescuationRecordButton(
              context, widget.patient, widget.file, widget.user, size),
        )),
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'الحالة العامة بعد إنتهاء الإنعاش',
                style: kLoginTitleStyle(size / 2, Colors.black),
              )
            ],
          ),
        )),
        for (int i = 47; i < 52; i++)
          ResponsiveGridCol(
              // xs: 6,
              // md: 3,
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                    value: bools[i],
                    onChanged: ((value) =>
                        {setState(() => bools[i] = !bools[i])})),
                Text(
                  titles[i],
                ),
              ],
            ),
          )),
        for (int i = 52; i < 55; i++)
          ResponsiveGridCol(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                textAlign: TextAlign.end,
                controller: controllers[i],
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text(titles[i])),
              ),
            ),
          ),
        ResponsiveGridCol(
            // xs: 6,
            // md: 3,
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                  visible: bools[55],
                  child: Column(
                    children: [
                      for (var i in bloodDrop)
                        Row(
                          children: [
                            Checkbox(
                                value: controllers[55].text == i,
                                onChanged: ((value) => {
                                      setState(() => controllers[55].text = i)
                                    })),
                            Text(
                              i,
                            )
                          ],
                        )
                    ],
                  )),
              Checkbox(
                  value: bools[55],
                  onChanged: ((value) =>
                      {setState(() => bools[55] = !bools[55])})),
              Text(
                titles[55],
              ),
            ],
          ),
        )),
        for (int i = 56; i < titles.length; i++)
          ResponsiveGridCol(
              // xs: 6,
              // md: 3,
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: controllers[i],
                  ),
                ),
                Checkbox(
                    value: bools[i],
                    onChanged: ((value) =>
                        {setState(() => bools[i] = !bools[i])})),
                Text(
                  titles[i],
                ),
              ],
            ),
          )),
      ]),
    );
  }
}
