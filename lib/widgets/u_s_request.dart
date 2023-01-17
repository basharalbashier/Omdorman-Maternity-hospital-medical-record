import 'dart:convert';
import 'package:aldayat_screens/models/am_or_pm_time.dart';
import 'package:aldayat_screens/models/error_message.dart';
import 'package:aldayat_screens/models/get_request.dart';
import 'package:aldayat_screens/models/make_request.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../constant.dart';
import '../models/user_hive.dart';
import '../pages/us_respons_output.dart';

Widget uSRequest(
    contexte, size, Map file, User user, String type, List oldRequsts) {
  var remarksController = TextEditingController();
  var usOneController = TextEditingController();
  var usTwoController = TextEditingController();
  var usThreeController = TextEditingController();
  var usFourController = TextEditingController();

  var usFiveController = TextEditingController();
  var usSixController = TextEditingController();
  int number = 1;

  return Stack(
    fit: StackFit.loose,
    children: [
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: MaterialButton(
            color: Colors.amber,
            child: Text(
              'U/S Request',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: (() async {
              await showDialog<void>(
                context: contexte,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return SizedBox(
                          width: size.width,
                          child: SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ResponsiveGridRow(children: [
                                    ResponsiveGridCol(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 50,
                                          alignment: Alignment(0, 0),
                                          // color: Colors.green,
                                          child: TextFormField(
                                            maxLines: 2,
                                            controller: remarksController,
                                            style: kTextFormFieldStyle(),
                                            decoration: const InputDecoration(
                                              // prefixIcon: Icon(Icons.person),
                                              label: Text('Remarks'),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                            ),
                                            // controller: nameController,
                                            // The validator receives the text that the user has entered.
                                          ),
                                        ),
                                      ),
                                    ),
                                    ResponsiveGridCol(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Complaint of',
                                              style: kLoginTitleStyle(
                                                  size, Colors.black),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (number < 6) {
                                                    number++;
                                                  }
                                                });
                                              },
                                              child: Text(
                                                'Add',
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    for (int i = 0; i < number; i++)
                                      ResponsiveGridCol(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: 50,
                                            alignment: Alignment(0, 0),
                                            // color: Colors.green,
                                            child: TextFormField(
                                              style: kTextFormFieldStyle(),
                                              controller: usOneController,
                                              decoration: InputDecoration(
                                                // prefixIcon: Icon(Icons.person),
                                                label: Text('${i + 1} /'),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                              ),
                                              // controller: nameController,
                                              // The validator receives the text that the user has entered.
                                            ),
                                          ),
                                        ),
                                      ),
                                  ]),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MaterialButton(
                                        color: Colors.pink,
                                        onPressed: () async {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'Cancel',
                                          style: confirmStyle(size),
                                        ),
                                      ),
                                      MaterialButton(
                                        color: Colors.teal,
                                        onPressed: () async {
                                          final body = jsonEncode({
                                            'remarks': remarksController.text,
                                            'unit':
                                                user.user!['unit'].toString(),
                                            'us_one': usOneController.text,
                                            'us_two': usTwoController.text,
                                            'us_three': usThreeController.text,
                                            'us_four': usFourController.text,
                                            'us_five': usFiveController.text,
                                            'us_six': usSixController.text,
                                            'status': "0",
                                            "dr_id":
                                                user.user!['id'].toString(),
                                            "patient_id":
                                                file['patient_id'].toString(),
                                            "file_id": file['id'].toString(),
                                            'money': "free",
                                            'type': type,
                                          });
                                          var value = await makeHttpRequest(
                                              '${url}usrequest/add',
                                              body,
                                              true,
                                              user);
                                          if (value[1] == "Successfully sent") {
                                            errono(
                                                "Request sent successfully",
                                                "Request sent successfully",
                                                context,
                                                true,
                                                Container(),
                                                2);
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: Text(
                                          'Confirm',
                                          style: confirmStyle(size),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            })),
      ),
      Positioned(
        top: -15,
        left: -15,
        child: Visibility(
          visible: oldRequsts.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton<int>(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      minRadius: 10,
                      maxRadius: 15,
                      // radius: 10,
                      backgroundColor: Colors.pink,
                      child: Text(
                        '${oldRequsts.length}',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                itemBuilder: (context) => [
                      for (int i = 0; i < oldRequsts.length; i++)
                        PopupMenuItem(
                            value: i,
                            // row with 2 children
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Text(
                                //     "${oldRequsts[i]['type'] == "0" ? "ICU" : "HDU"} Request"),
                                // Text("${oldRequsts[i]['comment']}"),
                                oldRequsts[i]['status'] == "0"
                                    ? Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Pending..',
                                              style: fileTitle(size),
                                            ),
                                          ),
                                          LinearProgressIndicator(
                                            color: Colors.pink,
                                          )
                                        ],
                                      )
                                    : oldRequsts[i]['status'] == "1"
                                        ? Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text('In Progress ..',
                                                    style: fileTitle(size)),
                                              ),
                                              LinearProgressIndicator(
                                                color: Colors.amber,
                                              )
                                            ],
                                          )
                                        : oldRequsts[i]['status'] == "2"
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.check,
                                                    color: Colors.teal,
                                                  ),
                                                  Text("Ready")
                                                ],
                                              )
                                            : Container(),
                                Text(amOrPm(oldRequsts[i]['created_at'], true)
                                    .replaceAll("\n", " ")),
                                Divider()
                              ],
                            ),
                            onTap: () async => Future.delayed(
                                    Duration(seconds: 1))
                                .then((value) async => oldRequsts[i]
                                            ['status'] ==
                                        "2"
                                    ? {
                                        await getIt('usresponse', user, context,
                                                file['id'].toString())
                                            .then((value) => value[0]
                                                        ['request_id'] ==
                                                    oldRequsts[i]['id']
                                                        .toString()
                                                ? Get.to(() => UsResponseOutput(
                                                    data: value[0]))
                                                : print('problem made me mad!'))
                                      }
                                    : null)),

                      // Pop
                    ]),
          ),
        ),
      )
    ],
  );
}

//
