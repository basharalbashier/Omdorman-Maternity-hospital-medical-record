import 'dart:convert';

import 'package:aldayat_screens/main.dart';
import 'package:aldayat_screens/models/error_message.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/pages/add_file.dart';
import 'package:aldayat_screens/pages/lab_request_form.dart';
import 'package:aldayat_screens/widgets/genterate_qr_for_file.dart';
import 'package:aldayat_screens/widgets/icr_request.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../models/blood_group.dart';
import '../models/user_hive.dart';
import '../widgets/u_s_request.dart';
import 'lab_history.dart';

class FilePage extends StatefulWidget {
  final Map file;
  final Map patient;
  FilePage({super.key, required this.file, required this.patient});

  @override
  State<FilePage> createState() => _PatientPage();
}

class _PatientPage extends State<FilePage> {
  List labRequest = [];

  User user = User({}, '');
  @override
  void initState() {
    getinfo(context).then((value) => setState(() {
          user = value;
          getLabRequest();
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (user.token == '') {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          strokeWidth: 1,
        )),
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
              TitleD(setUniColor(widget.file['unit']), size),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Mother"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.patient['name'],
                                style: fileTitle(size),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Age: "),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.patient['age'].toString(),
                                style: fileTitle(size),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("File Id: "),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.file['id'].toString(),
                                style: fileTitle(size),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Divider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                uSRequest(context, size, widget.file, user),
                                Material(
                                  child: Center(
                                    child: ElevatedButton(

                                        // style:ButtonStyle(backgroundColor:Colors.te ),
                                        onPressed: () {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AddRequestForm(
                                                      patient: widget.patient,
                                                      file: widget.file,
                                                    )),
                                            (Route<dynamic> route) => true,
                                          );
                                        },
                                        child: SizedBox(
                                            height: 30,
                                            child: Center(
                                              child: Text("Lab Request"),
                                            ))),
                                  ),
                                ),
                                iCuRequest(context, size, widget.file, user),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    generatQr(widget.patient, widget.file)
                  ],
                ),
              ),
              Divider(),

              Visibility(
                visible: !labRequest.isEmpty,
                child: SizedBox(
                    width: size.width,
                    height: size.height / 2,
                    child: LabHistory(
                      source: labRequest,
                    )),
              ),

              //      Visibility(visible: files.isEmpty,
              //     child:Center(
              //     child: CircularProgressIndicator(
              //   strokeWidth: 1,
              // )), ),
              //   for (var item in files)
              //     ListTile(
              //       leading: Text(item['id'].toString()),
              //       title: GestureDetector(
              //         onTap: (){
              //             Navigator.pushAndRemoveUntil(
              //                           context,
              //                           MaterialPageRoute(
              //                               builder: (context) =>  FilePage(patient: item,)),
              //                           (Route<dynamic> route) => true,
              //                         );
              //         },
              //         child: Text(
              //           item['created_at'],
              //         ),
              //       ),
              //       subtitle: Text(item['husbasnd']),

              //       // trailing: T,
              //     )
            ],
          ),
        ),
      ),
    );
  }

  getLabRequest() async {
    try {
      await http.get(Uri.parse('${url}lab/fileid/${widget.file['id']}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${user.token!}'
          }).then((value) {
        if (value.statusCode == 200) {
          setState(() {
            labRequest = json.decode(value.body);
          });
        } else {
          print('Error : ${value.body}');
          errono("${json.decode(value.body)}", "${json.decode(value.body)}",
              context, true, Container(), 1);
        }
      });
    } catch (e) {}
    // ... Navigate To your Home Page
  }
}
