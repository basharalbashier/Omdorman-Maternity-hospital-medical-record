import 'dart:convert';
import 'package:aldayat_screens/main.dart';
import 'package:aldayat_screens/models/error_message.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/pages/add_obsHistory.dart';
import 'package:aldayat_screens/pages/lab_request_form.dart';
import 'package:aldayat_screens/widgets/genterate_qr_for_file.dart';
import 'package:aldayat_screens/widgets/icr_request.dart';
import 'package:aldayat_screens/widgets/obs_adm_button.dart';
import 'package:aldayat_screens/widgets/private_info_for_static.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../models/user_hive.dart';
import '../widgets/add_baby_file_widget.dart';
import '../widgets/u_s_request.dart';
import 'lab_history.dart';

class FilePage extends StatefulWidget {
  final Map file;
  final Map patient;
  final String type;
  final User user;
  FilePage(
      {super.key,
      required this.file,
      required this.patient,
      required this.type,
      required this.user});

  @override
  State<FilePage> createState() => _PatientPage();
}

class _PatientPage extends State<FilePage> {
  List labRequest = [];
  List obsHistory = [];
  bool showAddObsButton = F;

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
              TitleD(setUniColor(widget.file['unit']), size),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: size.width > 600
                      ? Row(
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
                                  Row(
                                    children: [
                                      Text("Type: "),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        widget.type == "0" ? "OBS" : "Gynae",
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
                                    child: Column(
                                      children: [
                                        Visibility(
                                            visible: widget.user.user!['dep'] ==
                                                'Department of Statistics',
                                            child: addBabyFileWidget(
                                                widget.user,
                                                context,
                                                widget.patient['id'],
                                                widget.file['id'])),
                                        Visibility(
                                          visible: widget.user.user!['dep'] !=
                                              'Department of Statistics',
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              uSRequest(
                                                  context,
                                                  size,
                                                  widget.file,
                                                  widget.user,
                                                  widget.type),
                                              Material(
                                                child: Center(
                                                  child: ElevatedButton(

                                                      // style:ButtonStyle(backgroundColor:Colors.te ),
                                                      onPressed: () {
                                                        Navigator
                                                            .pushAndRemoveUntil(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  AddRequestForm(
                                                                    patient: widget
                                                                        .patient,
                                                                    file: widget
                                                                        .file,
                                                                    type: "0",
                                                                  )),
                                                          (Route<dynamic>
                                                                  route) =>
                                                              true,
                                                        );
                                                      },
                                                      child: SizedBox(
                                                          height: 30,
                                                          child: Center(
                                                            child: Text(
                                                                "Lab Request"),
                                                          ))),
                                                ),
                                              ),
                                              iCuRequest(context, size,
                                                  widget.file, widget.user),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            generatQr(widget.patient, widget.file, widget.type)
                          ],
                        )
                      : Column(
                          children: [
                            Column(
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
                                Row(
                                  children: [
                                    Text("Type: "),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      widget.type == "0" ? "OBS" : "Gynae",
                                      style: fileTitle(size),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Divider(),
                                ),
                                Visibility(
                                    visible: widget.user.user!['dep'] ==
                                        'Department of Statistics',
                                    child: addBabyFileWidget(
                                        widget.user,
                                        context,
                                        widget.patient['id'],
                                        widget.file['id'])),
                                Visibility(
                                  visible: widget.user.user!['dep'] !=
                                      'Department of Statistics',
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        uSRequest(context, size, widget.file,
                                            widget.user, widget.type),
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
                                                              patient: widget
                                                                  .patient,
                                                              file: widget.file,
                                                              type: "0",
                                                            )),
                                                    (Route<dynamic> route) =>
                                                        true,
                                                  );
                                                },
                                                child: SizedBox(
                                                    height: 30,
                                                    child: Center(
                                                      child:
                                                          Text("Lab Request"),
                                                    ))),
                                          ),
                                        ),
                                        iCuRequest(context, size, widget.file,
                                            widget.user),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            generatQr(widget.patient, widget.file, widget.type)
                          ],
                        )),
              Divider(),

              Visibility(
                visible: widget.type == "0" &&
                    showAddObsButton &&
                    widget.user.user!['dep'] != 'Department of Statistics',
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:obsAdmissionButton(context,widget. patient, widget.file, widget.user)
                 
                ),
              ),

              Visibility(
                visible: !labRequest.isEmpty,
                child: SizedBox(
                    width: size.width,
                    height: size.height / 2,
                    child: LabHistory(
                      source: labRequest,
                    )),
              ),

              Visibility(
                  visible:
                      widget.user.user!['dep'] == 'Department of Statistics',
                  child: privateInfo(
                      widget.file, widget.patient, size, context, widget.user)),
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
    if (widget.user.user!['dep'] != 'Department of Statistics') {
      try {
        await http.post(Uri.parse('${url}lab/fileid/${widget.file['id']}'),
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${widget.user.token!}'
            },
            body: {
              "type": widget.type
            }).then((value) {
          getObsHistory();
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
      } catch (e) {
        getObsHistory();
      }
    }
    // ... Navigate To your Home Page
  }

  getObsHistory() async {
    if (widget.user.user!['dep'] != 'Department of Statistics') {
      try {
        await http.post(Uri.parse('${url}obs/fileid/${widget.file['id']}'),
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${widget.user.token!}'
            },
            body: {
              "type": widget.type
            }).then((value) {
          if (value.statusCode == 200) {
            print('Value : ${value.body}');
            setState(() {
              obsHistory = json.decode(value.body);
              if (obsHistory.isEmpty) {
                showAddObsButton = true;
              }
            });
          } else {
            print('Error : ${value.body}');
            errono("${json.decode(value.body)}", "${json.decode(value.body)}",
                context, true, Container(), 1);
          }
        });
      } catch (e) {}
    }
    // ... Navigate To your Home Page
  }
}
