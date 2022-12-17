import 'dart:convert';
import 'package:aldayat_screens/models/make_request.dart';
import 'package:aldayat_screens/models/user_hive.dart';
import 'package:aldayat_screens/widgets/add_ana_signs.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../constant.dart';
import '../main.dart';
import '../models/error_message.dart';
import '../widgets/title.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../widgets/waiting_widget.dart';

List keysOf = [
  "name_of_mother",
  "sex",
  "baby_no",
  "address",
  "birthdate",
  "birthtime",
  "obs_unit",
  "dis_date",
  "summary",
  "resuscitation",
  "birth_weight",
  "admitted_to_scn",
  "follow_u",
  "discharg_weight",
  "feeding_on_dis",
  "prev_operation",
  "medical_prob",
  "husband_occup",
  "medical_status_at_deliv",
  "age",
  "bg",
  "antibod",
  "edd",
  "certain",
  "weeks_preg",
  "obataric_history",
  "gravida",
  "para",
  "illness_during",
  "durgs_during",
  "type_of_deliv",
  "fetal_distress",
  "delivery_by",
  "cord_round",
  "indication_cs",
  "resp_first",
  "regulat_or_cry",
  "color",
  "tone",
  "vitamin_k_given",
  "res_necess",
  "spontaneous",
  "movement_when_stimulated",
  "pale",
  "limb",
  "apgar",
  "heart",
  "respiration",
  "tone_2",
  "responsiveness",
  "color_2",
  "total",
  "exam_by",
  "general",
  "skull",
  "skin",
  "limbs",
  "abdomen",
  "genital",
  "auns",
  "spontan",
  "muscle_tone",
  "rooting",
  "sucking",
  "traction",
  "grasp",
  "automatic",
  "moro",
  "trans",
  "recived",
  "condition_on_arriv",
  "temp",
  "colour",
  "respir",
  "examined_at",
  "hours_by",
  "hips",
  "gestational_assess",
  "nutri",
  "another_heart",
  "head_cir",
  "feeding",
  "comment",
];

List<String> titles = [
  "Name of Mother",
  "Sex",
  "Baby No.",
  "Address",
  "Birth Date",
  "Birth Time",
  "Obstotrical Unit",
  "Discharge Date",
  "Summary",
  "Comment",
  "Birth Weight",
  "Follow UJ",
  "Dicharge Weight",
  "Feeding On Discharg",
  "Previod Occupation",
  "Medical Problem",
  "Husband Occupation",
  "Medical Status at Delivery",
  "Age",
  "Blood Group",
  "Antibodies",
  "EDD",
  "Comment",
  "Weeks Pregnant",
  "Obataric History",
  "Gravida",
  "Para",
  "Illnes during this pregnancy (Including details an of admissions to hospital)",
  "Drugs during this pregnancy",
  "Type of delivery and Complications",
  "Specify",
  "Describe",
  "Delivery By",
  "Indication C.S",
  "First Breath or Gasp",
  "Regular Respirations or Cry",
  "Color",
  "Tone",
  "Spontaneous Movements",
  "Movement When Stimulated",
  "Pale",
  "Limb",
  "Apgar Score at",
  "Heart",
  "Respitation",
  "Tone",
  "Responsiveness",
  "Color",
  "",
  "Total",
  "Examined at Minutes by",
  "General",
  "Skull",
  "Skin",
  "Limbs & Spine",
  "Abdomen",
  "Genitalis",
  "Auns",
  "A- Spontaneous Movements",
  "B- Muscle Tone",
  "C - Rooting Reflex",
  "D - Sucking Reflex",
  "E- Traction Response",
  "F - Grasp Reflex",
  "G - Automatic Walking",
  "H - Moro Reflex",
  "Transferred to Post - Natal Ward / Special Care Nursy at",
  "Received By ",
  "Condition on Arrival ",
  "Tempreture",
  "Color",
  "Respirations",
  "Examined at",
  "Hours by",
  "Hips",
  "Gestational Assessment",
  "Nutrition",
  "Heart",
  "Head Circumference",
  "Feeding: Mother Wishes to Breast Feed/ Bottle Feed",
  "Comment",
  "Comment",
  "Comment",
];

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
  bool resu = false;
  bool admit = false;
  bool certain = false;
  bool fetall_distrces = false;
  bool cord_round = false;
  bool vitaminK = false;
  bool resu_necess = false;
  List<String> titles = [
    "أخصائي التخدير",
    "مساعد التخدير ",
    "طالب الصف الثاني",
    "طالب الصف الأول",
    "1- الأمراض السابقة",
    "2",
    "3",
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
    "نايتروز",
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
    "Limp",
    "Apgar Score at",
    "Heart",
    "Respitation",
    "Tone",
    "Responsiveness",
    "Color",
    "",
    "Total",
    "Examined at Minutes by",
    "General",
    "Skull",
    "Skin",
    "Limbs & Spine",
    "Abdomen",
    "Genitalis",
    "Auns",
    "A- Spontaneous Movements",
    "B- Muscle Tone",
    "C - Rooting Reflex",
    "D - Sucking Reflex",
    "E- Traction Response",
    "F - Grasp Reflex",
    "G - Automatic Walking",
    "H - Moro Reflex",
    "Transferred to Post - Natal Ward / Special Care Nursy at",
    "Received By ",
    "Condition on Arrival ",
    "Tempreture",
    "Color",
    "Respirations",
    "Examined at",
    "Hours by",
    "Hips",
    "Gestational Assessment",
    "Nutrition",
    "Heart",
    "Head Circumference",
    "Feeding: Mother Wishes to Breast Feed/ Bottle Feed",
    "Comment",
    "Comment",
    "Comment",
  ];

  List<TextEditingController> controllers = [];
  bool isAttended = true;
  @override
  void initState() {
    for (var i in titles) {
      controllers.add(TextEditingController());
    }
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
                  child: secondPartWidget(size)),
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
                        var body = json.encode({
                          for (int i = 0; i < 11; i++) keysOf[i]: example[i],
                          'admitted_to_scn': admit ? "Yes" : 'No',
                          for (int i = 12; i < 15; i++) keysOf[i]: titles[i],
                          for (int i = 12; i < 23; i++)
                            keysOf[i]: example[i - 1],
                          'certain': certain
                              ? "Yes | ${example[22]}"
                              : 'No | ${example[22]}',
                          for (int i = 24; i < 31; i++)
                            keysOf[i]: example[i - 1],
                          'fetal_distress': fetall_distrces
                              ? "Yes | ${example[30]}"
                              : 'No | ${example[30]}',
                          for (int i = 32; i < 33; i++) keysOf[i]: example[i],
                          'cord_round': cord_round
                              ? "Yes | ${example[31]}"
                              : 'No | ${example[31]}',
                          for (int i = 34; i < 39; i++)
                            keysOf[i]: example[i - 1],
                          'vitamin_k_given': vitaminK ? "Yes " : 'No ',
                          'res_necess': resu_necess ? "Yes " : 'No ',
                          for (int i = 41; i < 43; i++)
                            keysOf[i]: example[i - 3],
                          for (int i = 43; i < 51; i++)
                            keysOf[i]: example[i - 3],
                          for (int i = 51; i < 83; i++)
                            keysOf[i]: example[i - 2],
                          'dr_id': widget.user.user!['id'],
                          'mother_id': widget.file['patient_id'],
                          'file_id': widget.file['id']
                        });

                        String respons = await makeHttpRequest(
                            url + "neounit/add", body, true, User({}, 'token'));

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
        for (int i = 19; i < 31; i++)
          ResponsiveGridCol(
              xs: 2,
              md: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(titles[i]),
                    Checkbox(
                        value: "Yes" == controllers[i].text,
                        onChanged: ((value) => {
                              setState(() => value!
                                  ? controllers[i].text = 'Yes'
                                  : controllers[i].text = 'No')
                            }))
                  ],
                ),
              )),
        for (int i = 31; i < 35; i++)
          ResponsiveGridCol(
              xs: 2,
              md: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(titles[i]),
                    Checkbox(
                        value: "Yes" == controllers[i].text,
                        onChanged: ((value) => {
                              setState(() => value!
                                  ? controllers[i].text = 'Yes'
                                  : controllers[i].text = 'No')
                            }))
                  ],
                ),
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
}
