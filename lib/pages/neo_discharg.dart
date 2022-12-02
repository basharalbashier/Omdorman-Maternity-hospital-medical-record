import 'dart:convert';

import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../constant.dart';
import '../main.dart';
import '../models/user_hive.dart';
import 'package:http/http.dart' as http;

class NeonatalDischarg extends StatefulWidget {
  final Map file;
  final User user;
  const NeonatalDischarg({
    super.key,
    required this.file,
    required this.user,
  });

  @override
  State<NeonatalDischarg> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NeonatalDischarg> {
  var dischargDiagnosCont = TextEditingController();
  var disWeghCont = TextEditingController();
  var conditionCon = TextEditingController();
  var feedingCont = TextEditingController();
  var medicaCont = TextEditingController();
  var immuControl = TextEditingController();
  var bcgContro = TextEditingController();
  var hepCont = TextEditingController();
  var polioCont = TextEditingController();
  var vitContro = TextEditingController();
  var fuControll = TextEditingController();
  var referalContr = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var remain = [];
  bool show = true;
  @override
  void initState() {
    remain = [
      ['Discharge of Diagnosis', dischargDiagnosCont],
      ['Discharge Weight', disWeghCont],
      ['Coundition', conditionCon],
      ['Feeding', feedingCont],
      ['Medication', medicaCont],
      ['Immunaization', immuControl],
      ['B C G', bcgContro],

        ['Hep B', hepCont],
      ['Polio', polioCont],
      ['Vit K', vitContro],
      ['F U Date', fuControll],
      ['Referals', referalContr]
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!show) {
      return waitingWidget("5");
    }
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TitleD(Colors.lightBlue, size),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Discharge Note',
                    style: kLoginTitleStyle(size, Colors.black),
                  ),
                ),
                ResponsiveGridRow(children: [
                  for(int i=0;i<5;i++)
                  ResponsiveGridCol(
                    lg: 12,
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      // color: Colors.purple,
                      child: SizedBox(
                          width: size.width / 1.1,
                          child: TextField(
                            controller: remain[i][1],
                            decoration: InputDecoration(
                                label:  Text(remain[i][0])),
                          )),
                    ),
                  ),
                 
                ]),
                SizedBox(
                  height: 30,
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
                            for(int i=5;i<8;i++)
                            SizedBox(
                                width: size.width / 3.2,
                                child: TextField(
                                  onSubmitted: (v) {},
                                  keyboardType: TextInputType.number,
                                  controller: remain[i][1],
                                  decoration:  InputDecoration(
                                   label: Text(remain[i][0])),
                                )),
                          
                         ],
                        ),
                   
                      ],
                    ),
                  ),
                ),
                ResponsiveGridRow(children: [
                  for (int i=8;i < remain.length;i++)
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
                              controller:remain[i][1],
                              decoration: InputDecoration(label: Text( remain[i][0])),
                            )),
                      ),
                    ),
                ]),
                MaterialButton(
                  color: Colors.teal,
                  onPressed: () async {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      setState(() => show = !show);
                      final body = jsonEncode({
                        'patient_name': widget.file['name'].toString(),
                        'dob': widget.file['birth_date'].toString(),
                        'discharg_of_diag': dischargDiagnosCont.text,
                        'birth_weight': disWeghCont.text,
                        'dis_weight': disWeghCont.text,
                        'condition_discharg': conditionCon.text,
                        'feeding': feedingCont.text,
                        'medication': medicaCont.text,
                        'immunaiz': immuControl.text,
                        'bcg': bcgContro.text,
                        'hep': hepCont.text,
                        'polio': polioCont.text,
                        'vit': vitContro.text,
                        'fu_date': fuControll.text,
                        'referals': referalContr.text,
                        'dm': "d.text",
                        // 'other': "admissionDiagnosis.text",
                          // 'other_text': "admissionDiagnosis.text",
                            'previous_operation': "oth.text",



                        "dr_id": widget.user.user!['id'].toString(),
                        "file_id": widget.file['id'].toString(),
                        "patient_id": widget.file['patient_id'].toString(),
                      });
                      try {
                        await http
                            .post(Uri.parse('${url}neodis/add'),
                                headers: {
                                  'Content-type': 'application/json',
                                  'Accept': 'application/json',
                                  'Authorization':
                                      'Bearer ${widget.user.token!}'
                                },
                                body: body)
                            .then((value) {
                          if (value.statusCode == 200 ||
                              value.statusCode == 201) {
                            Navigator.of(context).pop();
                          } else {
                            print(json.decode(value.body)['message']);
                            setState(() => show = !show);
                          }
                        });
                      } catch (e) {
                        setState(() => show = !show);
                      }
                    }
                  },
                  child: Text(
                    'Confirm',
                    style: confirmStyle(size),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
