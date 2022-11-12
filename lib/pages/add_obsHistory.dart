import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../constant.dart';
import '../models/check_input_isinteger.dart';

class AddObs extends StatefulWidget {
  const AddObs({
    super.key,
  });

  @override
  State<AddObs> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddObs> {
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

              TitleD(2, size),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Obstetrical History',
                  style: kLoginTitleStyle(size,Colors.black),
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
                // for (int i = 0; i < int.parse(grController.text); i++)
                //   ResponsiveGridCol(
                //     xs: 6,
                //     md: 3,
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0)
                //       child: Container(
                //           height: 100,
                //           alignment: Alignment(0, 0),
                //           // color: Colors.green,
                //           child: TextField(
                //             keyboardType: TextInputType.number,
                //             // controller: paraController,
                //             onChanged: (value) {
                //               setState(() {
                //                 paraInfo[i] = '${i + 1} - $value\n ';
                //               });
                //               // if (int.parse(grController.text) > 0 &&
                //               //     int.parse(paraController.text) > 0) {
                //               //   setState(() {
                //               //     remain = int.parse(grController.text) -
                //               //         int.parse(paraController.text);
                //               //   });
                //               // }
                //             },
                //             decoration: InputDecoration(
                //                 // suffix: Text('+  $remain'),
                //                 label: Text('${i + 1} - ')),
                //           )),
                //     ),
                //   ),
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
                              var edd = DateTime(date.year, date.month + 9, date.day + 9);
                         var dateNow = DateTime.now();
                              var def = edd.difference( dateNow).inDays;
                              
                           

                              var ga = ((280 - def) / 7).toStringAsFixed(0);
                              setState(() {
                                eddCont.text =
                                    '${edd}'
                                        .substring(0, 10);
                                        gAcont.text=ga.toString();
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
                          controller: comment,
                          decoration: InputDecoration(
                              label: const Text(' Comments & Special Plans')),
                        )),
                  ),
                ),
              ]),
              Center(
                child: MaterialButton(
                    color: Colors.amber,
                    child: Text('check'),
                    onPressed: (() {
                      print(fineee);
                    })),
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
