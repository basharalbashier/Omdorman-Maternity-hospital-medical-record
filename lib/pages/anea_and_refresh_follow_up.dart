// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:aldayat_screens/models/user_hive.dart';
import 'package:aldayat_screens/testo.dart';
import 'package:aldayat_screens/widgets/add_ana_signs.dart';
import 'package:aldayat_screens/widgets/ana_refresh_table.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../constant.dart';
import '../models/error_message.dart';
import '../models/get_request.dart';
import '../models/make_request.dart';
import '../widgets/ana_add_rescu_record_button.dart';

import '../widgets/waiting_widget.dart';
import '../widgets/single_chart_line.dart';

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
  State<AnaesthiaAndRefreshFollowUp> createState() =>
      _AnaesthiaAndRefreshFollowUpState();
}

class _AnaesthiaAndRefreshFollowUpState
    extends State<AnaesthiaAndRefreshFollowUp> {
  bool isFirst = true;
  bool isSecond = false;
  bool isLast = false;
  List<String> keys = [
    "head",
    'assistant',
    'first_year',
    'second_year',
    'room',
    'past_ill',
    'curent_drugs',
    'allerg',
    'hemo',
    'urin',
    'bg',
    'urin_bolina',
    'blood_pruser',
    'puls',
    'another',
    'first_aid_one',
    'first_aid_two',
    'first_aid_three',
    //18
    'benth',
    'iscolen',
    'trobeen',
    'baflyon',
    'ox_nitroz',
    'halw',
    'normal_breath',
    'cpr',
    'machinaical_breath',
    'bro_atro',
    'air_tube',
    'hand_tube',
    'nose_tube',
    /*
{"respon":"يستجيب للمخاطبة","know":"يعرف الزمان والمكان","can_protect":"إستعادة مقدرته على حماية الحنجرة","back_normal":"عاد الى الطبيعي والنبض /الضغط/التنفس","painless":"خال من الألم","vomit":"تقيأ ، إستنشق ،أفياءه، يشعر بالألم،إستجاب للمخاطبة،
قلق","time_of_accedent":"في حالة مضاعفات التخدير والجراحة:أكتب وبإختصار وقت وسبب الحدوث","blood_drop":"هبوط الدورة الدموية","breath_drop":"هبوط التنفس","coma":"عدم رجوع الوعي","contin_paralisied":"شلل مستمر ","allerg":"حساسية لدم غير
مطابق","breath_vomit":"إستنشاق الإقياء","heart_attack":"سكته قلبية","dr_id":"0","patient_id":"0","file_id":"0"}
  */

    'without_soda',
    'other_info',
    'hard_visils',
    'hard_sleep',
    'hard_to_satel',
    'another',
    'investigations',
    'another_medicin',
    'type',
    'type_ana',
    //
    'respon',
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
    "العنبر",
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
    "2",
    "3",
    "بنتوثال",
    "أسكولين",
    "أتروبين",
    "بافليون",
    "أكسجين/نايتروز",
    "هالوثن",
    "تنفس طبيعي",
    "تنفس إصطناعي باليد",
    "بماكينة",
    "أتروبين/بروستقمين",
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
  var types_of_serg = ["إنتقالية", "عاجلة"];
  var types_of_ana = [
    "عام",
    "نصفي",
    "موضعي",
  ];
  List<TextEditingController> controllers = [];
  List<bool> bools = [];
  List befor = [];
  List second = [];
  List last = [];
  List vitalSign = [];
  List refresh = [];
  TextStyle titleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  checkWhatbeeingDone() async {
    await getIt("beforana", widget.user, context, '0').then((value) =>
        setState(() => {befor = value, befor.isEmpty ? isFirst = true : null}));

    if (befor.isNotEmpty) {
      await getIt("whileana", widget.user, context, '0').then((value) =>
          setState(
              () => {second = value, second.isEmpty ? isSecond = true : null}));
      await getIt("afterana", widget.user, context, '0').then((value) =>
          setState(() => {last = value, last.isEmpty ? isLast = true : null}));

      await getIt("icuvital", widget.user, context, 'null')
          .then((value) => setState(() => vitalSign = value));
      await getIt("refresh", widget.user, context, 'null')
          .then((value) => setState(() => refresh = value));
    }
    setState(() => show = true);
  }

  @override
  void initState() {
    checkWhatbeeingDone();
    for (var i in titles) {
      controllers.add(TextEditingController());
      bools.add(false);
    }
    // for (int i = 0; i < keys.length; i++) {
    //   print("${titles[i]}===== ${keys[i]}");
    // }
    print(titles.length);
    print(keys.length);
    super.initState();
  }

  String typeOfSerg = '';

  String typeOfAna = '';
  bool show = false;
  @override
  Widget build(BuildContext context) {
    if (!show && (isFirst || isSecond || isLast)) {
      return Scaffold(
        body: waitingWidget('color'),
      );
    }

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TitleD(Colors.deepOrangeAccent, size),
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
                  child: firstPartWidget(size, befor)),
            ),
            befor.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepOrangeAccent)),
                        child: secondPartWidget(size, second)),
                  )
                : Container(),
            befor.isNotEmpty && second.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepOrangeAccent)),
                        child: lastPart(size, last)),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: befor.isEmpty || second.isEmpty || last.isEmpty,
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        color: Colors.teal,
                        onPressed: () async {
                          // setState(() {
                          //   show = !show;
                          // });

                          var rang = [
                            isFirst
                                ? 0
                                : isSecond
                                    ? 18
                                    : 41,
                            isFirst
                                ? 18
                                : isSecond
                                    ? 39
                                    : keys.length

                            /*
                                    {"respon":"موضعي","know":"إنتقالية","can_protect":"عاجلة","back_normal":"يستجيب للمخاطبة","painless":"يعرف الزمان والمكان","vomit":"إستعادة مقدرته على حماية الحنجرة","time_of_accedent":"عاد الى الطبيعي والنبض /الضغط/التنفس","blood_drop":"خال من
              الألم","breath_drop":"تقيأ ، إستنشق ،أفياءه، يشعر بالألم،إستجاب للمخاطبة، قلق","coma":"في حالة مضاعفات التخدير والجراحة:أكتب وبإختصار وقت وسبب الحدوث","contin_paralisied":"هبوط الدورة الدموية","allerg":"هبوط التنفس","breath_vomit":"عدم رجوع
              الوعي","heart_attack":"شلل مستمر ","dr_id":"0","patient_id":"0","file_id":"0"}
                                     */
                          ];
                          List<String> controllersText = [];
                          for (int i = 0; i < controllers.length; i++) {
                            controllersText.add(controllers[i].text);
                          }
                          var example = controllersText;
                          var preBody = {
                            for (int i = rang[0]; i < rang[1]; i++)
                              keys[i]: titles[isLast ? i + 3 : i],
                            // 'breath_drop':'',
                            // "type":typeOfSerg,
                            // ""
                            'dr_id': "0",
                            'patient_id': "0",
                            'file_id': "0"
                          };
                          if (second.isEmpty) {
                            preBody['type'] = typeOfSerg;
                            preBody['type_ana'] = typeOfAna;
                          }
                          if (last.isEmpty && second.isNotEmpty) {
                            preBody['breath_drop'] = controllers[52].text;
                          }
                          var body = json.encode(preBody);
                          // print(body);
                          String root =
                              "${isFirst ? 'beforana' : isSecond ? 'whileana' : 'afterana'}";
                          String respons = await makeHttpRequest(
                              url + "$root/add", body, true, User({}, 'token'));

                          if (respons == "Successfully Sent") {
                            // Navigator.of(context).pop();
                          } else {
                            errono(respons, respons, context, true, Container(),
                                3);
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
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget firstPartWidget(Size size, List data) {
    return SizedBox(
      width: size.width,
      child: ResponsiveGridRow(children: [
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [],
          ),
        )),
        for (int i = 0; i < 5; i++)
          ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: data.isNotEmpty
                    ? Column(
                        children: [
                          Text(titles[i]),
                          Text(data[0][keys[i]]),
                        ],
                      )
                    : TextField(
                        controller: controllers[i],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(titles[i])),
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
                style: titleStyle,
              )
            ],
          ),
        )),
        for (int i = 5; i < 8; i++)
          ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: data.isNotEmpty
                    ? Column(
                        children: [
                          Text(titles[i]),
                          Text(data[0][keys[i]]),
                        ],
                      )
                    : TextField(
                        controller: controllers[i],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(titles[i])),
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
                style: titleStyle,
              )
            ],
          ),
        )),
        for (int i = 8; i < 12; i++)
          ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: data.isNotEmpty
                    ? Column(
                        children: [
                          Text(titles[i]),
                          Text(data[0][keys[i]]),
                        ],
                      )
                    : TextField(
                        controller: controllers[i],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(titles[i])),
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
                style: titleStyle,
              )
            ],
          ),
        )),
        for (int i = 12; i < 15; i++)
          ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: data.isNotEmpty
                    ? Column(
                        children: [
                          Text(titles[i]),
                          Text(data[0][keys[i]]),
                        ],
                      )
                    : TextField(
                        controller: controllers[i],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(titles[i])),
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
                style: titleStyle,
              )
            ],
          ),
        )),
        for (int i = 15; i < 18; i++)
          ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: data.isNotEmpty
                    ? Column(
                        children: [
                          Text(titles[i]),
                          Text(data[0][keys[i]]),
                        ],
                      )
                    : TextField(
                        controller: controllers[i],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(titles[i])),
                      ),
              )),
      ]),
    );
  }

  Widget secondPartWidget(Size size, List data) {
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
            child: Visibility(
                visible: vitalSign.isNotEmpty,
                child: SizedBox(
                  height: size.height / 3,
                  child: Chartooo(
                    data: vitalSign,
                  ),
                ))),
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'نوع الجراحة',
                style: titleStyle,
              )
            ],
          ),
        )),
        ResponsiveGridCol(
            xs: 6,
            md: 3,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: data.isNotEmpty,
                  child: Column(
                    children: [
                      Text(data[0]["type"] ?? ""),
                    ],
                  ),
                ))),
        for (int i = 42; i < 44; i++)
          ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: data.isEmpty,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        titles[i],
                      ),
                      Checkbox(
                          value: bools[i],
                          onChanged: ((value) => {
                                setState(() => {
                                      bools[i] = !bools[i],
                                      value! ? typeOfSerg = titles[i] : null
                                    })
                              }))
                    ],
                  ),
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
                style: titleStyle,
              )
            ],
          ),
        )),
        ResponsiveGridCol(
            xs: 6,
            md: 3,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: data.isNotEmpty,
                  child: Column(
                    children: [
                      Text(data[0]["type_ana"] ?? ""),
                    ],
                  ),
                ))),
        for (int i = 39; i < 42; i++)
          ResponsiveGridCol(
              xs: 6,
              md: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: data.isEmpty,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        titles[i],
                      ),
                      Checkbox(
                          value: bools[i],
                          onChanged: ((value) => {
                                setState(() => {
                                      bools[i] = !bools[i],
                                      value! ? typeOfAna = titles[i] : null
                                    })
                              }))
                    ],
                  ),
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
                    style: titleStyle,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        for (int i = 28; i < 32; i++)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              data.isNotEmpty
                                  ? Column(
                                      children: [
                                        Text(titles[i]),
                                        Text(data[0][keys[i]] ?? ""),
                                      ],
                                    )
                                  : Checkbox(
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
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (int i = 18; i < 28; i++)
                        data.isNotEmpty
                            ? Column(
                                children: [
                                  Text(titles[i]),
                                  Text(data[0][keys[i]] ?? ""),
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
        for (int i = 32; i < 33; i++)
          ResponsiveGridCol(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: data.isNotEmpty
                  ? Column(
                      children: [
                        Text(titles[i]),
                        Text(data[0][keys[i]] ?? ""),
                      ],
                    )
                  : TextField(
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
                style: titleStyle,
              )
            ],
          ),
        )),
        for (int i = 33; i < 37; i++)
          ResponsiveGridCol(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: data.isNotEmpty
                  ? Column(
                      children: [
                        Text(titles[i]),
                        Text(data[0][keys[i]] ?? ""),
                      ],
                    )
                  : TextField(
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
        for (int i = 37; i < 39; i++)
          ResponsiveGridCol(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: data.isNotEmpty
                  ? Column(
                      children: [
                        Text(titles[i]),
                        Text(data[0][keys[i]] ?? ""),
                      ],
                    )
                  : TextField(
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

  Widget lastPart(Size size, List data) {
    print(data);
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
                child: refreshTable(refresh.reversed.toList(), context,
                    widget.file, widget.user))),
        ResponsiveGridCol(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'الحالة العامة بعد إنتهاء الإنعاش',
                style: titleStyle,
              )
            ],
          ),
        )),
        for (int i = 44; i < 49; i++)
          ResponsiveGridCol(
              // xs: 6,
              // md: 3,
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: data.isNotEmpty
                ? Column(
                    children: [
                      Text(titles[i]),
                      Text(data[0][keys[i]] ?? ""),
                    ],
                  )
                : Row(
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
        for (int i = 49; i < 52; i++)
          ResponsiveGridCol(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: data.isNotEmpty
                  ? Column(
                      children: [
                        Text(titles[i]),
                        Text(data[0][keys[i]] ?? ""),
                      ],
                    )
                  : TextField(
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
          child: data.isNotEmpty
              ? Row(
                  children: [
                    Text(
                      data[0]['breath_drop'] ?? "by",
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                        visible: bools[52],
                        child: Column(
                          children: [
                            for (var i in bloodDrop)
                              Row(
                                children: [
                                  Checkbox(
                                      value: controllers[52].text == i,
                                      onChanged: ((value) => {
                                            setState(
                                                () => controllers[52].text = i)
                                          })),
                                  Text(
                                    i,
                                  )
                                ],
                              )
                          ],
                        )),
                    Visibility(
                      visible: data.isEmpty,
                      child: Checkbox(
                          value: bools[52],
                          onChanged: ((value) =>
                              {setState(() => bools[52] = !bools[52])})),
                    ),
                    Text(
                      titles[52],
                    ),
                  ],
                ),
        )),
        for (int i = 53; i < titles.length - (last.isEmpty ? 0 : 3); i++)
          ResponsiveGridCol(
              // xs: 6,
              // md: 3,
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: data.isNotEmpty
                ? Row(
                    children: [
                      Text(titles[i]),
                      Text(data[0][keys[i]] ?? ""),
                    ],
                  )
                : Row(
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
        ResponsiveGridCol(
          child: Visibility(
              visible: data.isNotEmpty,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        data[0]['breath_vomit'] ?? "",
                      ),
                      Text(
                        titles[56],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        data[0]['heart_attack'] ?? '',
                      ),
                      Text(
                        titles[57],
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ]),
    );
  }
}
