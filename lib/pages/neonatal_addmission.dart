import 'dart:convert';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../constant.dart';
import '../models/user_hive.dart';
import 'package:http/http.dart' as http;

class NeonatalAdmission extends StatefulWidget {
  final Map file;
  final User user;
  const NeonatalAdmission({
    super.key,
    required this.file,
    required this.user,
  });

  @override
  State<NeonatalAdmission> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NeonatalAdmission> {
  var causeCont = TextEditingController();
  var sourceCont = TextEditingController();
  var weight = TextEditingController();
  var lenght = TextEditingController();
  var ofc = TextEditingController();
  var gastation = TextEditingController();
  var dates = TextEditingController();
  var us = TextEditingController();
  var assessment = TextEditingController();

  var generalExam = TextEditingController();
  var resp = TextEditingController();
  var cardiov = TextEditingController();
  var abdom = TextEditingController();
  var cns = TextEditingController();
  var other = TextEditingController();
  var admissionDiagnosis = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var remain = [];
  bool show = true;
  @override
  void initState() {
    remain = [
      ['General Exam', generalExam],
      ['Resp. system', resp],
      ['Cardiovascular', cardiov],
      ['Abdomen', abdom],
      ['C N A', cns],
      ['Other', other],
      ['Admission Diagnosis', admissionDiagnosis]
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
                    'Neonatal Admission',
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
                            controller: sourceCont,
                            decoration: InputDecoration(
                                label: const Text('Source of Admission')),
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
                            controller: causeCont,
                            decoration: InputDecoration(
                                label: const Text('Cause of Admission')),
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
                            SizedBox(
                                width: size.width / 3.2,
                                child: TextField(
                                  onSubmitted: (v) {},
                                  keyboardType: TextInputType.number,
                                  controller: weight,
                                  decoration: const InputDecoration(
                                      hintText: "Kg", label: Text('Weight')),
                                )),
                            SizedBox(
                                width: size.width / 3.2,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: lenght,
                                  decoration: const InputDecoration(
                                      hintText: "CM", label: Text('Lenght')),
                                )),
                            SizedBox(
                                width: size.width / 3.2,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: ofc,
                                  decoration: InputDecoration(
                                      hintText: "", label: const Text('O F C')),
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
                                  controller: gastation,
                                  decoration: const InputDecoration(
                                      hintText: "Weeks",
                                      label: Text('Gestation')),
                                )),
                            SizedBox(
                                width: size.width / 5,
                                child: TextField(
                                  keyboardType: TextInputType.datetime,
                                  controller: dates,
                                  decoration: const InputDecoration(
                                      hintText: "yyyy-MM-dd",
                                      label: Text('Dates')),
                                )),
                            SizedBox(
                                width: size.width / 5,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: us,
                                  decoration: InputDecoration(
                                      hintText: "Weeks",
                                      label: const Text('U S')),
                                )),
                            SizedBox(
                                width: size.width / 5,
                                child: TextField(
                                  controller: assessment,
                                  decoration: InputDecoration(
                                      hintText: "",
                                      label: const Text('Assessment')),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ResponsiveGridRow(children: [
                  for (var i in remain)
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
                              controller: i[1],
                              decoration: InputDecoration(label: Text(i[0])),
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
                        'name': widget.file['name'].toString(),
                        'mr': widget.file['person_in_charg'].toString(),
                        'source_of_adm': sourceCont.text,
                        'cause_of_adm': causeCont.text,
                        'weight': weight.text,
                        'lenght': lenght.text,
                        'ofc': ofc.text,
                        'gestation': gastation.text,
                        'dates': dates.text,
                        'us': us.text,
                        'assesment': assessment.text,
                        'general_exam': generalExam.text,
                        'resp': resp.text,
                        'cardiov': cardiov.text,
                        'abdomen': abdom.text,
                        'cns': cns.text,
                        'other': other.text,
                        'admis_dia': admissionDiagnosis.text,
                        "dr_id": widget.user.user!['id'].toString(),
                        "file_id": widget.file['id'].toString(),
                        "mother_id": widget.file['patient_id'].toString(),
                      });
                      try {
                        await http
                            .post(Uri.parse('${url}neo/add'),
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
