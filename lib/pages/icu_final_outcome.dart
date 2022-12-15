import 'dart:convert';

import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../constant.dart';
import '../main.dart';
import '../models/check_input_isinteger.dart';
import '../models/error_message.dart';
import '../models/make_request.dart';
import '../models/user_hive.dart';
import '../widgets/accept_or_not_lab_request.dart';

class IcuFinalOutCome extends StatefulWidget {
  final Map file;
  final Map patient;
  final User user;
  final int whichCu;
  const IcuFinalOutCome({
    super.key,
    required this.whichCu,
    required this.file,
    required this.patient,
    required this.user,
  });

  @override
  State<IcuFinalOutCome> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<IcuFinalOutCome> {

  var outComeController = TextEditingController();
  var notesController = TextEditingController();
 
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
                  '${widget.whichCu == 0 ? "IC" : "HD"}U Final Outcome & Discharge',
                  style: kLoginTitleStyle(size/1.4, Colors.black),
                ),
              ),
              ResponsiveGridRow(children: [
                ResponsiveGridCol(
                  lg: 12,
                  child: Container(
                    // height: 100,
                    alignment: Alignment(0, 0),
                    // color: Colors.purple,
                    child: SizedBox(
                      
                        width: size.width / 1.1,
                        child: TextField(
                          maxLines: 5,
                          controller: outComeController,
                          decoration:
                              InputDecoration(label: Text('Final ${widget.whichCu == 0 ? "IC" : "HD"}U Outcome')),
                        )),
                  ),
                ),
               
                ResponsiveGridCol(
                  lg: 12,
                  child: Container(
                    // height: 100,
                    alignment: Alignment(0, 0),
                    // color: Colors.purple,
                    child: SizedBox(
                        width: size.width / 1.1,
                        child: TextField(
                          maxLines: 10,
                          controller: notesController,
                          decoration: InputDecoration(
                              label:  Text('Final ${widget.whichCu == 0 ? "IC" : "HD"}U Notes')),
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
                          "final_icu_output": outComeController.text,
                          "final_icu_note": notesController.text,
                          "dr_id": widget.user.user!['id'].toString(),
                          "patient_id": widget.patient['id'].toString(),
                          "file_id": widget.file['id'].toString(),
                          "icu_file_id": widget.file['id'].toString(),
                        });
                        String respons = await makeHttpRequest(
                            url + "icufinal/add", body, true, widget.user);

                        if (respons == "Successfully Sent") {
                          Navigator.of(context).pop();
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
