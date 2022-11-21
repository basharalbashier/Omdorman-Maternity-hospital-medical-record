import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../constant.dart';
import '../models/check_input_isinteger.dart';
import '../widgets/accept_or_not_lab_request.dart';

class ClinicalExam extends StatefulWidget {
  const ClinicalExam({
    super.key,
  });

  @override
  State<ClinicalExam> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ClinicalExam> {
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
  bool dm = F;
  bool hypert = F;
  bool cardi = F;
  bool thy = F;
  bool others = F;

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
              TitleD(setUniColor('unit'), size),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Clinical Examination',
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
               
                          controller: comment,
                          decoration: InputDecoration(
                              label: const Text('General apperance')),
                        )),
                  ),
                ),
                ResponsiveGridCol(child:   Padding(
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
                              width: size.width / 3.2,
                              child: TextField(
                                onSubmitted: (v) {},
                                keyboardType: TextInputType.number,
                                controller: lmpCont,
                                decoration: const InputDecoration(
                                  label: Text('BP')),
                              )),
                          SizedBox(
                              width: size.width /  3.2,
                              child: TextField(
                                readOnly: true,
                                keyboardType: TextInputType.number,
                                controller: eddCont,
                                decoration:
                                    const InputDecoration( label: Text('Pulse')),
                              )),
                                SizedBox(
                              width: size.width / 3.2,
                              child: TextField(
                                readOnly: true,
                                keyboardType: TextInputType.number,
                                controller: eddCont,
                                decoration:
                                    const InputDecoration(label: Text('Temp.')),
                              )),
                        ],
                      ),
                
                    ],
                  ),
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
                          maxLines: 3,
                          controller: comment,
                          decoration: InputDecoration(
                              label: const Text('Heart & Chest Finding')),
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
                          controller: comment,
                          decoration: InputDecoration(
                              label: const Text('Abdominal Findings')),
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
                      'Speculm & Digital Vaginal Findings',
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
                               label: Text('Valuva')),
                              )),
                          SizedBox(
                              width: size.width / 2.3,
                              child: TextField(
                                readOnly: true,
                                keyboardType: TextInputType.number,
                                controller: eddCont,
                                decoration:
                                    const InputDecoration(label: Text('Vagina')),
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
                                controller: lmpCont,
                                decoration: const InputDecoration(
                           label: Text('Cervix')),
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
                                controller: lmpCont,
                                decoration: const InputDecoration(
                           label: Text('Uterus')),
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
                                controller: lmpCont,
                                decoration: const InputDecoration(
                           label: Text('Adnexae')),
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
                          maxLines: 2,
                          controller: pastMedicalCont,
                          decoration: InputDecoration(
                              label: const Text('Diagnosis')),
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
                              label: const Text('Comment ')),
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
