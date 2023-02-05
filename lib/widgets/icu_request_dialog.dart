import 'dart:convert';

import 'package:aldayat_screens/models/error_message.dart';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../constant.dart';
import '../models/make_request.dart';
import '../models/user_hive.dart';

Widget iCuRequest(contexte, size, Map file, User user, String type) {
  var remarksController = TextEditingController();

  var commentController = TextEditingController();

  return MaterialButton(
      color: type == "0" ? Colors.pink : Colors.cyan.shade900,
      child: Text(
        '${type == "0" ? "IC" : "HD"}U Request',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: (() async {
        bool show = true;
        await showDialog<void>(
          context: contexte,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return SizedBox(
                    width: size.width,
                    child: !show
                        ? waitingWidget("3")
                        : SingleChildScrollView(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Request to ${type == "0" ? "IC" : "HD"}U department',
                                      style:
                                          kLoginTitleStyle(size, Colors.black),
                                    ),
                                  ),
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
                                        child: Container(
                                          height: 50,
                                          alignment: Alignment(0, 0),
                                          // color: Colors.green,
                                          child: TextFormField(
                                            maxLines: 3,
                                            style: kTextFormFieldStyle(),
                                            controller: commentController,
                                            decoration: const InputDecoration(
                                              // prefixIcon: Icon(Icons.person),
                                              label: Text('Comment'),
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
                                          setState(() => show = !show);
                                          final body = jsonEncode({
                                            'remaks': remarksController.text,
                                            'comment': commentController.text,
                                            // 'type':type,
                                            // 'unit': user.user!['unit'].toString(),
                                            'status': "0",
                                            "dr_id":
                                                user.user['id'].toString(),
                                            "patient_id":
                                                file['patient_id'].toString(),
                                            "file_id": file['id'].toString(),
                                          });
                                          var value = await makeHttpRequest(
                                              '${url}icureq/add',
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
                                          } else {
                                            setState(() => show = true);
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
      }));
}



// 
  
  