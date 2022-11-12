import 'package:aldayat_screens/widgets/accept_or_not_lab_request.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../constant.dart';
import '../widgets/title.dart';

class AddRequestForm extends StatefulWidget {
  const AddRequestForm({
    super.key,
  });

  @override
  State<AddRequestForm> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<AddRequestForm> {
  var urine = false;
  var stoolG = false;
  var bffm = false;
  var esr = false;
  var stoolF = false;
  var viral = false;
  var bG = false;

  var cbc = false;
  var sick = false;
  var retic = false;
  var plate = false;
  var coag = false;
  var pt = false;
  var ptt = false;

  var fbg = false;
  var hbb = false;
  var rbg = false;
  var hbAIC = false;
  var crp = false;
  var ca = false;
  var lft = false;
  var rft = false;

  var thy = false;
  var fer = false;
  var ca125 = false;

  var histo = false;
  var cyto = false;

  var urinC = false;
  var stoolCul = false;
  var bloodCul = false;
  var fluidCul = false;
  var wond = false;
  var hiVag = false;
  var comm = TextEditingController();
  // var drugHistCont = TextEditingController();
  // var socialHistorCont = TextEditingController();
  // var familyHistoryCont = TextEditingController();
  // var chestCont = TextEditingController();
  // var comment = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [

                TitleD(4, size),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Lab Request form',
                  style: kLoginTitleStyle(size,Colors.black),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Routine Investigation',
                      style: kLoginTitleStyle(size / 2,Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
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
                                value: urine,
                                onChanged: (v) {
                                  setState(() {
                                    urine = !urine;
                                  });
                                }),
                            Text(
                              'Urine general',
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
                                value: stoolG,
                                onChanged: (v) {
                                  setState(() {
                                    stoolG = !stoolG;
                                  });
                                }),
                            Text(
                              'Stool general',
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
                                value: bffm,
                                onChanged: (v) {
                                  setState(() {
                                    bffm = !bffm;
                                  });
                                }),
                            Text(
                              'B F F M',
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
                                value: esr,
                                onChanged: (v) {
                                  setState(() {
                                    esr = !esr;
                                  });
                                }),
                            SizedBox(
                              width: size.width / 5,
                              child: Text(
                                'E S R',
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
                                value: stoolF,
                                onChanged: (v) {
                                  setState(() {
                                    stoolF = !stoolF;
                                  });
                                }),
                            SizedBox(
                              width: size.width / 6,
                              child: const Text(
                                'Stool for reducing substance',
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
                                value: viral,
                                onChanged: (v) {
                                  setState(() {
                                    viral = !viral;
                                  });
                                }),
                            SizedBox(
                              width: size.width / 5,
                              child: Text(
                                'Viral Screening',
                                // style: kLoginTitleStyle(size/4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      xs: 4,
                      md: 2,
                      child: Container(
                        height: 50,
                        alignment: Alignment(0, 0),
                        // color: Colors.purple,
                        child: Row(
                          children: [
                            Checkbox(
                                value: bG,
                                onChanged: (v) {
                                  setState(() {
                                    bG = !bG;
                                  });
                                }),
                            Text(
                              'B.G',
                              // style: kLoginTitleStyle(size/4),
                            ),
                          ],
                        ),
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
                      'Hematology',
                      style: kLoginTitleStyle(size / 2,Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
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
                                value: cbc,
                                onChanged: (v) {
                                  setState(() {
                                    cbc = !cbc;
                                  });
                                }),
                            Text(
                              'C B C',
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
                                value: sick,
                                onChanged: (v) {
                                  setState(() {
                                    sick = !sick;
                                  });
                                }),
                            Text(
                              'Sickling test',
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
                                value: retic,
                                onChanged: (v) {
                                  setState(() {
                                    retic = !retic;
                                  });
                                }),
                            Text(
                              'Retics Count',
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
                                value: plate,
                                onChanged: (v) {
                                  setState(() {
                                    plate = !plate;
                                  });
                                }),
                            SizedBox(
                              width: size.width / 5,
                              child: Text(
                                'Platelet Count',
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
                                value: coag,
                                onChanged: (v) {
                                  setState(() {
                                    coag = !coag;
                                  });
                                }),
                            SizedBox(
                              width: size.width / 6,
                              child: const Text(
                                'Coagulation',
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
                                value: pt,
                                onChanged: (v) {
                                  setState(() {
                                    pt = !pt;
                                  });
                                }),
                            SizedBox(
                              width: size.width / 5,
                              child: const Text(
                                'PT + INR',
                                // style: kLoginTitleStyle(size/4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      xs: 4,
                      md: 2,
                      child: Container(
                        height: 50,
                        alignment: Alignment(0, 0),
                        // color: Colors.purple,
                        child: Row(
                          children: [
                            Checkbox(
                                value: ptt,
                                onChanged: (v) {
                                  setState(() {
                                    ptt = !ptt;
                                  });
                                }),
                            Text(
                              'PTT',
                              // style: kLoginTitleStyle(size/4),
                            ),
                          ],
                        ),
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
                      'Chemistry',
                      style: kLoginTitleStyle(size / 2,Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
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
                                value: fbg,
                                onChanged: (v) {
                                  setState(() {
                                    fbg = !fbg;
                                  });
                                }),
                            Text(
                              'F B G ',
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
                                value: hbb,
                                onChanged: (v) {
                                  setState(() {
                                    hbb = !hbb;
                                  });
                                }),
                            Text(
                              '2 H B B',
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
                                value: rbg,
                                onChanged: (v) {
                                  setState(() {
                                    rbg = !rbg;
                                  });
                                }),
                            Text(
                              'R B G',
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
                                value: hbAIC,
                                onChanged: (v) {
                                  setState(() {
                                    hbAIC = !hbAIC;
                                  });
                                }),
                            SizedBox(
                              width: size.width / 5,
                              child: Text(
                                'HbAIC',
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
                                value: crp,
                                onChanged: (v) {
                                  setState(() {
                                    crp = !crp;
                                  });
                                }),
                            SizedBox(
                              width: size.width / 6,
                              child: const Text(
                                'C R P',
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
                                value: ca,
                                onChanged: (v) {
                                  setState(() {
                                    ca = !ca;
                                  });
                                }),
                            SizedBox(
                              width: size.width / 5,
                              child: const Text(
                                'Ca',
                                // style: kLoginTitleStyle(size/4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      xs: 4,
                      md: 2,
                      child: Container(
                        height: 100,
                        alignment: Alignment(0, 0),
                        // color: Colors.purple,
                        child: Row(
                          children: [
                            Checkbox(
                                value: lft,
                                onChanged: (v) {
                                  setState(() {
                                    lft = !lft;
                                  });
                                }),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'L F T',
                                  // style: kLoginTitleStyle(size/4),
                                ),
                                Text(
                                  '- T . P',
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text(
                                  '- A L B',
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text(
                                  '- A L P',
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text(
                                  '- A S T',
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text(
                                  '- A L T',
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text(
                                  '- T S B',
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      xs: 4,
                      md: 2,
                      child: Container(
                        height: 100,
                        alignment: Alignment(0, 0),
                        // color: Colors.purple,
                        child: Row(
                          children: [
                            Checkbox(
                                value: rft,
                                onChanged: (v) {
                                  setState(() {
                                    rft = !rft;
                                  });
                                }),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'R F T',
                                  // style: kLoginTitleStyle(size/4),
                                ),
                                Text(
                                  '- urea',
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text(
                                  '- creatine',
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text(
                                  '- u.A',
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text(
                                  '- NA + k',
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                          ],
                        ),
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
                      'Hormone',
                      style: kLoginTitleStyle(size / 2,Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: ResponsiveGridRow(children: [
                    ResponsiveGridCol(
                      xs: 4,
                      md: 2,
                      child: Container(
                        height: 100,
                        alignment: Alignment(0, 0),
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Thyroid profile',
                                  // style: kLoginTitleStyle(size/4),
                                ),
                                Text(
                                  '- T 3',
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text(
                                  '- T 4',
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text(
                                  '- T S H',
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      xs: 4,
                      md: 2,
                      child: Container(
                        height: 100,
                        alignment: Alignment(0, 0),
                        // color: Colors.purple,
                        child: Row(
                          children: [
                            Checkbox(
                                value: fer,
                                onChanged: (v) {
                                  setState(() {
                                    fer = !fer;
                                  });
                                }),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Fertility profile',
                                  // style: kLoginTitleStyle(size/4),
                                ),
                                Text(
                                  '- F S H',
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text(
                                  '- L H',
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text(
                                  '- prolactin',
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      xs: 4,
                      md: 3,
                      child: Container(
                        height: 100,
                        alignment: Alignment(0, 0),
                        // color: Colors.purple,
                        child: Row(
                          children: [
                            Checkbox(
                                value: ca125,
                                onChanged: (v) {
                                  setState(() {
                                    ca125 = !ca125;
                                  });
                                }),
                            Text(
                              'Ca 125',
                              // style: kLoginTitleStyle(size/4),
                            ),
                          ],
                        ),
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
                      'Microbiology',
                      style: kLoginTitleStyle(size / 2,Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
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
                                value: urinC,
                                onChanged: (v) {
                                  setState(() {
                                    urinC = !urinC;
                                  });
                                }),
                            SizedBox(
                              width: size.width / 6,
                              child: Text(
                                'Urine culture + sensitivity',
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
                                value: stoolCul,
                                onChanged: (v) {
                                  setState(() {
                                    stoolCul = !stoolCul;
                                  });
                                }),
                            SizedBox(
                              width: size.width / 6,
                              child: Text(
                                'Stool culture + sensitivity',
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
                        alignment: Alignment(0, 0),
                        // color: Colors.purple,
                        child: Row(
                          children: [
                            Checkbox(
                                value: bloodCul,
                                onChanged: (v) {
                                  setState(() {
                                    bloodCul = !bloodCul;
                                  });
                                }),
                            SizedBox(
                              width: size.width / 5,
                              child: Text(
                                'Blood culture + sensitivity',
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
                                value: fluidCul,
                                onChanged: (v) {
                                  setState(() {
                                    fluidCul = !fluidCul;
                                  });
                                }),
                            SizedBox(
                              width: size.width / 6,
                              child: const Text(
                                'Fluid culture + sensitivity',
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
                                value: wond,
                                onChanged: (v) {
                                  setState(() {
                                    wond = !wond;
                                  });
                                }),
                            SizedBox(
                              width: size.width / 5,
                              child: Text(
                                'Wond swab',
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
                                value: hiVag,
                                onChanged: (v) {
                                  setState(() {
                                    hiVag = !hiVag;
                                  });
                                }),
                            SizedBox(
                              width: size.width / 5,
                              child: Text(
                                'High vaginal swab',
                                // style: kLoginTitleStyle(size/4),
                              ),
                            ),
                          ],
                        ),
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
                      'Histopathology + Cytology',
                      style: kLoginTitleStyle(size / 2,Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: ResponsiveGridRow(children: [
                    ResponsiveGridCol(
                      xs: 4,
                      md: 3,
                      child: Container(
                        height: 100,
                        alignment: Alignment(0, 0),
                        // color: Colors.purple,
                        child: Row(
                          children: [
                            Checkbox(
                                value: histo,
                                onChanged: (v) {
                                  setState(() {
                                    histo = !histo;
                                  });
                                }),
                            Text(
                              'Histopathology',
                              // style: kLoginTitleStyle(size/4),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ResponsiveGridCol(
                      xs: 4,
                      md: 2,
                      child: Container(
                        height: 100,
                        alignment: Alignment(0, 0),
                        // color: Colors.purple,
                        child: Row(
                          children: [
                            Checkbox(
                                value: cyto,
                                onChanged: (v) {
                                  setState(() {
                                    cyto = !cyto;
                                  });
                                }),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Cytology',
                                  // style: kLoginTitleStyle(size/4),
                                ),
                                Text(
                                  '- pap smear',
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text(
                                  '- F N A',
                                  style: TextStyle(fontSize: 11),
                                ),
                                Text(
                                  '- trephine',
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                   
                    width: size.width ,
                    alignment: Alignment(0, 0),
                    // color: Colors.green,
                    child: TextFormField(
                      maxLines: 3,
                      controller: comm,
                      style: kTextFormFieldStyle(),
                      decoration: const InputDecoration(
                        // prefixIcon: Icon(Icons.person),
                  
                        label: Text('Comment'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      // controller: nameController,
                      // The validator receives the text that the user has entered.
                    ),
                  ),
                ),
              
              Center(
                child:labRequstDialog(context,size)
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
