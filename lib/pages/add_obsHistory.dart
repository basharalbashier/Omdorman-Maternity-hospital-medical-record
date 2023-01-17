import 'dart:convert';

import 'package:aldayat_screens/models/error_message.dart';
import 'package:aldayat_screens/models/make_request.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/models/user_hive.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../constant.dart';
import '../models/check_input_isinteger.dart';
import '../widgets/back_button.dart';

class AddObs extends StatefulWidget {
  final Map file;
  final Map patient;
  final User user;
  const AddObs({
    super.key,
    required this.file,
    required this.patient,
    required this.user,
  });

  @override
  State<AddObs> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddObs> {
  var remain = TextEditingController();
  var grController = TextEditingController();
  var paraController = TextEditingController();
  var commController = TextEditingController();
  var lmpCont = TextEditingController();
  var eddCont = TextEditingController();
  var scanEddCont = TextEditingController();
  var pastMedicalCont = TextEditingController();
  var pastSurgicalCont = TextEditingController();
  var drugHistCont = TextEditingController();
  var socialHistorCont = TextEditingController();
  var familyHistoryCont = TextEditingController();
  var chestCont = TextEditingController();
  var gAcont = TextEditingController();
  var commentAndSocialController = TextEditingController();
  bool show = true;
  List<String> paraInfo = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  @override
  void initState() {
    genralList = [
      ["Hypertention", hype],
      ["Diabetes", diabe],
      ["Multiple Pregnancy", multi]
    ];

    super.initState();
  }

  List genralList = [];
  bool hype = false;
  bool diabe = false;
  bool multi = false;

  @override
  Widget build(BuildContext context) {
    if (!show) {
      return Scaffold(body: waitingWidget(widget.user.user['unit']));
    }
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleD(setUniColor(widget.user.user['unit']), size),
              backButton(context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Obstetrical History',
                  style: kLoginTitleStyle(size, Colors.black),
                ),
              ),
              ResponsiveGridRow(children: [
                ResponsiveGridCol(
                  lg: 12,
                  child: Container(
                    height: 100,
                    alignment: Alignment(0, 0),
                    // color: Colors.purple,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: size.width / 4,
                            child: TextField(
                              onChanged: (value) {
                                if (!checkIfInt(value)) {
                                  setState(() {
                                    grController.text = '';
                                  });
                                }
                              },
                              keyboardType: TextInputType.number,
                              controller: grController,
                              decoration:
                                  const InputDecoration(label: Text('GR')),
                            )),
                        SizedBox(
                            width: size.width / 4,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: paraController,
                              onChanged: (value) {
                                if (!checkIfInt(value)) {
                                  setState(() {
                                    paraController.clear();
                                  });
                                }
                              },
                              decoration: InputDecoration(label: Text('Para')),
                            )),
                        Text('+'),
                        SizedBox(
                            width: size.width / 4,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: remain,
                              onChanged: (value) {
                                if (!checkIfInt(value)) {
                                  setState(() {
                                    remain.clear();
                                  });
                                }
                              },

                              // decoration: InputDecoration(
                              //     suffix: Text('+  $remain'),
                              //     label: Text('Para')),
                            )),
                      ],
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  lg: 12,
                  child: Container(
                    height: 100,
                    alignment: Alignment(0, 0),
                    // color: Colors.purple,
                    child: SizedBox(
                        width: size.width / 1.1,
                        child: TextField(
                          maxLines: 5,
                          controller: commController,
                          decoration:
                              InputDecoration(label: const Text(' Comments')),
                        )),
                  ),
                ),
              ]),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  // height: 100,
                  color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: size.width / 5,
                          child: TextField(
                            onSubmitted: (v) {
                              DateTime date = DateFormat("yyyy-MM-dd").parse(v);
                              var edd = DateTime(
                                  date.year, date.month + 9, date.day + 7);
                              var dateNow = DateTime.now();
                              var def = edd.difference(dateNow).inDays;

                              var ga = ((280 - def) / 7).toStringAsFixed(0);
                              setState(() {
                                eddCont.text = '${edd}'.substring(0, 10);
                                gAcont.text = ga.toString();
                              });
                            },
                            keyboardType: TextInputType.number,
                            controller: lmpCont,
                            decoration: const InputDecoration(
                                hintText: "yyyy-MM-dd", label: Text('LMP')),
                          )),
                      SizedBox(
                          width: size.width / 5,
                          child: TextField(
                            readOnly: true,
                            keyboardType: TextInputType.number,
                            controller: eddCont,
                            decoration: const InputDecoration(
                                hintText: "yyyy-MM-dd", label: Text('EDD')),
                          )),
                      SizedBox(
                          width: size.width / 5,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: scanEddCont,
                            decoration: InputDecoration(
                                hintText: "yyyy-MM-dd",
                                label: const Text('Scan EDD')),
                          )),
                      SizedBox(
                          width: size.width / 5,
                          child: TextField(
                            readOnly: true,
                            keyboardType: TextInputType.number,
                            controller: gAcont,
                            decoration: InputDecoration(
                                prefix: Text('+/-  '),
                                suffix: Text('Weeks'),
                                label: const Text('GA')),
                          )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              ResponsiveGridRow(children: [
                ResponsiveGridCol(
                  lg: 12,
                  child: Container(
                    height: 100,
                    alignment: Alignment(0, 0),
                    // color: Colors.purple,
                    child: SizedBox(
                        width: size.width / 1.1,
                        child: TextField(
                          controller: pastMedicalCont,
                          decoration: InputDecoration(
                              label: const Text('Past Medical History')),
                        )),
                  ),
                ),
                ResponsiveGridCol(
                  lg: 12,
                  child: Container(
                    height: 100,
                    alignment: Alignment(0, 0),
                    // color: Colors.purple,
                    child: SizedBox(
                        width: size.width / 1.1,
                        child: TextField(
                          controller: pastSurgicalCont,
                          decoration: InputDecoration(
                              label: const Text('Past Surgical History')),
                        )),
                  ),
                ),
                ResponsiveGridCol(
                  lg: 12,
                  child: Container(
                    height: 100,
                    alignment: Alignment(0, 0),
                    // color: Colors.purple,
                    child: SizedBox(
                        width: size.width / 1.1,
                        child: TextField(
                          controller: drugHistCont,
                          decoration: InputDecoration(
                              label: const Text('Drug History')),
                        )),
                  ),
                ),
                ResponsiveGridCol(
                  lg: 12,
                  child: Container(
                    height: 100,
                    alignment: Alignment(0, 0),
                    // color: Colors.purple,
                    child: SizedBox(
                        width: size.width / 1.1,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: socialHistorCont,
                          decoration: InputDecoration(
                              label: const Text('Social History')),
                        )),
                  ),
                ),
                ResponsiveGridCol(
                  lg: 12,
                  child: Container(
                    height: 100,
                    alignment: Alignment(0, 0),
                    // color: Colors.purple,
                    child: Text(
                      'Family History',
                      style: fileTitle(size),
                    ),
                  ),
                ),
                for (int i = 0; i < genralList.length; i++)
                  ResponsiveGridCol(
                    xs: 6,
                    md: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 100,
                          alignment: Alignment(0, 0),
                          // color: Colors.green,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: genralList[i][1],
                                  onChanged: (v) {
                                    setState(() {
                                      genralList[i][1] = v;
                                    });
                                  }),
                              Text(genralList[i][0])
                            ],
                          )),
                    ),
                  ),
                ResponsiveGridCol(
                  lg: 12,
                  child: Container(
                    height: 100,
                    alignment: Alignment(0, 0),
                    // color: Colors.purple,
                    child: SizedBox(
                        width: size.width / 1.1,
                        child: TextField(
                          maxLines: 5,
                          controller: familyHistoryCont,
                          decoration:
                              InputDecoration(label: const Text(' Others')),
                        )),
                  ),
                ),
                ResponsiveGridCol(
                  lg: 12,
                  child: Container(
                    height: 100,
                    alignment: Alignment(0, 0),
                    // color: Colors.purple,
                    child: SizedBox(
                        width: size.width / 1.1,
                        child: TextField(
                          maxLines: 5,
                          controller: chestCont,
                          decoration: InputDecoration(
                              label: const Text('Chest CVS  Examination')),
                        )),
                  ),
                ),
                ResponsiveGridCol(
                  lg: 12,
                  child: Container(
                    height: 100,
                    alignment: Alignment(0, 0),
                    // color: Colors.purple,
                    child: SizedBox(
                        width: size.width / 1.1,
                        child: TextField(
                          maxLines: 5,
                          controller: commentAndSocialController,
                          decoration: InputDecoration(
                              label: const Text(' Comments & Special Plans')),
                        )),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: MaterialButton(
                      color: Colors.amber,
                      child: Text('Submit'),
                      onPressed: (() async {
                        setState(() {
                          show = !show;
                        });
                        var body = jsonEncode({
                          "gr": grController.text,
                          "para": "${paraController.text} + ${remain.text}",
                          "comment": commController.text,
                          "lmp": lmpCont.text,
                          "edd": eddCont.text,
                          "scan_edd": scanEddCont.text,
                          "weeks": gAcont.text,
                          "past_m_history": pastMedicalCont.text,
                          "past_s_history": pastSurgicalCont.text,
                          "drug_history": drugHistCont.text,
                          "social_history": socialHistorCont.text,
                          "hypertention": genralList[0][1].toString(),
                          "diabetes": genralList[1][1].toString(),
                          "multiple_pregnancy": genralList[2][1].toString(),
                          "others": familyHistoryCont.text,
                          "chest_cvs_exam": chestCont.text,
                          "comments_and_social_plans":
                              commentAndSocialController.text,
                          "dr_id": widget.user.user['id'].toString(),
                          "patient_id": widget.patient['id'].toString(),
                          "file_id": widget.file['id'].toString(),
                        });
                        String respons = await makeHttpRequest(
                            url + "obs/add", body, true, widget.user);

                        if (respons == "Successfully Sent") {
                          Navigator.of(context).pop();
                        } else {
                          errono(
                              respons, respons, context, true, Container(), 3);
                          setState(() {
                            show = !show;
                          });
                        }
                      })),
                ),
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
