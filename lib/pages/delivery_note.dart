import 'dart:convert';

import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../models/error_message.dart';
import '../models/make_request.dart';
import '../models/user_hive.dart';
import '../widgets/back_button.dart';

class DeliveryPostnatal extends StatefulWidget {
  final Map patient;
  final Map file;
  final User user;
  const DeliveryPostnatal(
      {super.key,
      required this.patient,
      required this.file,
      required this.user});

  @override
  State<DeliveryPostnatal> createState() => _OperationNoteState();
}

class _OperationNoteState extends State<DeliveryPostnatal> {
  bool placenta = true;
  bool completeOrIncomplda = false;
  bool Lactation = false;

  bool ant_d = false;
  bool other = false;
  bool decir = false;
  bool episi = false;

  bool babySex = false;
  var modOfDelivControler = TextEditingController();
  var commentsController = TextEditingController();

  var weightController = TextEditingController();
  var apgarScorController = TextEditingController();
  var postnatalController = TextEditingController();
  var dateOfDischargController = TextEditingController();

  List checks = [];
  List last = [];
  @override
  void initState() {
    checks = [
      ['Episiotomy', episi],
      ['Decircumcision', decir],
      ['Lactation', Lactation],
      ['Anti D', ant_d]
    ];
    last = [
      ['Postnatal Follow up', postnatalController],
      ['Date Of Discharge', dateOfDischargController],
    ];
    super.initState();
  }

  String whatIsBloodLose = '';
  List bloodLoseList = ['<500 ', '500-1000', '> 1000'];

  bool refar = false;

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
          TitleD(setUniColor(widget.user.user!['unit']), size),
          backButton(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Delivery and Postnatal",
              style: fileTitle(size),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ResponsiveGridRow(children: [
              ResponsiveGridCol(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: size.width / 1.1,
                      child: TextFormField(
                        controller: modOfDelivControler,
                        decoration: InputDecoration(
                          label: Text(
                            "Mode of delivery",
                          ),
                        ),
                      )),
                ),
              ),
              ResponsiveGridCol(
                child: Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Placenta",
                            style: fileTitle(size / 1.4),
                          ),
                          for (int i = 0; i < 2; i++)
                            Row(
                              children: [
                                Checkbox(
                                    value: i == 0 ? placenta : !placenta,
                                    onChanged: ((value) {
                                      setState(() {
                                        placenta = !placenta;
                                      });
                                    })),
                                Text(i == 0 ? 'CCt' : 'MR'),
                              ],
                            ),
                          for (int i = 0; i < 2; i++)
                            Row(
                              children: [
                                Checkbox(
                                    value: i == 0
                                        ? completeOrIncomplda
                                        : !completeOrIncomplda,
                                    onChanged: ((value) {
                                      setState(() {
                                        completeOrIncomplda =
                                            !completeOrIncomplda;
                                      });
                                    })),
                                Text(i == 0 ? 'Complete' : 'Incomplete'),
                              ],
                            ),
                        ]),
                  ),
                ),
              ),
              for (int i = 0; i < checks.length; i++)
                ResponsiveGridCol(
                  xs: 6,
                  md: 3,
                  child: Container(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Checkbox(
                              value: checks[i][1],
                              onChanged: ((value) {
                                setState(() {
                                  checks[i][1] = !checks[i][1];
                                });
                              })),
                          Text(
                            checks[i][0],
                            style: fileTitle(size / 1.4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ResponsiveGridCol(
                child: Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Blood loss",
                          style: fileTitle(size / 1.4),
                        ),
                        for (int i = 0; i < bloodLoseList.length; i++)
                          Row(
                            children: [
                              Text(bloodLoseList[i]),
                              Checkbox(
                                  value: whatIsBloodLose == bloodLoseList[i],
                                  onChanged: ((value) {
                                    setState(() {
                                      whatIsBloodLose = bloodLoseList[i];
                                    });
                                  })),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
              ),
              ResponsiveGridCol(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Comments",
                            style: fileTitle(size / 1.4),
                          ),
                        ],
                      ),
                      TextFormField(
                        maxLines: 3,
                        controller: commentsController,
                      ),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                child: Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Baby",
                          style: fileTitle(size / 1.4),
                        ),
                        for (int i = 0; i < 2; i++)
                          Row(
                            children: [
                              Checkbox(
                                  value: i == 0 ? babySex : !babySex,
                                  onChanged: ((value) {
                                    setState(() {
                                      babySex = !babySex;
                                    });
                                  })),
                              Text(i == 0 ? 'Male' : 'Female'),
                            ],
                          ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width / 4.5,
                                child: TextFormField(
                                  controller: weightController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      label: Text(
                                        'Weight',
                                        style: fileTitle(size / 1.4),
                                      ),
                                      suffix: Text('KG')),
                                ),
                              ),
                              SizedBox(
                                  width: size.width / 4.5,
                                  child: TextFormField(
                                    controller: apgarScorController,
                                    decoration: InputDecoration(
                                      label: Text(
                                        'Apgar Score',
                                        style: fileTitle(size / 1.4),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ResponsiveGridCol(
                child: Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Refer to SCBU",
                            style: fileTitle(size / 1.4),
                          ),
                          for (int i = 0; i < 2; i++)
                            Row(
                              children: [
                                Checkbox(
                                    value: i == 0 ? refar : !refar,
                                    onChanged: ((value) {
                                      setState(() {
                                        refar = !refar;
                                      });
                                    })),
                                Text(i == 0 ? 'Yes' : 'No'),
                              ],
                            ),
                        ]),
                  ),
                ),
              ),
              ResponsiveGridCol(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(),
                ),
              ),
              for (int i = 0; i < last.length; i++)
                ResponsiveGridCol(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: size.width / 1.1,
                        child: TextFormField(
                          maxLines: i < 1 ? 5 : null,
                          controller: last[i][1],
                          decoration: InputDecoration(
                            label: Text(
                              last[i][0],
                            ),
                          ),
                        )),
                  ),
                ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: MaterialButton(
                  color: Colors.amber,
                  child: Text(
                    'Submit',
                    style: kLoginOrSignUpTextStyle(size),
                  ),
                  onPressed: (() async {
                    setState(() {
                      show = !show;
                    });
                    var body = jsonEncode({
                      "mode": modOfDelivControler.text,
                      "placenta": placenta.toString(),
                      "cct": placenta ? "Yes" : "No",
                      "mr": !placenta ? "Yes" : "No",
                      "compelete": completeOrIncomplda ? "Yes" : "No",
                      "incomplete": !completeOrIncomplda ? "Yes" : "No",
                      "episi": episi.toString(),
                      "decir": decir.toString(),
                      "lactation": Lactation.toString(),
                      "ant_d": ant_d.toString(),
                      "blood_loss": whatIsBloodLose,
                      "comment": commentsController.text,
                      "baby_sex": babySex ? "Boy" : "Girl",
                      "weight": weightController.text,
                      "apgar_score": apgarScorController.text,
                      "postnatal_follow_up": postnatalController.text,
                      "date": dateOfDischargController.text,
                      "dr_id": widget.user.user!['id'].toString(),
                      "patient_id": widget.patient['id'].toString(),
                      "file_id": widget.file['id'].toString(),
                    });
                    String respons = await makeHttpRequest(
                        url + "deliv/add", body, true, widget.user);

                    if (respons == "Successfully Sent") {
                      Navigator.of(context).pop();
                    } else {
                      errono(respons, respons, context, true, Container(), 3);
                      setState(() {
                        show = !show;
                      });
                    }
                  })),
            ),
          )
        ],
      )),
    );
  }
}
