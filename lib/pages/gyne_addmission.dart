import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../constant.dart';
import '../models/check_input_isinteger.dart';
import '../widgets/accept_or_not_lab_request.dart';

class GynaeAdmission extends StatefulWidget {
  const GynaeAdmission({
    super.key,
  });

  @override
  State<GynaeAdmission> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<GynaeAdmission> {
  var remain = TextEditingController();
  var grController = TextEditingController();
  var paraController = TextEditingController();

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
  var comment = TextEditingController();
  String fineee = '';
  bool dm = F;
  bool hypert = F;
  bool cardi = F;
  bool thy = F;
  bool others = F;


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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fineee = paraInfo.toString().replaceAll('[', ' ');
    fineee = paraInfo.toString().replaceAll(']', ' ');
    fineee = paraInfo.toString().replaceAll(',', ' ');
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleD(setUniColor('unit'), size),
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
                          controller: comment,
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
                          controller: comment,
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
                                readOnly: true,
                                keyboardType: TextInputType.number,
                                controller: eddCont,
                                decoration:
                                    const InputDecoration( hintText: "yyyy-MM-dd",label: Text('Cycle')),
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
                                controller: lmpCont,
                                decoration: const InputDecoration(
                                hintText: "yyyy-MM-dd", label: Text('IMB')),
                              )),
                          SizedBox(
                              width: size.width / 5,
                              child: TextField(
                                readOnly: true,
                                keyboardType: TextInputType.number,
                                controller: eddCont,
                                decoration: const InputDecoration(
                                    hintText: "yyyy-MM-dd", label: Text('PMB')),
                              )),
                          SizedBox(
                              width: size.width / 5,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: scanEddCont,
                                decoration:
                                    InputDecoration( hintText: "yyyy-MM-dd",label: const Text('PCB')),
                              )),
                          SizedBox(
                              width: size.width / 5,
                              child: TextField(
                                readOnly: true,
                                keyboardType: TextInputType.number,
                                controller: gAcont,
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
                          controller: pastMedicalCont,
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
                          controller: pastSurgicalCont,
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
                          controller: drugHistCont,
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
                              onChanged: (value) {
                                if (checkIfInt(value)) {
                                  // if (int.parse(grController.text) > 0 &&
                                  //     int.parse(paraController.text) > 0) {
                                  //   setState(() {
                                  //     remain = int.parse(grController.text) -
                                  //         int.parse(paraController.text);
                                  //   });
                                  // }
                                } else {
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
                          controller: pastMedicalCont,
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
              ResponsiveGridCol(child:  Padding(
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
                    
                      child: Visibility(visible: others,
                        child: Container(
                          height: 50,
                          alignment: Alignment(0, 0),
                          // color: Colors.purple,
                          child: SizedBox(
                        width: size.width / 1.1,
                        child: TextField(
                          maxLines: 5,
                          controller: chestCont,
                          decoration: InputDecoration(
                              label: const Text('Others')),
                        ))
                        ),
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
                          controller: socialHistorCont,
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
                          controller: chestCont,
                          decoration: InputDecoration(
                              label: const Text('Medications & Allergies')),
                        )),
                  ),
                ),
              
              ]),
              Center(
                child: 
                
              labRequstDialog(context,size),
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
