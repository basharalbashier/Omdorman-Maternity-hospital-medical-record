import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Neuromuscular extends StatefulWidget {
  const Neuromuscular({super.key});

  @override
  State<Neuromuscular> createState() => _NeuromuscularState();
}

class _NeuromuscularState extends State<Neuromuscular> {
  int post = 0;
  int squ = 0;
  int arm = 0;
  int pop = 0;
  int scarf = 0;
  int heel = 0;

  int ski = 0;
  int lanug = 0;
  int platar = 0;
  int breast = 0;
  int eye = 0;
  int genital = 0;
  int genitalf = 0;
    List<String> postList = [
    'lib/assets/minstery.jpeg',
    'lib/assets/0.jpeg',
    'lib/assets/minstery.jpeg',
    'lib/assets/minstery.jpeg',
    'lib/assets/minstery.jpeg',
    'lib/assets/minstery.jpeg',
    'lib/assets/minstery.jpeg'
  ];
//Image.asset('lib/assets/minstery.jpeg')
  int sum = 0;
  Color amber =
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  List values = [-1, 0, 1, 2, 3, 4, 5];

  List<String> skinList = [
    'Sticky\nInable\nTransparent',
    'Glatinous\nRed\nTransiucent',
    'Smooth Pink\nVisible Veins',
    'Superticial\nPeeling &/or\nRash. Few Veins',
    'Cracking\nPale Areas\nRare Veins',
    'Parchement\nDeep Cracking\nNo Vessels',
    'Leathery\nCracked\nWrinkled'
  ];

  List<String> lanugList = [
    'None',
    'Spares',
    'Abundaant',
    'Thinning',
    'Bald Areas',
    'Mostly Bald',
    ''
  ];

  List<String> platarList = [
    'Heal Toe\n40-50mm:-1\n<40mm:-2',
    '>50 mm\n No Crease',
    'Traint\nRed Marks',
    'Anterior\nTransverse\nCrease Only',
    'Creases\nAnt. 2-3',
    'Creases Over\n Entire Sole',
    ''
  ];

  List<String> breastList = [
    'Imperceptible',
    'Barely\npercptible',
    'Flet Areola\nNo Bud',
    'Stippled Areola\n1-2mm Bud',
    'Raised Areola\n3-4mm Bud',
    'Full Areola\n5-10mm Bud\n',
    ''
  ];

  List<String> eyeList = [
    'Lids Fused\nLaosely:1\nTightly:-2',
    'Lids Open\nPinna Flat\nStays Folded',
    'SI. Curved\nPinna:Soft:\nSlow Recoil',
    'Well-Curved\nPinna:Soft But\nTeady Recoil',
    'Formed & Firm\nInstant Recoil',
    'Thick Carilage\nEar Stiff',
    ''
  ];

  List<String> genitalList = [
    'Scrolum Flat\nSmooth',
    'Scrolum Empty\nTaint Rugae',
    'Teastes in\nUpper Canal\nRare Rugae',
    'Teastes\nDescending\nFew Rugae',
    'Teastes Down\nGood Rugae',
    'Teastes\nPendulous\nDeep Rugae',
    ''
  ];

  List<String> genitalfList = [
    'Clitons\nDrominent\n& Labia Flat',
    'Prominent\nClitons & Small\nLabia Munora',
    'Prominent\nClitons &\nEnlarging\nMunora',
    'Majora &\nMinora Equally\nProminenty',
    'Majora Larg\nMinora Small',
    'Majora\nCover Clitons\nMinora',
    ''
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    sum = post +
        squ +
        arm +
        pop +
        scarf +
        heel +
        ski +
        lanug +
        platar +
        breast +
        eye +
        genital +
        genitalf;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "neuromuscular maturity".toUpperCase(),
                    style: kLoginTitleStyle(size / 3, Colors.black),
                  ),
                ],
              ),
            ),
            Table(
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
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Text("NEUROMUSCULAR\nMATURITY SIGN."),
                      ),
                    ),
                    for (var i in values)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: Container(
                          height: 32,
                          width: 32,
                          child: Center(child: Text(i.toString())),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Text("RECORD\nSCORE\nHERE"),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Text("POSTURE"),
                      ),
                    ),
                    for (int i=0; i< values.length;i++)
                      TableCell(
                        // verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: GestureDetector(
                          onTap: () => setState(() => post = values[i]),
                          child: Container(
                            color: post == values[i]? amber : null,
                            // height: 32,
                            // width: 32,
                            child: Image.asset(postList[i]),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(child: Text(post.toString())),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Text(
                          "SQUARE WINDOW\n(Wrist)",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    for (var i in values)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: GestureDetector(
                          onTap: () => setState(() => squ = i),
                          child: Container(
                            color: squ == i ? amber : null,
                            height: 32,
                            width: 32,
                            child: Center(child: Text(i.toString())),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(child: Text(squ.toString())),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Text("ARM RECOIL"),
                      ),
                    ),
                    for (var i in values)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: GestureDetector(
                          onTap: () => setState(() => arm = i),
                          child: Container(
                            color: arm == i ? amber : null,
                            height: 32,
                            width: 32,
                            child: Center(child: Text(i.toString())),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(child: Text(arm.toString())),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Text("POPLITEAL ANGLE"),
                      ),
                    ),
                    for (var i in values)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: GestureDetector(
                          onTap: () => setState(() => pop = i),
                          child: Container(
                            color: pop == i ? amber : null,
                            height: 32,
                            width: 32,
                            child: Center(child: Text(i.toString())),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(child: Text(pop.toString())),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Text("SCARF SIGN"),
                      ),
                    ),
                    for (var i in values)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: GestureDetector(
                          onTap: () => setState(() => scarf = i),
                          child: Container(
                            color: scarf == i ? amber : null,
                            height: 32,
                            width: 32,
                            child: Center(child: Text(i.toString())),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(child: Text(scarf.toString())),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Text("HEEL TO EAR"),
                      ),
                    ),
                    for (var i in values)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: GestureDetector(
                          onTap: () => setState(() => heel = i),
                          child: Container(
                            color: heel == i ? amber : null,
                            height: 32,
                            width: 32,
                            child: Center(child: Text(i.toString())),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(child: Text(heel.toString())),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "physical maturity".toUpperCase(),
                    style: kLoginTitleStyle(size / 3, Colors.black),
                  ),
                ],
              ),
            ),
            Table(
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
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Text("physical\nmaturity sign.".toUpperCase()),
                      ),
                    ),
                    for (var i in values)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: Container(
                          height: 32,
                          width: 32,
                          child: Center(child: Text(i.toString())),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Text("RECORD\nSCORE\nHERE"),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Text("SKIN"),
                      ),
                    ),
                    for (int i = 0; i < values.length; i++)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: GestureDetector(
                          onTap: () => setState(() => ski = values[i]),
                          child: Container(
                            color: ski == values[i] ? amber : null,
                            width: 32,
                            child: Center(
                                child: Text(
                              skinList[i],
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(child: Text(ski.toString())),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Text("LANUGO"),
                      ),
                    ),
                    for (int i = 0; i < values.length; i++)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: GestureDetector(
                          onTap: () => setState(() => lanug = values[i]),
                          child: Container(
                            color: lanug == values[i] ? amber : null,
                         
                            width: 32,
                            child: Center(child: Text(lanugList[i])),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(child: Text(lanug.toString())),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Text(
                          "PLANTAR\nSURFACE",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    for (int i = 0; i < values.length; i++)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: GestureDetector(
                          onTap: () => setState(() => platar = values[i]),
                          child: Container(
                            color: platar == values[i] ? amber : null,
                            width: 32,
                            child: Center(child: Text(platarList[i])),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(child: Text(platar.toString())),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Text("BREAST"),
                      ),
                    ),
                    for (int i = 0; i < values.length; i++)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: GestureDetector(
                          onTap: () => setState(() => breast = values[i]),
                          child: Container(
                            color: breast == values[i] ? amber : null,
                       
                            width: 32,
                            child: Center(child: Text(breastList[i])),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(child: Text(breast.toString())),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Text("EYE/EAR"),
                      ),
                    ),
                    for (int i = 0; i < values.length; i++)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: GestureDetector(
                          onTap: () => setState(() => eye = values[i]),
                          child: Container(
                            color: eye == values[i] ? amber : null,
                         
                            width: 32,
                            child: Center(child: Text(eyeList[i])),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(child: Text(eye.toString())),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Text(
                          "Genitals\n(Male)",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    for (int i = 0; i < values.length; i++)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: GestureDetector(
                          onTap: () => setState(() => genital = values[i]),
                          child: Container(
                            color: genital == values[i] ? amber : null,
                         
                            width: 32,
                            child: Center(child: Text(genitalList[i])),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(child: Text(genital.toString())),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Text(
                          "Genitals\n(Female)",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    for (int i = 0; i < values.length; i++)
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.bottom,
                        child: GestureDetector(
                          onTap: () => setState(() => genitalf = values[i]),
                          child: Container(
                            color: genitalf == values[i] ? amber : null,
                            height: 32,
                            width: 32,
                            child: Center(child: Text(genitalfList[i])),
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(child: Text(genitalf.toString())),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Center(
                child: Text(
              sum.toString(),
              style: kLoginTitleStyle(size, amber),
            ))
          ],
        ),
      ),
    );
  }
}
