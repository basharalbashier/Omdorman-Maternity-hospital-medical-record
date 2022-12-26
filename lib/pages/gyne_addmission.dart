import 'dart:convert';

import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../constant.dart';
import '../models/error_message.dart';
import '../models/make_request.dart';
import '../models/user_hive.dart';

class GynaeAdmission extends StatefulWidget {
  final Map file;
  final Map patient;
  final User user;
  const GynaeAdmission({
    super.key,
    required this.file,
    required this.patient,
    required this.user,
  });

  @override
  State<GynaeAdmission> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<GynaeAdmission> {
  var mainController = TextEditingController();
  var history_of_presentController = TextEditingController();
  var lmpCont = TextEditingController();

  var cycleController = TextEditingController();
  var imbController = TextEditingController();
  var pmbController = TextEditingController();
  var pcbController = TextEditingController();
  var dyspareuniaController = TextEditingController();
  var vaginal_disController = TextEditingController();
  var previousGynController = TextEditingController();
  var contraceptionContrller = TextEditingController();
  var grController = TextEditingController();
  var gravaidaController = TextEditingController();
  var paraConrtller = TextEditingController();
  var plusControler = TextEditingController();
  var previousCsController = TextEditingController();
  var previous_operationController = TextEditingController();
  var medicationController = TextEditingController();
  var otherContrlller = TextEditingController();

  bool dm = F;
  bool hypert = F;
  bool cardi = F;
  bool thy = F;
  bool others = F;

  bool show = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!show) {
      return Scaffold(
        body: waitingWidget('color'),
      );
    }
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleD(setUniColor(widget.user.user!['unit']), size),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Gynaecology Admission',
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
                    child: SizedBox(
                        width: size.width / 1.1,
                        child: TextField(
                          maxLines: 4,
                          controller: mainController,
                          decoration: InputDecoration(
                              label: const Text('Main Complaint')),
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
                          maxLines: 4,
                          controller: history_of_presentController,
                          decoration: InputDecoration(
                              label: const Text('History of Present Compaint')),
                        )),
                  ),
                ),
              ]),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Gynae History',
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  // height: 100,
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: size.width / 2.3,
                              child: TextField(
                                onSubmitted: (v) {},
                                keyboardType: TextInputType.number,
                                controller: lmpCont,
                                decoration: const InputDecoration(
                                    hintText: "yyyy-MM-dd", label: Text('LMP')),
                              )),
                          SizedBox(
                              width: size.width / 2.3,
                              child: TextField(
                    
                                keyboardType: TextInputType.number,
                                controller: cycleController,
                                decoration: const InputDecoration(
                                    hintText: "yyyy-MM-dd",
                                    label: Text('Cycle')),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: size.width / 5,
                              child: TextField(
                                onSubmitted: (v) {},
                                keyboardType: TextInputType.number,
                                controller: imbController,
                                decoration: const InputDecoration(
                                    hintText: "yyyy-MM-dd", label: Text('IMB')),
                              )),
                          SizedBox(
                              width: size.width / 5,
                              child: TextField(
                           
                                keyboardType: TextInputType.number,
                                controller: pmbController,
                                decoration: const InputDecoration(
                                    hintText: "yyyy-MM-dd", label: Text('PMB')),
                              )),
                          SizedBox(
                              width: size.width / 5,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: pcbController,
                                decoration: InputDecoration(
                                    hintText: "yyyy-MM-dd",
                                    label: const Text('PCB')),
                              )),
                          SizedBox(
                              width: size.width / 5,
                              child: TextField(
                        
                                keyboardType: TextInputType.number,
                                controller: dyspareuniaController,
                                decoration: InputDecoration(
                                    hintText: "yyyy-MM-dd",
                                    label: const Text('Dyspareunia')),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
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
                          controller: vaginal_disController,
                          decoration: InputDecoration(
                              label: const Text('Vaginal Discharge')),
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
                          controller: previousGynController,
                          decoration: InputDecoration(
                              label: const Text('Previous Gynae Operation')),
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
                          controller: contraceptionContrller,
                          decoration: InputDecoration(
                              label: const Text('Contraception')),
                        )),
                  ),
                ),
                ResponsiveGridCol(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                ResponsiveGridCol(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Opstetrical History',
                          style: kLoginTitleStyle(size / 2, Colors.black),
                        ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: size.width / 4,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: grController,
                              decoration:
                                  const InputDecoration(label: Text('GR')),
                            )),
                        SizedBox(
                            width: size.width / 4,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: paraConrtller,
                              decoration: InputDecoration(label: Text('Para')),
                            )),
                        Text('+'),
                        SizedBox(
                            width: size.width / 4,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: plusControler,
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
                          controller: previousCsController,
                          decoration: InputDecoration(
                              label: const Text('Previous C.S')),
                        )),
                  ),
                ),
                ResponsiveGridCol(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                ResponsiveGridCol(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Past Medical History',
                          style: kLoginTitleStyle(size / 2, Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: ResponsiveGridRow(children: [
                        ResponsiveGridCol(
                          xs: 4,
                          md: 3,
                          child: Container(
                            height: 50,
                            alignment: Alignment(0, 0),
                            // color: Colors.purple,
                            child: Row(
                              children: [
                                Checkbox(
                                    value: dm,
                                    onChanged: (v) {
                                      setState(() {
                                        dm = !dm;
                                      });
                                    }),
                                Text(
                                  'DM',
                                  // style: kLoginTitleStyle(size/4),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ResponsiveGridCol(
                          xs: 4,
                          md: 3,
                          child: Container(
                            height: 50,
                            alignment: const Alignment(0, 0),
                            // color: Colors.purple,
                            child: Row(
                              children: [
                                Checkbox(
                                    value: hypert,
                                    onChanged: (v) {
                                      setState(() {
                                        hypert = !hypert;
                                      });
                                    }),
                                Text(
                                  'Hypertention',
                                  // style: kLoginTitleStyle(size/4),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ResponsiveGridCol(
                          xs: 4,
                          md: 3,
                          child: Container(
                            height: 50,
                            alignment: Alignment(0, 0),
                            // color: Colors.purple,
                            child: Row(
                              children: [
                                Checkbox(
                                    value: cardi,
                                    onChanged: (v) {
                                      setState(() {
                                        cardi = !cardi;
                                      });
                                    }),
                                SizedBox(
                                  width: size.width / 5,
                                  child: Text(
                                    'Cardiac Diseases',
                                    // style: kLoginTitleStyle(size/4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ResponsiveGridCol(
                          xs: 4,
                          md: 3,
                          child: Container(
                            height: 50,
                            alignment: const Alignment(0, 0),
                            // color: Colors.purple,
                            child: Row(
                              children: [
                                Checkbox(
                                    value: thy,
                                    onChanged: (v) {
                                      setState(() {
                                        thy = !thy;
                                      });
                                    }),
                                SizedBox(
                                  width: size.width / 6,
                                  child: const Text(
                                    'Throid Disorders',
                                    overflow: TextOverflow.visible,

                                    // style: kLoginTitleStyle(size/4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ResponsiveGridCol(
                          xs: 4,
                          md: 3,
                          child: Container(
                            height: 50,
                            alignment: const Alignment(0, 0),
                            // color: Colors.purple,
                            child: Row(
                              children: [
                                Checkbox(
                                    value: others,
                                    onChanged: (v) {
                                      setState(() {
                                        others = !others;
                                      });
                                    }),
                                SizedBox(
                                  width: size.width / 5,
                                  child: Text(
                                    'Others',
                                    // style: kLoginTitleStyle(size/4),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ResponsiveGridCol(
                          child: Visibility(
                            visible: others,
                            child: Container(
                                height: 50,
                                alignment: Alignment(0, 0),
                                // color: Colors.purple,
                                child: SizedBox(
                                    width: size.width / 1.1,
                                    child: TextField(
                                      maxLines: 5,
                                      controller: otherContrlller,
                                      decoration: InputDecoration(
                                          label: const Text('Others')),
                                    ))),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  child: Container(
                    height: 100,
                    alignment: Alignment(0, 0),
                    // color: Colors.purple,
                    child: SizedBox(
                        width: size.width / 1.1,
                        child: TextField(
                          maxLines: 5,
                          keyboardType: TextInputType.number,
                          controller: previous_operationController,
                          decoration: InputDecoration(
                              label: const Text('Previous Operations')),
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
                          controller: medicationController,
                          decoration: InputDecoration(
                              label: const Text('Medications & Allergies')),
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
                          "patient_name": widget.patient['name'].toString(),
                          "age": widget.patient['age'].toString(),
                          "main_complaint": mainController.text,
                          "history_of_present":
                              history_of_presentController.text,
                          "lmp": lmpCont.text,
                          "cycle": cycleController.text,
                          "imb": imbController.text,
                          "pmb": pmbController.text,
                          "pcb": pcbController.text,
                          "dyspareunia": dyspareuniaController.text,
                          "vaginale_dis": vaginal_disController.text,
                          "contrac": contraceptionContrller.text,
                          "gravida": grController.text,
                          "para":
                              "${paraConrtller.text} + ${plusControler.text}",
                          "previous": previousCsController.text,
                          "dm": dm.toString(),
                          "hypert": hypert.toString(),
                          "cardiac": cardi.toString(),
                          "thy": thy.toString(),
                          "others": others.toString(),
                          "others_text": otherContrlller.text,
                          "previous_operation":
                              previous_operationController.text,
                          "medication": medicationController.text,
                          "dr_id": widget.user.user!['id'].toString(),
                          "patient_id": widget.patient['id'].toString(),
                          "file_id": widget.file['id'].toString(),
                        });
                        String respons = await makeHttpRequest(
                            url + "gynadm/add", body, true, widget.user);

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
