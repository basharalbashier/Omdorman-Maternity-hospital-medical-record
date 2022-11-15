import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../constant.dart';

class VaginalExam extends StatefulWidget {
  const VaginalExam({super.key});

  @override
  State<VaginalExam> createState() => _VaginalExamState();
}

class _VaginalExamState extends State<VaginalExam> {
  var whatIsBlood = '';
  Size? size;
  var postions = ['Centeral', 'Positional', 'Lateral'];
  var consistencys = ['Soft', 'Hard', 'Firm'];
  var postion = TextEditingController();
  var effacement = TextEditingController();
  var consistency = TextEditingController();
  var dilatation = TextEditingController();
  var station = TextEditingController();
  var postion_presting = TextEditingController();
  var caput = TextEditingController();
  var mulding = TextEditingController();
  var if_ruptured_time = TextEditingController();

  var persinting_postions = [
    'R O L',
    'L O L',
    'O A',
    'O P',
    'R O A',
    'L O A',
    'R O P',
    'L O P'
  ];

  var amount = TextEditingController();
  var meconium = TextEditingController();
  var hb = TextEditingController();
  var bg = TextEditingController();

  var urine = TextEditingController();
  var uss = TextEditingController();

  var ctg = TextEditingController();
  var others = TextEditingController();
  var intact_or_rupured = ['Intact', 'Ruptured'];

  var whatIsintact_or_rupured = 'Intact';

  var spon_arm = ['Spontancous', 'ARM'];

  var amountList = ['Avarage', 'NULL'];

  var meconiumList = ['Thin', 'Thick'];

  var whatIsspon_arm = 'Spontancous';

  DateTime selected = DateTime.now();
  DateTime initial = DateTime(2000);
  DateTime last = DateTime(2025);
  TimeOfDay selectedTime = TimeOfDay.now();

  iosDatePicker(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height * 0.25,
            color: Color.fromRGBO(255, 255, 255, 1),
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              onDateTimeChanged: (value) {
                setState(() {
                  if_ruptured_time.text = value.toString();
                });
              },
              initialDateTime: DateTime.now(),
              minimumYear: 2000,
              maximumYear: 3000,
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Vaginal Examination findings',
                    style: kLoginTitleStyle(size! / 1.5, Colors.black),
                  ),
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'CX',
                    style: kLoginTitleStyle(size! / 2, Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: ResponsiveGridRow(children: [
                  ResponsiveGridCol(
                    xs: 10,
                    md: 2,
                    child: PopupMenuButton<int>(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Dilatation  :  ${dilatation.text} CM',
                                style: fileTitle(size! / 1.5),
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        itemBuilder: (context) => [
                              for (int i = 1; i < 11; i++)
                                PopupMenuItem(
                                  value: i,
                                  // row with 2 children
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("$i"),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text('CM'),
                                    ],
                                  ),

                                  onTap: () {
                                    setState(() {
                                      dilatation.text = "$i";
                                    });
                                  },
                                ),

                              // Pop
                            ]),
                  ),

                  ResponsiveGridCol(
                   xs: 10,
                    md: 2,
                    child: PopupMenuButton<int>(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Position  :  ${postion.text}',
                                style: fileTitle(size! / 1.5),
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        itemBuilder: (context) => [
                              for (int i = 0; i < 3; i++)
                                PopupMenuItem(
                                  value: i,
                                  // row with 2 children
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${postions[i]}"),
                                    ],
                                  ),

                                  onTap: () {
                                    setState(() {
                                      postion.text = postions[i];
                                    });
                                  },
                                ),

                              // Pop
                            ]),
                  ),

                  //  textFi("Dilatation", dilatation, true),
                  ResponsiveGridCol(
          xs: 10,
                    md: 2,
                    child: PopupMenuButton<int>(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Effacement  :  ${effacement.text}  %',
                                style: fileTitle(size! / 1.5),
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        itemBuilder: (context) => [
                              for (int i = 1; i < 101; i++)
                                PopupMenuItem(
                                  value: i,
                                  // row with 2 children
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("$i"),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text('%'),
                                    ],
                                  ),

                                  onTap: () {
                                    setState(() {
                                      effacement.text = i.toString();
                                    });
                                  },
                                ),

                              // Pop
                            ]),
                  ),

                  ResponsiveGridCol(
                 xs: 10,
                    md: 2,
                    child: PopupMenuButton<int>(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Consistency  :  ${consistency.text}',
                                style: fileTitle(size! / 1.5),
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        itemBuilder: (context) => [
                              for (int i = 0; i < 3; i++)
                                PopupMenuItem(
                                  value: i,
                                  // row with 2 children
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${consistencys[i]}"),
                                    ],
                                  ),

                                  onTap: () {
                                    setState(() {
                                      consistency.text = consistencys[i];
                                    });
                                  },
                                ),

                              // Pop
                            ]),
                  ),

                  // textFi("Effacement", effacement, true),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Presenting Part',
                    style: kLoginTitleStyle(size! / 2, Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: ResponsiveGridRow(children: [
                  ResponsiveGridCol(
                    child: PopupMenuButton<int>(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                'Position  :  ${postion_presting.text}',
                                style: fileTitle(size! / 1.5),
                              ),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        itemBuilder: (context) => [
                              for (int i = 0; i < 8; i++)
                                PopupMenuItem(
                                  value: i,
                                  // row with 2 children
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${persinting_postions[i]}"),
                                    ],
                                  ),

                                  onTap: () {
                                    setState(() {
                                      postion_presting.text =
                                          persinting_postions[i];
                                    });
                                  },
                                ),

                              // Pop
                            ]),
                  ),
                  textFi("Station", station, true),
                  textFi("Caput", caput, true),
                  textFi("Moulding", mulding, true),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Membranes',
                    style: kLoginTitleStyle(size! / 2, Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: ResponsiveGridRow(children: [
                  for (int i = 0; i < intact_or_rupured.length; i++)
                    ResponsiveGridCol(
                      xs: 6,
                      md: 2,
                      child: Container(
                        height: 50,
                        alignment: Alignment(0, 0),
                        // color: Colors.purple,

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(intact_or_rupured[i]),
                              Checkbox(
                                  value: whatIsintact_or_rupured ==
                                          intact_or_rupured[i]
                                      ? true
                                      : false,
                                  onChanged: ((value) {
                                    setState(() {
                                      whatIsintact_or_rupured =
                                          intact_or_rupured[i];
                                    });
                                  }))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ResponsiveGridCol(
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      // color: Colors.purple,

                      child: Visibility(
                        visible: whatIsintact_or_rupured == 'Ruptured',
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            readOnly: true,
                            onTap: () {
                              iosDatePicker(context);
                            },
                            onChanged: (v) {},
                            controller: if_ruptured_time,
                            style: kTextFormFieldStyle(),
                            decoration: InputDecoration(
                              label: Text("Time"),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                            // controller: nameController,
                            // The validator receives the text that the user has entered.
                          ),
                        ),
                      ),
                    ),
                  ),
                  for (int i = 0; i < spon_arm.length; i++)
                    ResponsiveGridCol(
                      xs: 6,
                      md: 2,
                      child: Visibility(
                        visible: whatIsintact_or_rupured == 'Ruptured',
                        child: Container(
                          height: 50,
                          alignment: Alignment(0, 0),
                          // color: Colors.purple,

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(spon_arm[i]),
                                Checkbox(
                                    value: whatIsspon_arm == spon_arm[i]
                                        ? true
                                        : false,
                                    onChanged: ((value) {
                                      setState(() {
                                        whatIsspon_arm = spon_arm[i];
                                      });
                                    }))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ResponsiveGridCol(
                    child: Visibility(
                      visible: whatIsintact_or_rupured == 'Ruptured',
                      child: PopupMenuButton<int>(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Amount  :  ${amount.text}',
                                  style: fileTitle(size! / 1.5),
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                          itemBuilder: (context) => [
                                for (int i = 0; i < amountList.length; i++)
                                  PopupMenuItem(
                                    value: i,
                                    // row with 2 children
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("${amountList[i]}"),
                                      ],
                                    ),

                                    onTap: () {
                                      setState(() {
                                        amount.text = amountList[i];
                                      });
                                    },
                                  ),

                                // Pop
                              ]),
                    ),
                  ),
                  ResponsiveGridCol(
                    child: Visibility(
                      visible: whatIsintact_or_rupured == 'Ruptured',
                      child: PopupMenuButton<int>(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Meconium  :  ${meconium.text}',
                                  style: fileTitle(size! / 1.5),
                                ),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                          itemBuilder: (context) => [
                                for (int i = 0; i < meconiumList.length; i++)
                                  PopupMenuItem(
                                    value: i,
                                    // row with 2 children
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("${meconiumList[i]}"),
                                      ],
                                    ),

                                    onTap: () {
                                      setState(() {
                                        meconium.text = meconiumList[i];
                                      });
                                    },
                                  ),

                                // Pop
                              ]),
                    ),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Investigations',
                    style: kLoginTitleStyle(size! / 2, Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: ResponsiveGridRow(children: [
                  textFi("HB", hb, true),
                  ResponsiveGridCol(
                      xs: 4, md: 3, child:  Container(
                  height: 100,
                  alignment: Alignment(0, 0),child: bloodGroup(context, size))),
                  textFi("Urine", urine, true),
                ]),
              ),
            ),
            ResponsiveGridRow(children: [
              ResponsiveGridCol(
                child: Container(
                  height: 100,
                  alignment: Alignment(0, 0),
                  // color: Colors.purple,

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLines: 3,
                      onChanged: (v) {},
                      controller: uss,
                      style: kTextFormFieldStyle(),
                      decoration: InputDecoration(
                        label: Text('USS'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      // controller: nameController,
                      // The validator receives the text that the user has entered.
                    ),
                  ),
                ),
              ),
              ResponsiveGridCol(
                child: Container(
                  height: 100,
                  alignment: Alignment(0, 0),
                  // color: Colors.purple,

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLines: 3,
                      onChanged: (v) {},
                      controller: ctg,
                      style: kTextFormFieldStyle(),
                      decoration: InputDecoration(
                        label: Text("CTG"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      // controller: nameController,
                      // The validator receives the text that the user has entered.
                    ),
                  ),
                ),
              ),
              ResponsiveGridCol(
                child: Container(
                  height: 100,
                  alignment: Alignment(0, 0),
                  // color: Colors.purple,

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLines: 3,
                      onChanged: (v) {},
                      controller: others,
                      style: kTextFormFieldStyle(),
                      decoration: InputDecoration(
                        label: Text('Others'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      // controller: nameController,
                      // The validator receives the text that the user has entered.
                    ),
                  ),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }

  Widget bloodGroup(context, size) {
    var blood = [
      'A - ve',
      'A + ve',
      'B - ve',
      'B + ve',
      'AB - ve',
      'AB +ve',
      'O - ve',
      'O + ve'
    ];

    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return PopupMenuButton<int>(
          itemBuilder: (context) => [
                for (int i = 0; i < blood.length; i++)
                  PopupMenuItem(
                    value: i,
                    // row with 2 children
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(blood[i])
                      ],
                    ),
                  ),
              ],
          offset: const Offset(0, 100),
          elevation: 2,
          // on selected we show the dialog box
          onSelected: (value) {
            // if value 1 show dialog

            setState(() {
              whatIsBlood = blood[value];
            });
          },
          child: Text(
            whatIsBlood == '' ? 'Blood group & RH' : whatIsBlood,
            style: bloodStyle(size / 1.5),
          ));
    });
  }

  ResponsiveGridCol textFi(
      String title, TextEditingController controller, bool visable) {
    return ResponsiveGridCol(
      xs: 4,
      md: 3,
      child: Container(
        height: 100,
        alignment: Alignment(0, 0),
        // color: Colors.purple,

        child: Visibility(
          visible: visable,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (v) {},
              controller: controller,
              style: kTextFormFieldStyle(),
              decoration: InputDecoration(
                label: Text(title),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              // controller: nameController,
              // The validator receives the text that the user has entered.
            ),
          ),
        ),
      ),
    );
  }
}
