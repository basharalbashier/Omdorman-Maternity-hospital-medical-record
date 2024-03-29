import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/widgets/table_raw.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../models/user_hive.dart';

import '../models/add_for_table_model.dart';

Widget neoProgressTable(List data, context, file, user) {
  List<String> titles = ["Date &Time", "Progress", "Dr. Name"];
  List<String> keys = [
    "created_at",
    "progress",
    'dr_id',
  ];
  Size size = Size(500, 500);
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            addButtonModel("+",
                (() async => addToDrProgressDialog(context, file, user, size))),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(width: 2, color: Colors.grey),
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),
            1: FlexColumnWidth(),
            2: IntrinsicColumnWidth(),
          },
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                for (var i in titles)
                  Container(
                    height: 32,
                    child: Center(
                        child: Text(
                      i,
                      style: fileTitle(size),
                    )),
                  ),
              ],
            ),
            for (var i in data) makeTableRaw(i, keys)
          ],
        ),
      ),
    ],
  );
}

Future<void> addToDrProgressDialog(
  contexte,
  Map file,
  User user,
  size,
) async {
  var orderController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool show = true;
  return await showDialog<void>(
    context: contexte,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            Widget submit(size, file, User user) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        setState(() => show = !show);
                        final body = jsonEncode({
                          'progress': orderController.text,
                          "dr_id": user.user['id'].toString(),
                          "file_id": file['id'].toString(),
                          "mother_id": file['patient_id'].toString(),
                        });
                        try {
                          await http
                              .post(Uri.parse('${url}neoprog/add'),
                                  headers: {
                                    'Content-type': 'application/json',
                                    'Accept': 'application/json',
                                    'Authorization': 'Bearer ${user.token}'
                                  },
                                  body: body)
                              .then((value) {
                            if (value.statusCode == 200 ||
                                value.statusCode == 201) {
                              print(value.body);
                            } else {
                              print(value.body);
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
              );
            }

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
                                'Add Progress please !',
                                style: fileTitle(size),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 8,
                            ),
                            ResponsiveGridRow(children: [
                              ResponsiveGridCol(
                                child: Form(
                                  key: _formKey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment(0, 0),
                                      // color: Colors.green,
                                      child: TextFormField(
                                        maxLines: 5,
                                        style: kTextFormFieldStyle(),
                                        controller: orderController,
                                        decoration: const InputDecoration(
                                          // prefixIcon: Icon(Icons.person),
                                          label: Text('Progress'),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                          ),
                                        ),
                                        validator: ((v) {
                                          if (v!.length < 5) {
                                            return "Is this a Progress?";
                                          }
                                          return null;
                                        }),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(
                              height: size.height / 8,
                            ),
                            submit(size, file, user)
                          ]),
                    ),
            );
          },
        ),
      );
    },
  );
}
