import 'dart:convert';
import 'package:aldayat_screens/main.dart';
import 'package:aldayat_screens/models/error_message.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/pages/add_file.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../models/user_hive.dart';
import 'file_page.dart';

class PatientPage extends StatefulWidget {
  final Map patient;
  int? fileId;
  String? type;
  final User user;
  PatientPage(
      {super.key,
      required this.patient,
      this.fileId,
      this.type,
      required this.user});

  @override
  State<PatientPage> createState() => _PatientPage();
}

class _PatientPage extends State<PatientPage> {
  List files = [];
  List gynFiles = [];

  bool showSorryMessage = F;
  getPatientFiles() async {
    try {
      await http.get(Uri.parse('${url}file/patientid/${widget.patient['id']}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${widget.user.token!}'
          }).then((value) {
        getGyneFiles();
        if (value.statusCode == 200) {
          setState(() {
            files = json.decode(value.body);
          });

          if (widget.fileId != null) {
            for (var file in files) {
              if (file['id'] == widget.fileId && widget.type == '0') {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FilePage(
                            patient: widget.patient,
                            file: file,
                            type: "0",
                            user: widget.user,
                          )),
                  (Route<dynamic> route) => true,
                );
              }
            }
          }
        } else {
          print('Error : ${value.body}');
          errono("${json.decode(value.body)}", "${json.decode(value.body)}",
              context, true, Container(), 1);
        }
      });
    } catch (e) {}
  }

  getGyneFiles() async {
    try {
      await http.get(Uri.parse('${url}gyn/${widget.patient['id']}'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${widget.user.token!}'
      }).then((value) {
        if (value.statusCode == 200) {
          setState(() {
            gynFiles = json.decode(value.body);
          });
          if (gynFiles.isEmpty) {
            setState(() {
              showSorryMessage = true;
            });
          }
          if (widget.fileId != null) {
            for (var file in gynFiles) {
              if (file['id'] == widget.fileId && widget.type == '1') {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FilePage(
                            patient: widget.patient,
                            file: file,
                            type: "1",
                            user: widget.user,
                          )),
                  (Route<dynamic> route) => true,
                );
              }
            }
          }
        } else {
          print('Error : ${value.body}');
          errono("${json.decode(value.body)}", "${json.decode(value.body)}",
              context, true, Container(), 1);
        }
      });
    } catch (e) {}
  }

  @override
  void initState() {
    getPatientFiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.user.token == '') {
      return waitingWidget(widget.user.user!['unit']);
    }
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleD(setUniColor(widget.user.user!['unit']), size),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    widget.patient['name'],
                    style: fileTitle(size),
                  ),
                ),
              ),
              Divider(),
              // Visibility(
              //   visible: widget.user.user!['dep'].toString() ==
              //       'Department of Statistics',
              //   child: Column(
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child:addFile(widget.patient,context,size),
                     
              //       ),
              //       Divider(),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible:
                      files.isEmpty && !showSorryMessage && gynFiles.isEmpty,
                  child:  waitingWidget(widget.user.user!['unit']),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible:
                      (files.isEmpty && gynFiles.isEmpty) && showSorryMessage,
                  child: Center(
                      child: Column(
                    children: [
                      Text("Sorry, Mother"),
                      Text(
                        "${widget.patient['name']}",
                        style: fileTitle(size),
                      ),
                      Text("has no file yet"),
                    ],
                  )),
                ),
              ),
              SizedBox(
                width: size.width,
                child: Row(
                  children: [
                    Visibility(
                      visible: files.isNotEmpty,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              "Obs files",
                              style: fileTitle(size / 2),
                            )),
                          ),
                          for (var item in files)
                            SizedBox(
                              width: size.width / 2,
                              child: Card(
                                child: ListTile(
                                  leading: Text(item['id'].toString()),
                                  title: GestureDetector(
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FilePage(
                                                  file: item,
                                                  patient: widget.patient,
                                                  type: "0",
                                                  user: widget.user,
                                                )),
                                        (Route<dynamic> route) => true,
                                      );
                                    },
                                    child: Text(item['husband']),
                                  ),
                                  subtitle: Text(item['created_at']
                                      .toString()
                                      .substring(0, 10)),

                                  // trailing: T,
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: gynFiles.isNotEmpty,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              "Gynae files",
                              style: fileTitle(size / 2),
                            )),
                          ),
                          for (var item in gynFiles)
                            SizedBox(
                              width: size.width / 2,
                              child: Card(
                                child: ListTile(
                                  leading: Text(item['id'].toString()),
                                  title: GestureDetector(
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FilePage(
                                                  file: item,
                                                  patient: widget.patient,
                                                  type: "1",
                                                  user: widget.user,
                                                )),
                                        (Route<dynamic> route) => true,
                                      );
                                    },
                                    child: Text(item['husband']),
                                  ),
                                  subtitle: Text(item['created_at']
                                      .toString()
                                      .substring(0, 10)),

                                  // trailing: T,
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Login Button

}
