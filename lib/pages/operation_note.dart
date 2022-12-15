import 'dart:convert';

import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../main.dart';
import '../models/error_message.dart';
import '../models/make_request.dart';
import '../models/user_hive.dart';

class OperationNote extends StatefulWidget {
  final Map patient;
  final Map file;
  final User user;
  const OperationNote({super.key, required this.patient, required this.file, required this.user});

  @override
  State<OperationNote> createState() => _OperationNoteState();
}

class _OperationNoteState extends State<OperationNote> {
  bool caesar = false;
  bool ventouse = false;
  bool repair = false;
  bool emergency = false;
  bool forcep = false;
  bool mro = false;
  bool other = false;
  bool elective = false;
  bool incision = false;
  bool ovaries = false;
  bool babySex = false;

  var indicatonOneController = TextEditingController();
  var indicationTwoController = TextEditingController();
  var surgeon = TextEditingController();
  var assistantController = TextEditingController();
  var anaesthetistController = TextEditingController();
  var anaesthesiaController = TextEditingController();
  var weightController = TextEditingController();
  var apgarScorController = TextEditingController();
  var treatmentController = TextEditingController();
  var antibioticsController = TextEditingController();
  var analgesiaController = TextEditingController();
  var anticoagulantController = TextEditingController();
  var ivFluidsController = TextEditingController();
  var bloodController = TextEditingController();
  var recommendationController = TextEditingController();
  var procedureController = TextEditingController();


  List checks = [];
    List last = [];
  @override
  void initState() {
    checks = [
      ['Caesarean Section', caesar],
      ['Ventouse Delivery', ventouse],
      ['Repair of 3rd Degree', repair],
      ['Emergency', emergency],
      ['Forceps Delivery', forcep],
      ['M.R.O Placenta', mro],
      ['Other', other],
      ['Elective', elective]
    ];
    last = [
      ['Treatment', treatmentController],
      [' -Antibiotics', antibioticsController],
      [' -Analgesia', analgesiaController],
      [' -Anticoagulat', anticoagulantController],
      [' -IV Fluids', ivFluidsController],
      [' -Blood Transfusion', bloodController],
      ['Recommendations', recommendationController],
 
    ];
    super.initState();
  }

  String whatIsBloodLose = '';
  List bloodLoseList = ['+/- 500 mls', '+/- 750 mls', '> 100 mls'];
  String whatIsIncision = 'Transverse';
  bool refar = false;

  bool show=true;
  @override
  Widget build(BuildContext context) {
if(!show){
  return Scaffold(body: waitingWidget('color'),);
}

    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [

          TitleD(setUniColor(widget.user.user!['unit']), size),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ResponsiveGridRow(children: [
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
                          Text(checks[i][0]),
                        ],
                      ),
                    ),
                  ),
                ),
              
              ResponsiveGridCol(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(),
                ),
              ),
              ResponsiveGridCol(
                child: Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Incision",
                          style: fileTitle(size),
                        ),
                        for (int i = 0; i < 2; i++)
                          Row(
                            children: [
                              Checkbox(
                                  value: i == 0 ? incision : !incision,
                                  onChanged: ((value) {
                                    setState(() {
                                      incision = !incision;
                                      incision
                                          ? whatIsIncision == 'Transverse'
                                          : whatIsIncision == 'Midline';
                                    });
                                  })),
                              Text(i == 0 ? 'Transverse' : 'Midline'),
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
                            "Procedure",
                            style: fileTitle(size),
                          ),
                        ],
                      ),
                      TextFormField(
                        maxLines: 8,
                        controller: procedureController,
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
                      children: [
                        Text(
                          "Blood loss",
                          style: fileTitle(size),
                        ),
                        for (int i = 0; i < bloodLoseList.length; i++)
                          Row(
                            children: [
                              Checkbox(
                                  value: whatIsBloodLose == bloodLoseList[i],
                                  onChanged: ((value) {
                                    setState(() {
                                      whatIsBloodLose = bloodLoseList[i];
                                    });
                                  })),
                              Text(bloodLoseList[i]),
                            ],
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
                      children: [
                        Text(
                          "Ovaries and tubes checked",
                          style: fileTitle(size),
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: ovaries,
                                onChanged: ((value) {
                                  setState(() {
                                    ovaries = !ovaries;
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
                child: Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Baby",
                          style: fileTitle(size),
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
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(5)),
                                      ),
                                      label: Text(
                                        'Weight',
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
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(5)),
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
                            style: fileTitle(size),
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
                    child: 
                   SizedBox(
                                width: size.width / 1.1,
                                child: TextFormField(
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
                      child: Text('Submit'),
                      onPressed: (() async {
                          setState(() {
                        show=!show;
                      });
                        var body = jsonEncode({
                          "caesarean": caesar.toString(),
                          "ventouse": ventouse.toString(),
                          "repair":repair.toString(),
                          "emergency": emergency.toString(),
                          "forceps": forcep.toString(),
                          "m_r_o": mro.toString(),
                          "other": other.toString(),
                          "elective": elective.toString(),
                          "indication": incision.toString(),
                          "surgeon": surgeon.text,
                          "assistant": assistantController.text,
                          "anaesth": anaesthetistController.text,
                          "anashisia": anaesthesiaController.text,
                          "incision": incision.toString(),
                          "procedure": procedureController.text,
                          "blood_loss": whatIsBloodLose,
                          "ovaries":
                              ovaries.toString(),

                                 "baby_sex": babySex ? "Boy" : "Girl",
                          "weight": weightController.text,
                          "apgar": apgarScorController.text,
                          "refer_to_scbu": refar.toString(),
                          "treatment": treatmentController.text,
                          "antibiotic": antibioticsController.text,
                          "analgesia": analgesiaController.text,
                          "anticoagulant": anticoagulantController.text,
                          "iv_fluids": ivFluidsController.text,
                          "blood_trans": bloodController.text,
                          "recommendation": recommendationController.text,
                       


                          "dr_id": widget.user.user!['id'].toString(),
                          "patient_id": widget.patient['id'].toString(),
                          "file_id": widget.file['id'].toString(),
                        });
                     String respons=await   makeHttpRequest(url + "operation/add", body, true,widget.user);

                     if(respons== "Successfully Sent"){
                      Navigator.of(context).pop();
                     }else{
                      errono(respons, respons, context, true, Container(), 3);
                      setState(() {
                        show=!show;
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
