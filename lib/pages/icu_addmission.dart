import 'dart:convert';

import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/pages/login.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../constant.dart';
import '../models/error_message.dart';
import '../models/make_request.dart';
import '../models/user_hive.dart';

class IcuAddmission extends StatefulWidget {
  final Map request;
  final User user;
  final int whichCu;
  const IcuAddmission({
    super.key,
    required this.whichCu,
    required this.request,
    required this.user,
  });

  @override
  State<IcuAddmission> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<IcuAddmission> {
  bool _hasTekenCare = false;
  var indiOfController = TextEditingController();
  var initialDiaController = TextEditingController();
  var probOneController = TextEditingController();

  var problemTwoController = TextEditingController();
  var proThreeController = TextEditingController();
  var probFourContrller = TextEditingController();
  var detaiColntroller = TextEditingController();
  var pmhController = TextEditingController();
  var modOfDelivery = TextEditingController();
  var wightController = TextEditingController();
  var gestatiolaAge = TextEditingController();

  bool show = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!show) {
      return Scaffold(
        body: waitingWidget('dd'),
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
              TitleD(setUniColor('unit'), size),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${widget.whichCu == 0 ? "IC" : "HD"}U Admission',
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
                          controller: gestatiolaAge,
                          decoration:
                              InputDecoration(label: Text('Gestational Age')),
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
                          controller: indiOfController,
                          decoration: InputDecoration(
                              label: Text(
                                  'Indication of ${widget.whichCu == 0 ? "IC" : "HD"}U admission')),
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
                        child: Row(
                          children: [
                            Text('Regular antenatal care '),
                            Checkbox(
                              value: _hasTekenCare,
                              onChanged: (v) {
                                setState(() {
                                  _hasTekenCare = !_hasTekenCare;
                                });
                              },
                            ),
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
                          controller: initialDiaController,
                          decoration: InputDecoration(
                              label: const Text('Initial diagnosis')),
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
                      'Active Problem list'.toUpperCase(),
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
                              width: size.width / 1.1,
                              child: TextField(
                                onSubmitted: (v) {},
                                keyboardType: TextInputType.number,
                                controller: probOneController,
                                decoration:
                                    const InputDecoration(label: Text('1')),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: size.width / 1.1,
                              child: TextField(
                                onSubmitted: (v) {},
                                keyboardType: TextInputType.number,
                                controller: problemTwoController,
                                decoration:
                                    const InputDecoration(label: Text('2')),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: size.width / 1.1,
                              child: TextField(
                                onSubmitted: (v) {},
                                keyboardType: TextInputType.number,
                                controller: proThreeController,
                                decoration:
                                    const InputDecoration(label: Text('3')),
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: size.width / 1.1,
                              child: TextField(
                                onSubmitted: (v) {},
                                keyboardType: TextInputType.number,
                                controller: probFourContrller,
                                decoration:
                                    const InputDecoration(label: Text('4')),
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
                          maxLines: 5,
                          controller: detaiColntroller,
                          decoration:
                              InputDecoration(label: Text('Detailed History')),
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
                          controller: pmhController,
                          decoration: InputDecoration(label: const Text('PMH')),
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
                          "gest": gestatiolaAge.text,
                          "has_reqular_care": _hasTekenCare.toString(),
                          "mode_of_deliv": modOfDelivery.text,
                          "ind_icu_adm": indiOfController.text,
                          "init_diag": initialDiaController.text,
                          "prob_one": probOneController.text,
                          "prob_two": problemTwoController.text,
                          "prob_three": proThreeController.text,
                          "prob_four": probFourContrller.text,
                          "detailed_history": detaiColntroller.text,
                          "pmh": pmhController.text,
                          "dr_id": widget.user.user!['id'].toString(),
                          "patient_id": widget.request['patient_id'].toString(),
                          "file_id": widget.request['file_id'].toString(),
                          "icu_file_id": widget.whichCu,

                        });
                        String respons = await makeHttpRequest(
                            url + "icuad/add/${widget.request['id']}", body, true, widget.user);

                        if (respons == "Successfully Sent") {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginView()),
                            (Route<dynamic> route) => false,
                          );
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
