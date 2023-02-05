import 'dart:convert';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../constant.dart';
import '../models/error_message.dart';
import '../models/make_request.dart';
import '../models/user_hive.dart';

class IcuFollow extends StatefulWidget {
  final Map admission;
  final Map patient;
  final User user;
  const IcuFollow({
    super.key,
    required this.admission,
    required this.patient,
    required this.user,
  });

  @override
  State<IcuFollow> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<IcuFollow> {
  var pulsCont = TextEditingController();
  var bpCont = TextEditingController();
  var mapCont = TextEditingController();
  var brifcont = TextEditingController();
  var reactiNCont = TextEditingController();
  var reactYController = TextEditingController();
  var pupNCont = TextEditingController();
  var pupECont = TextEditingController();
  var yCont = TextEditingController();
  var chestC = TextEditingController();
  var sedController = TextEditingController();
  var initC = TextEditingController();
  var icuC = TextEditingController();
  var anal = TextEditingController();
  var para = TextEditingController();
  var ctController = TextEditingController();
  var mriController = TextEditingController();
  var anticon = TextEditingController();
  var sedaCont = TextEditingController();
  var vassController = TextEditingController();
  var inotropContorller = TextEditingController();
  var ecgController = TextEditingController();
  var fioC = TextEditingController();
  var peepC = TextEditingController();
  var mapC = TextEditingController();
  var poC = TextEditingController();

  var modeC = TextEditingController();
  var vtC = TextEditingController();
  var rrCont = TextEditingController();
  var o2Con = TextEditingController();

  var pipC = TextEditingController();
  var platC = TextEditingController();
  var residC = TextEditingController();
  var compC = TextEditingController();
  var naC = TextEditingController();
  var kCont = TextEditingController();
  var mgCont = TextEditingController();
  var ciCount = TextEditingController();

  var biCount = TextEditingController();
  var po4Count = TextEditingController();
  var bunCount = TextEditingController();
  var crCount = TextEditingController();

  var avgCount = TextEditingController();
  var intakCount = TextEditingController();
  var outCount = TextEditingController();
  var fluidCount = TextEditingController();

  var streesCont = TextEditingController();
  var feedCont = TextEditingController();
  var dvtCont = TextEditingController();
  var actiPtCont = TextEditingController();

  var rsbC = TextEditingController();
  var nifC = TextEditingController();

  var activ1Cont = TextEditingController();
  var activ2Cont = TextEditingController();
  var activ3Cont = TextEditingController();

  var activ4Cont = TextEditingController();

  var postCont = TextEditingController();
  var organisCont = TextEditingController();
  var sensiCont = TextEditingController();

  var centeralCont = TextEditingController();
  var catherCont = TextEditingController();

  var darinCont = TextEditingController();
  var planCoun = TextEditingController();
  var ettCont = TextEditingController();
  var activProblemList = [];

  List nervList = [];
  List setTable = [];

  List vassopTable = [];
  List oxyList = [];

  List ventList = [];
  List dynaList = [];
  List warnList = [];

  List healthList = [];

  List renalList = [];
  List gitList = [];
  var sponList = [];

  bool show = true;
  @override
  void initState() {
    setTable = [
      ["Sedative drugs", sedController],
      ["Analgesia", anal],
      ["Paraytics", para],
      ["Anticonvulsant", anticon],
      ["Sedation Score", sedaCont],
    ];

    vassopTable = [
      ["Vassopressor", vassController],
      ["inotropes", inotropContorller],
      ["ecg/echo", ecgController],
    ];
    oxyList = [
      ["FIO2", fioC],
      ["PEEP", peepC],
      ["MAP", mapC],
      ["PO2", poC],
    ];

    ventList = [
      ["Mode", modeC],
      ["VT", vtC],
      ["RR", rrCont],
      ["O2 sat%", o2Con],
    ];

    dynaList = [
      ["PIP", pipC],
      ["Plateau", platC],
      ["Resistance", residC],
      ["Compliance", compC],
    ];
//
    warnList = [
      ["RSBI", rsbC],
      ["NIF", nifC],
    ];
    healthList = [
      ["Stress ulcer bleeding prophylaxis", streesCont],
      ["Feeding", feedCont],
      ["DVT prophylaxis", dvtCont],
      ["Activity/PT/OT", actiPtCont],
    ];
    //
    renalList = [
      ["Na", naC],
      ["K", kCont],
      ["Mg", mgCont],
      ["CI", ciCount],
      ["Bicarb", biCount],
      ["PO4", po4Count],
      ["BUN", bunCount],
      ["Cr", crCount],
      ["AVG hourly UOP", avgCount],
      ["24 hour intake", intakCount],
      ["24 hour output", outCount],
      ["Fluid Balance", fluidCount],
    ];
    //
    nervList = [
      ['GCS', gcsC],
      ['E:', eC],
      ["V:", vC],
      ["M:", mC],
      ['=/15', fifteenC]
    ];
    //

    gitList = [
      ['Git : aBdominal exam', gitC],
      ['Obst.examination: ', obsC],
      ['U/S', usC],
      ['Fetal heart sounds/CTG', fetalC],
      ['Surgical drains:', surC]
    ];
//
    sponList = [
      ['Spont breathing with O2:', sponC],
      ['Without O2:', witC],
      ['RR:', rr2Cont],
      ['SPO2:', spoC]
    ];
    activProblemList = [
      activ1Cont,
      activ2Cont,
      activ3Cont,
      activ4Cont,
    ];
    super.initState();
  }

  var sponC = TextEditingController();
  var witC = TextEditingController();
  var rr2Cont = TextEditingController();
  var spoC = TextEditingController();

  var gitC = TextEditingController();
  var obsC = TextEditingController();
  var surC = TextEditingController();
  var usC = TextEditingController();
  var fetalC = TextEditingController();

  var gcsC = TextEditingController();
  var eC = TextEditingController();
  var vC = TextEditingController();
  var mC = TextEditingController();
  var fifteenC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (!show) {
      return Scaffold(
        body: waitingWidget('jd'),
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
              TitleD(Colors.deepOrangeAccent, size),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${widget.admission['icu_file_id'] == "0" ? "ICU" : "HDU"} Follow Up',
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
                          controller: initC,
                          decoration: InputDecoration(
                              label: const Text('Initial diagnosis')),
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
                          maxLines: 3,
                          controller: icuC,
                          decoration: InputDecoration(
                              label: Text(
                                  '${widget.admission['icu_file_id'] == "0" ? "ICU" : "HDU"} diagnosis')),
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
                      for (int i = 0; i < 4; i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                width: size.width / 1.1,
                                child: TextField(
                                  onSubmitted: (v) {},
                                  keyboardType: TextInputType.number,
                                  controller: activProblemList[i],
                                  decoration: InputDecoration(
                                      label: Text((i + 1).toString())),
                                )),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Brief History:'.toUpperCase(),
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: size.width / 1.1,
                      child: TextField(
                        maxLines: 5,
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: brifcont,
                        decoration: const InputDecoration(label: Text('')),
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Recent Event in 24 hours:'.toUpperCase(),
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: size.width / 1.1,
                      child: TextField(
                        maxLines: 5,
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: sedController,
                        decoration: const InputDecoration(label: Text('')),
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Nervous system:'.toUpperCase().toUpperCase(),
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i in nervList)
                    SizedBox(
                        width: size.width / 6,
                        child: TextField(
                          onSubmitted: (v) {},
                          keyboardType: TextInputType.number,
                          controller: i[1],
                          decoration: InputDecoration(label: Text(i[0])),
                        )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('PUPILS:'),
                  Text('EQUAl:'),
                  SizedBox(
                      width: size.width / 10,
                      child: TextField(
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: yCont,
                        decoration: const InputDecoration(label: Text('Y')),
                      )),
                  SizedBox(
                      width: size.width / 10,
                      child: TextField(
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: pupECont,
                        decoration: const InputDecoration(label: Text('E:')),
                      )),
                  SizedBox(
                      width: size.width / 10,
                      child: TextField(
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: pupNCont,
                        decoration: const InputDecoration(label: Text("N:")),
                      )),
                  Text('REACTIVE:'),
                  SizedBox(
                      width: size.width / 10,
                      child: TextField(
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: reactYController,
                        decoration: const InputDecoration(label: Text("Y:")),
                      )),
                  SizedBox(
                      width: size.width / 10,
                      child: TextField(
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: reactiNCont,
                        decoration: const InputDecoration(label: Text("N:")),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                    border: TableBorder.all(),
                    columnWidths: const <int, TableColumnWidth>{
                      0: IntrinsicColumnWidth(),
                      1: FlexColumnWidth(),
                      2: FlexColumnWidth(),
                      8: IntrinsicColumnWidth(),
                      //  2: FixedColumnWidth(64),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                      for (int i = 0; i < setTable.length; i++)
                        TableRow(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text("${i + 1}")),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(setTable[i][0]),
                            ),
                            SizedBox(
                                width: size.width / 3.2,
                                child: TextField(
                                  onSubmitted: (v) {},
                                  keyboardType: TextInputType.number,
                                  controller: setTable[i][1],
                                  decoration:
                                      const InputDecoration(label: Text("")),
                                ))
                          ],
                        ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                    border: TableBorder.all(),
                    columnWidths: const <int, TableColumnWidth>{
                      0: FlexColumnWidth(),
                      1: FlexColumnWidth(),

                      //  2: FixedColumnWidth(64),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("CT")),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("MRI")),
                          ),
                        ],
                      ),
                      TableRow(
                        children: <Widget>[
                          SizedBox(
                              width: size.width / 2.2,
                              child: TextField(
                                onSubmitted: (v) {},
                                keyboardType: TextInputType.number,
                                controller: ctController,
                                decoration:
                                    const InputDecoration(label: Text("")),
                              )),
                          SizedBox(
                              width: size.width / 2.2,
                              child: TextField(
                                onSubmitted: (v) {},
                                keyboardType: TextInputType.number,
                                controller: mriController,
                                decoration:
                                    const InputDecoration(label: Text("")),
                              ))
                        ],
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Cardiovascular system:'.toUpperCase(),
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('PULSE:'),
                  SizedBox(
                      width: size.width / 10,
                      child: TextField(
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: pulsCont,
                        decoration: const InputDecoration(label: Text('Y')),
                      )),
                  Text('BP:'),
                  SizedBox(
                      width: size.width / 10,
                      child: TextField(
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: bpCont,
                        decoration: const InputDecoration(label: Text('E:')),
                      )),
                  Text('MAP:'),
                  SizedBox(
                      width: size.width / 10,
                      child: TextField(
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: mapCont,
                        decoration: const InputDecoration(label: Text("N:")),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                    border: TableBorder.all(),
                    columnWidths: const <int, TableColumnWidth>{
                      0: IntrinsicColumnWidth(),
                      1: FlexColumnWidth(),
                      2: FlexColumnWidth(),

                      //  2: FixedColumnWidth(64),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                      for (int i = 0; i < vassopTable.length; i++)
                        TableRow(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text("${i + 1}")),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  vassopTable[i][0].toString().toUpperCase()),
                            ),
                            SizedBox(
                                width: size.width / 3.2,
                                child: TextField(
                                  onSubmitted: (v) {},
                                  keyboardType: TextInputType.number,
                                  controller: vassopTable[i][1],
                                  decoration:
                                      const InputDecoration(label: Text("")),
                                ))
                          ],
                        ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Pulmonary:',
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                for (var i in sponList)
                  Row(
                    children: [
                      Text(i[0]),
                      SizedBox(
                          width: size.width / 10,
                          child: TextField(
                            onSubmitted: (v) {},
                            keyboardType: TextInputType.number,
                            controller: i[1],
                            decoration: const InputDecoration(label: Text('')),
                          )),
                    ],
                  ),
              ]),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Chest Examination:'.toUpperCase(),
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  width: size.width / 1.2,
                  child: TextField(
                    maxLines: 3,
                    onSubmitted: (v) {},
                    keyboardType: TextInputType.number,
                    controller: chestC,
                    decoration: const InputDecoration(label: Text("")),
                  )),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'On mv:'.toUpperCase(),
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Oxygenation'),
                      Text('Ventilation'),
                      Text('Dynamics'),
                      Text('Weaning Parameters'),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width / 4.1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Table(
                              border: TableBorder.all(),
                              columnWidths: const <int, TableColumnWidth>{
                                0: FlexColumnWidth(),
                                1: FlexColumnWidth(),

                                //  2: FixedColumnWidth(64),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: <TableRow>[
                                for (int i = 0; i < oxyList.length; i++)
                                  TableRow(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(oxyList[i][0]),
                                      ),
                                      SizedBox(
                                          width: size.width / 3.2,
                                          child: TextField(
                                            onSubmitted: (v) {},
                                            keyboardType: TextInputType.number,
                                            controller: oxyList[i][1],
                                            decoration: const InputDecoration(
                                                label: Text("")),
                                          ))
                                    ],
                                  ),
                              ]),
                        ),
                      ),
                      SizedBox(
                        width: size.width / 4.1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Table(
                              border: TableBorder.all(),
                              columnWidths: const <int, TableColumnWidth>{
                                0: FlexColumnWidth(),
                                1: FlexColumnWidth(),

                                //  2: FixedColumnWidth(64),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: <TableRow>[
                                for (int i = 0; i < ventList.length; i++)
                                  TableRow(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(ventList[i][0]),
                                      ),
                                      SizedBox(
                                          width: size.width / 3.2,
                                          child: TextField(
                                            onSubmitted: (v) {},
                                            keyboardType: TextInputType.number,
                                            controller: ventList[i][1],
                                            decoration: const InputDecoration(
                                                label: Text("")),
                                          ))
                                    ],
                                  ),
                              ]),
                        ),
                      ),
                      SizedBox(
                        width: size.width / 4.1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Table(
                              border: TableBorder.all(),
                              columnWidths: const <int, TableColumnWidth>{
                                0: FlexColumnWidth(),
                                1: FlexColumnWidth(),

                                //  2: FixedColumnWidth(64),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: <TableRow>[
                                for (int i = 0; i < dynaList.length; i++)
                                  TableRow(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(dynaList[i][0]),
                                      ),
                                      SizedBox(
                                          width: size.width / 3.2,
                                          child: TextField(
                                            onSubmitted: (v) {},
                                            keyboardType: TextInputType.number,
                                            controller: dynaList[i][1],
                                            decoration: const InputDecoration(
                                                label: Text("")),
                                          ))
                                    ],
                                  ),
                              ]),
                        ),
                      ),
                      SizedBox(
                        width: size.width / 4.1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Table(
                              border: TableBorder.all(),
                              columnWidths: const <int, TableColumnWidth>{
                                0: FlexColumnWidth(),
                                1: FlexColumnWidth(),

                                //  2: FixedColumnWidth(64),
                              },
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: <TableRow>[
                                for (int i = 0; i < warnList.length; i++)
                                  TableRow(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(warnList[i][0]),
                                      ),
                                      SizedBox(
                                          width: size.width / 3.2,
                                          child: TextField(
                                            onSubmitted: (v) {},
                                            keyboardType: TextInputType.number,
                                            controller: warnList[i][1],
                                            decoration: const InputDecoration(
                                                label: Text("")),
                                          ))
                                    ],
                                  ),
                              ]),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              for (var i in gitList)
                Container(
                  height: 100,
                  alignment: Alignment(0, 0),
                  // color: Colors.purple,

                  child: SizedBox(
                      width: size.width / 1.1,
                      child: TextField(
                        maxLines: 3,
                        controller: i[1],
                        decoration:
                            InputDecoration(label: Text(i[0].toUpperCase())),
                      )),
                ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Infectious Diseases',
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Fever Pattern:',
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Positive culture site:'),
                  SizedBox(
                      width: size.width / 10,
                      child: TextField(
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: postCont,
                        decoration: const InputDecoration(label: Text('')),
                      )),
                  Text('Organism:'),
                  SizedBox(
                      width: size.width / 10,
                      child: TextField(
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: organisCont,
                        decoration: const InputDecoration(label: Text('')),
                      )),
                  Text('Sensitive to:'),
                  SizedBox(
                      width: size.width / 10,
                      child: TextField(
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: sensiCont,
                        decoration: const InputDecoration(label: Text("")),
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Central line\nSITE and days:'),
                  SizedBox(
                      width: size.width / 10,
                      child: TextField(
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: centeralCont,
                        decoration: const InputDecoration(label: Text('')),
                      )),
                  Text('catheter days:'),
                  SizedBox(
                      width: size.width / 10,
                      child: TextField(
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: catherCont,
                        decoration: const InputDecoration(label: Text('')),
                      )),
                  Text('drains:'),
                  SizedBox(
                      width: size.width / 10,
                      child: TextField(
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: darinCont,
                        decoration: const InputDecoration(label: Text("")),
                      )),
                  Text('ETT'),
                  SizedBox(
                      width: size.width / 10,
                      child: TextField(
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: ettCont,
                        decoration: const InputDecoration(label: Text("")),
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'Renal Electrolytes, Fluid Metabolic:',
                    style: kLoginTitleStyle(size / 2, Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width / 4.1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                          border: TableBorder.all(),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(),
                            1: FlexColumnWidth(),

                            //  2: FixedColumnWidth(64),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: <TableRow>[
                            for (int i = 0; i < renalList.length - 9; i++)
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(renalList[i][0]),
                                  ),
                                  SizedBox(
                                      width: size.width / 3.2,
                                      child: TextField(
                                        onSubmitted: (v) {},
                                        keyboardType: TextInputType.number,
                                        controller: renalList[i][1],
                                        decoration: const InputDecoration(
                                            label: Text("")),
                                      ))
                                ],
                              ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: size.width / 4.1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                          border: TableBorder.all(),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(),
                            1: FlexColumnWidth(),

                            //  2: FixedColumnWidth(64),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: <TableRow>[
                            for (int i = 3; i < renalList.length - 6; i++)
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(renalList[i][0]),
                                  ),
                                  SizedBox(
                                      width: size.width / 4.2,
                                      child: TextField(
                                        onSubmitted: (v) {},
                                        keyboardType: TextInputType.number,
                                        controller: renalList[i][1],
                                        decoration: const InputDecoration(
                                            label: Text("")),
                                      ))
                                ],
                              ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: size.width / 4.1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                          border: TableBorder.all(),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(),
                            1: FlexColumnWidth(),

                            //  2: FixedColumnWidth(64),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: <TableRow>[
                            for (int i = 6; i < renalList.length - 3; i++)
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(renalList[i][0]),
                                  ),
                                  SizedBox(
                                      width: size.width / 4.2,
                                      child: TextField(
                                        onSubmitted: (v) {},
                                        keyboardType: TextInputType.number,
                                        controller: renalList[i][1],
                                        decoration: const InputDecoration(
                                            label: Text("")),
                                      ))
                                ],
                              ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: size.width / 4.1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                          border: TableBorder.all(),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(),
                            1: FlexColumnWidth(),

                            //  2: FixedColumnWidth(64),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: <TableRow>[
                            for (int i = 9; i < renalList.length; i++)
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(renalList[i][0]),
                                  ),
                                  SizedBox(
                                      width: size.width / 4.2,
                                      child: TextField(
                                        onSubmitted: (v) {},
                                        keyboardType: TextInputType.number,
                                        controller: renalList[i][1],
                                        decoration: const InputDecoration(
                                            label: Text("")),
                                      ))
                                ],
                              ),
                          ]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    'Health Maintenance'.toUpperCase(),
                    style: kLoginTitleStyle(size / 2, Colors.black),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width / 2.1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                          border: TableBorder.all(),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(),
                            1: FlexColumnWidth(),

                            //  2: FixedColumnWidth(64),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: <TableRow>[
                            for (int i = 0; i < healthList.length - 2; i++)
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(healthList[i][0]),
                                  ),
                                  SizedBox(
                                      width: size.width / 3.2,
                                      child: TextField(
                                        onSubmitted: (v) {},
                                        keyboardType: TextInputType.number,
                                        controller: healthList[i][1],
                                        decoration: const InputDecoration(
                                            label: Text("")),
                                      ))
                                ],
                              ),
                          ]),
                    ),
                  ),
                  SizedBox(
                    width: size.width / 2.1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                          border: TableBorder.all(),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(),
                            1: FlexColumnWidth(),

                            //  2: FixedColumnWidth(64),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: <TableRow>[
                            for (int i = 2; i < healthList.length; i++)
                              TableRow(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(healthList[i][0]),
                                  ),
                                  SizedBox(
                                      width: size.width / 3.2,
                                      child: TextField(
                                        onSubmitted: (v) {},
                                        keyboardType: TextInputType.number,
                                        controller: healthList[i][1],
                                        decoration: const InputDecoration(
                                            label: Text("")),
                                      ))
                                ],
                              ),
                          ]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Plan of management:'.toUpperCase(),
                      style: kLoginTitleStyle(size / 2, Colors.black),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: size.width / 1.1,
                      child: TextField(
                        maxLines: 5,
                        onSubmitted: (v) {},
                        keyboardType: TextInputType.number,
                        controller: planCoun,
                        decoration: const InputDecoration(label: Text('')),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                    color: Colors.amber,
                    child: Text('Submit'),
                    onPressed: (() async {
                      setState(() {
                        show = !show;
                      });
                      var body = jsonEncode({
                        "init_diag": initC.text,
                        "icu_diag": icuC.text,
                        "pro_one": activ1Cont.text,
                        "pro_two": activ2Cont.text,
                        "pro_three": activ3Cont.text,
                        "pro_four": activ4Cont.text,
                        "brif_history": brifcont.text,
                        "recent_in_24": residC.text,
                        "gcs": gcsC.text,
                        "e": eC.text,
                        "v": vC.text,
                        "m": mC.text,
                        "fifteen": fifteenC.text,
                        "pup_y": yCont.text,
                        "pup_n": pupNCont.text,
                        "react_y": reactYController.text,
                        "react_n": reactiNCont.text,
                        "sedat_drug": sedController.text,
                        "analgesia": anal.text,
                        "paraly": para.text,
                        "anti": anticon.text,
                        "sedation": sedaCont.text,
                        "ct": ctController.text,
                        "mri": mriController.text,
                        "pulse": pulsCont.text,
                        "bp": bpCont.text,
                        "vassopr": vassController.text,
                        "inotro": inotropContorller.text,
                        "ecg_echo": ecgController.text,
                        "with_o2": sponC.text,
                        "without_o2": witC.text,
                        "pulmonary_rr": rrCont.text,
                        "spo2": spoC.text,
                        "chest_exam": chestC.text,
                        "fio2": fioC.text,
                        "peep": peepC.text,
                        "map": mapC.text,
                        "po2": poC.text,
                        "mode": modeC.text,
                        "vt": vtC.text,
                        "rr": rrCont.text,
                        "o2": o2Con.text,
                        "pip": pipC.text,
                        "platea": platC.text,
                        "resistance": residC.text,
                        "compliance": compC.text,
                        "rsbi": rsbC.text,
                        "nif": nifC.text,
                        "git": gitC.text,
                        "us": usC.text,
                         "obs": obsC.text,
                        "fetal_heart": fetalC.text,
                        "surgical_drains": surC.text,
                        "postive_culture_site": postCont.text,
                        "organism": organisCont.text,
                        "sensitive_to": sensiCont.text,
                        "central_site": centeralCont.text,
                        "drains": darinCont.text,
                        "ett": ettCont.text,
                        "na": naC.text,
                        "k": kCont.text,
                         "mg": kCont.text,
                        "ci": ciCount.text,
                        "bicarb": biCount.text,
                        "po4": po4Count.text,
                        "bun": bunCount.text,
                        "cr": crCount.text,
                        "avg": avgCount.text,
                        "intake": intakCount.text,
                        "output": outCount.text,
                        "fluid": fluidCount.text,
                        "stress_ulcer": streesCont.text,
                        "feeding": feedCont.text,
                        "dvt": dvtCont.text,
                        "activity_pt": actiPtCont.text,
                        "plan_of_management": planCoun.text,
                        "dr_id": widget.user.user['id'].toString(),
                        "patient_id": widget.patient['id'].toString(),
                        "file_id": widget.admission['file_id'].toString(),
                      });
                      String respons = await makeHttpRequest(
                          url + "icufollow/add", body, true, widget.user);

                      if (respons == "Successfully Sent") {
                        Navigator.of(context).pop();
                      } else {
                        errono(respons, respons, context, true, Container(), 3);
                        setState(() {
                          show = !show;
                        });
                      }
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
