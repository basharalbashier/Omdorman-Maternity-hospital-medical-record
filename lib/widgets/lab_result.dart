import 'dart:convert';

import 'package:aldayat_screens/models/make_request.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../main.dart';
import '../models/user_hive.dart';

labResult(Map request, contexte, size, User user) async {
  bool showAll = F;
  Map patientInfo = {};
  List ourTests = [];
  List<MapEntry> singles = request.entries.map((e) => e).toList();
  for (var i = 0; i < singles.length; i++) {
    if (singles[i].value == "true") {
      ourTests.add(singles[i]);
    }
  }

  var firstController = TextEditingController();
  var secondController = TextEditingController();
  var thiredController = TextEditingController();
  var forthController = TextEditingController();
  var fifthController = TextEditingController();

  var comm = TextEditingController();

  List<TextEditingController> controllers = [
    firstController,
    secondController,
    thiredController,
    forthController,
    fifthController
  ];
  http.get(Uri.parse(url + "patient/find/${request['patient_id']}"), headers: {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Baerer ${user.token}'
  }).then((value) async {
    patientInfo = json.decode(value.body);

    showAll = T;
    await showDialog<void>(
      barrierDismissible: F,
      context: contexte,
      builder: (BuildContext context) {
        return AlertDialog(
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              if (!showAll) {
                return Center(
                  child: LinearProgressIndicator(
                    color: setUniColor("general"),
                    backgroundColor: Colors.white,
                  ),
                );
              }
              return SizedBox(
                height: size.height / 2,
                width: size.width,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("Name :  ", style: fileTitle(size)),
                              Text(patientInfo['name'].toString(),
                                  style: fileTitle(size)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Age :  ", style: fileTitle(size)),
                              Text(patientInfo['age'].toString(),
                                  style: fileTitle(size)),
                            ],
                          )
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("ID :  ", style: fileTitle(size)),
                              Text(request['id'].toString(),
                                  style: fileTitle(size)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Investigation :  ", style: fileTitle(size)),
                              Column(
                                children: [
                                  for (var i in ourTests)
                                    Container(
                                        child: Text(
                                      i.key.toString().toUpperCase(),
                                      style: fileTitle(size),
                                    ))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: size.width,
                          child: Column(
                            children: [
                              for (int i = 0; i < ourTests.length; i++)
                                Container(
                                  // height: 100,

                                  alignment: Alignment(0, 0),
                                  // color: Colors.green,
                                  child: TextFormField(
                                    controller: controllers[i],
                                    style: kTextFormFieldStyle(),
                                    decoration: InputDecoration(
                                      // prefixIcon: Icon(Icons.person),
                                      label: Text(ourTests[i]
                                          .key
                                          .toString()
                                          .toUpperCase()),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                    ),
                                    // controller: nameController,
                                    // The validator receives the text that the user has entered.
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: size.width,
                          child: Container(
                            // height: 100,

                            alignment: Alignment(0, 0),
                            // color: Colors.green,
                            child: TextFormField(
                              maxLines: 3,
                              controller: comm,
                              style: kTextFormFieldStyle(),
                              decoration: InputDecoration(
                                // prefixIcon: Icon(Icons.person),
                                label: Text("Comment"),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                              // controller: nameController,
                              // The validator receives the text that the user has entered.
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            color: Colors.red,
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () async {
                              setState(() {
                                showAll = F;
                              });
                              List allInv = [];
                              for (int i = 0; i < ourTests.length; i++) {
                                allInv.add(controllers[i].text);
                              }
                              String item = allInv
                                  .toString()
                                  .replaceAll("[", '')
                                  .replaceAll("]", '')
                                  .replaceAll(",", "\n");
                              var body = jsonEncode({
                                'result': item,
                                "comm": comm.text,
                                "got_by_id": user.user!['id'].toString(),
                                "if_rejected_why": "${DateTime.now()}",
                                "status": "2",
                              });
                              var value = await makeHttpRequest(
                                  url + "lab/update/${request['id']}",
                                  body,
                                  true,
                                  user);
                              if (value[1] == "Successfully sent") {
                                Navigator.of(context).pop();
                              } else {
                                setState(() {
                                  showAll = F;
                                });
                              }
                            },
                            color: Colors.blue,
                            child: Text(
                              'Send',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  });
}
