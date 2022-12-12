import 'dart:convert';
import 'package:aldayat_screens/models/make_request.dart';
import 'package:aldayat_screens/models/user_hive.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../constant.dart';
import '../main.dart';
import '../models/error_message.dart';
import '../widgets/title.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../widgets/waiting_widget.dart';

class NeoUnit extends StatefulWidget {
  final Map file;
  final User user;
  const NeoUnit({super.key, required this.file, required this.user});

  @override
  State<NeoUnit> createState() => _NeoUnitState();
}

class _NeoUnitState extends State<NeoUnit> {
  bool resu = false;
  bool admit = false;
  bool certain = false;
  bool fetall_distrces = false;
  bool cord_round = false;
  bool vitaminK = false;
  bool resu_necess = false;
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
  bool show = true;
  @override
  Widget build(BuildContext context) {
    if (!show) {
      return Scaffold(
        body: waitingWidget('color'),
      );
    }

    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          TitleD(Colors.lightBlueAccent, size),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Neonatal Unit',
              style: kLoginTitleStyle(size, Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          SizedBox(
            width: size.width,
            child: ResponsiveGridRow(children: [
              for (int i = 0; i < 9; i++)
                ResponsiveGridCol(
                    xs: i != 8 ? 6 : 12,
                    md: i != 8 ? 3 : null,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        maxLines: i == 8 ? 3 : null,
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
                    children: [
                      Text(
                        'Resucitation     ${resu ? "Yes" : "No"}',
                        // style: kLoginTitleStyle(size/2, Colors.black),
                      ),
                      Checkbox(
                          value: resu,
                          onChanged: (onChanged) =>
                              setState(() => resu = !resu)),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: controllers[9],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text(titles[9])),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controllers[10],
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text(titles[10])),
                ),
              )),
              ResponsiveGridCol(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Admitted  to S.C.N   ${admit ? "Yes" : "No"}',
                        // style: kLoginTitleStyle(size/2, Colors.black),
                      ),
                      Checkbox(
                          value: admit,
                          onChanged: (onChanged) =>
                              setState(() => admit = !admit)),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: controllers[11],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text(titles[11])),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              for (int i = 12; i < 14; i++)
                ResponsiveGridCol(
                    xs: 6,
                    md: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
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
                  child: Center(
                    child: Text(
                      'Mother',
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                  ),
                ),
              ),
              for (int i = 14; i < 22; i++)
                ResponsiveGridCol(
                    xs: 6,
                    md: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
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
                    children: [
                      Text(
                        'certain     ${certain ? "Yes" : "No"}'.toUpperCase(),
                        // style: kLoginTitleStyle(size/2, Colors.black),
                      ),
                      Checkbox(
                          value: certain,
                          onChanged: (onChanged) =>
                              setState(() => certain = !certain)),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: controllers[22],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text(titles[22])),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              for (int i = 23; i < 29; i++)
                ResponsiveGridCol(
                    xs: i == 27 || i == 28 ? 12 : 6,
                    md: i == 27 || i == 28 ? null : 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
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
                  child: Center(
                    child: Text(
                      'Labour',
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                  ),
                ),
              ),
              ResponsiveGridCol(
                  xs: 12,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controllers[29],
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text(titles[29])),
                    ),
                  )),
              ResponsiveGridCol(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'fetall distrces     ${fetall_distrces ? "Yes" : "No"}'
                            .toUpperCase(),
                        // style: kLoginTitleStyle(size/2, Colors.black),
                      ),
                      Checkbox(
                          value: fetall_distrces,
                          onChanged: (onChanged) => setState(
                              () => fetall_distrces = !fetall_distrces)),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: controllers[30],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text(titles[30])),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'cord round  neck   ${cord_round ? "Yes" : "No"}'
                            .toUpperCase(),
                        // style: kLoginTitleStyle(size/2, Colors.black),
                      ),
                      Checkbox(
                          value: cord_round,
                          onChanged: (onChanged) =>
                              setState(() => cord_round = !cord_round)),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: controllers[31],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text(titles[31])),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              for (int i = 32; i < 34; i++)
                ResponsiveGridCol(
                    xs: 6,
                    md: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controllers[i],
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(titles[i])),
                      ),
                    )),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Attended ${isAttended ? "Yes" : "No"}'.toUpperCase(),
                  style: kLoginTitleStyle(size / 2, Colors.black),
                ),
                Checkbox(
                    value: isAttended,
                    onChanged: (onChanged) =>
                        setState(() => isAttended = !isAttended)),
              ],
            ),
          ),
          Visibility(
            visible: isAttended,
            child: Padding(
              padding: EdgeInsets.all(size.width / 20),
              child: Table(
                border: TableBorder.all(width: 2, color: Colors.blueGrey),
                columnWidths: const <int, TableColumnWidth>{
                  // 0: IntrinsicColumnWidth(),
                  // 1: FlexColumnWidth(),
                  // 2: IntrinsicColumnWidth(),
                },
                children: <TableRow>[
                  for (int i = 34; i < 42; i++)
                    TableRow(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: controllers[i],
                            decoration: InputDecoration(label: Text(titles[i])),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            readOnly: (i + 8) > 47,
                            controller: controllers[i + 8],
                            decoration:
                                InputDecoration(label: Text(titles[i + 8])),
                          ),
                        ),
                      ],
                    ),
                  TableRow(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'vitamin K given   ${vitaminK ? "Yes" : "No"}'
                                      .toUpperCase(),
                                  // style: kLoginTitleStyle(size/2, Colors.black),
                                ),
                                Checkbox(
                                    value: vitaminK,
                                    onChanged: (onChanged) =>
                                        setState(() => vitaminK = !vitaminK)),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller:
                                          controllers[controllers.length - 2],
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          label: Text(
                                              titles[controllers.length - 2])),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Resuscitation \n necsss ${resu_necess ? "Yes" : "No"}'
                                      .toUpperCase(),
                                  // style: kLoginTitleStyle(size/2, Colors.black),
                                ),
                                Checkbox(
                                    value: resu_necess,
                                    onChanged: (onChanged) => setState(
                                        () => resu_necess = !resu_necess)),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller:
                                          controllers[controllers.length - 1],
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          label: Text(
                                              titles[controllers.length - 1])),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              border: TableBorder.all(width: 2, color: Colors.blueGrey),
              columnWidths: const <int, TableColumnWidth>{
                // 0: IntrinsicColumnWidth(),
                // 1: FlexColumnWidth(),
                // 2: IntrinsicColumnWidth(),
              },
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Inital Examination',
                          style: kLoginTitleStyle(size / 2, Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'R.C.N.S Centeral Observation',
                          style: kLoginTitleStyle(size / 2, Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                for (int i = 50; i < 58; i++)
                  TableRow(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controllers[i],
                          decoration: InputDecoration(label: Text(titles[i])),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controllers[i + 8],
                          decoration:
                              InputDecoration(label: Text(titles[i + 8])),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          ResponsiveGridRow(children: [
            for (int i = 66; i < controllers.length - 2; i++)
              ResponsiveGridCol(
                  xs: (i == 68)
                      ? 12
                      : (i == 66)
                          ? 12
                          : (i == controllers.length - 3)
                              ? 12
                              : (i == controllers.length - 4)
                                  ? 12
                                  : 6,
                  md: (i == controllers.length - 3)
                      ? null
                      : (i == controllers.length - 4)
                          ? null
                          : (i == 68)
                              ? null
                              : (i == 66)
                                  ? null
                                  : 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: controllers.length - 3 == i ? 3 : null,
                      controller: controllers[i],
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), label: Text(titles[i])),
                    ),
                  )),
          ]),
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
                        for (int i = 12; i < 23; i++) keysOf[i]: example[i - 1],
                        'certain': certain
                            ? "Yes | ${example[22]}"
                            : 'No | ${example[22]}',
                        for (int i = 24; i < 31; i++) keysOf[i]: example[i - 1],
                        'fetal_distress': fetall_distrces
                            ? "Yes | ${example[30]}"
                            : 'No | ${example[30]}',
                        for (int i = 32; i < 33; i++) keysOf[i]: example[i],
                        'cord_round': cord_round
                            ? "Yes | ${example[31]}"
                            : 'No | ${example[31]}',
                        for (int i = 34; i < 39; i++) keysOf[i]: example[i - 1],
                        'vitamin_k_given': vitaminK ? "Yes " : 'No ',
                        'res_necess': resu_necess ? "Yes " : 'No ',
                        for (int i = 41; i < 43; i++) keysOf[i]: example[i - 3],
                        for (int i = 43; i < 51; i++) keysOf[i]: example[i - 3],
                        for (int i = 51; i < 83; i++) keysOf[i]: example[i - 2],
                        'dr_id': widget.user.user!['id'],
                        'mother_id': widget.file['mother_id'],
                        'file_id': widget.file['id']
                      });

                      // print(body);
                      String respons = await makeHttpRequest(
                          url + "neounit/add", body, true, User({}, 'token'));

                      if (respons == "Successfully Sent") {
                        Navigator.of(context).pop();
                      } else {
                        errono(respons, respons, context, true, Container(), 3);
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
    );
  }
}
