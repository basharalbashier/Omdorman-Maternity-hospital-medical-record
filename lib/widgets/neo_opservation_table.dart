import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/widgets/table_raw.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../models/user_hive.dart';
import '../models/add_for_table_model.dart';

Widget neoOpservationTable(List data, Size size, context, file, user) {
  List<String> titles = [
    "Date & Time",
    "Temp",
    "R.R",
    "HR",
    "Wt.",
    "Oxygen\nSatoration",
    "Activity",
    "Urine",
    "Stool",
    "Remarks",
    "Sig."
  ];
  List<String> keys = [
  "created_at",
  'temp',
  "r_r",
  "hr",
  "wt",
  "oxygen",
  "activity",
  "urine",
  "stool",
  'remarks',
  'dr_id'
];
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            addButtonModel("+",
                (() async => addToOpservationDialoge(context, file, user))),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(width: 2, color: Colors.grey),
          columnWidths: <int, TableColumnWidth>{},
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              // decoration: BoxDecoration(color: Colors.lime),
              children: <Widget>[
                for (var i in titles)
                  Center(
                    child: Container(
                      // color: Colors.orangeAccent,

                      child: Center(
                          child: Text(
                        i,
                        style: TextStyle(
                            color: Colors.blueGrey.shade900,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
              ],
            ),
            for (var i in data)
            makeTableRaw(i, keys)
          ],
        ),
      ),
    ],
  );
}



Future<void> addToOpservationDialoge(contexte, Map file, User user) async {
  var size = Size(500, 500);
  var tempController = TextEditingController();
  var rrController = TextEditingController();
  var hrController = TextEditingController();
  var wtController = TextEditingController();
  var oxController = TextEditingController();
  var actiController = TextEditingController();
  var urinController = TextEditingController();
  var stooController = TextEditingController();
  var remarkController = TextEditingController();
  List fields = [
    ["Temp", tempController],
    ["R.R", rrController],
    ["HR", hrController],
    ["Wt.", wtController],
    ["Oxygen Satoration", oxController],
    ["Activity", actiController],
    ["Urine", urinController],
    ["Stool", stooController],
    ["Remarks", remarkController]
  ];
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
                         'temp': tempController.text,
                               'r_r': rrController.text,
                                'hr': hrController.text,
                               'wt': wtController.text,
                                'oxygen': oxController.text,
                               'activity': actiController.text,
                                'urine': urinController.text,
                                   'stool': urinController.text,
                               'remarks': remarkController.text,
                              "dr_id": user.user!['id'].toString(),
                              "file_id": file['id'].toString(),
                                    "mother_id": file['patient_id'].toString(),
                        });
                        try {
                          await http
                              .post(Uri.parse('${url}neoops/add'),
                                  headers: {
                                    'Content-type': 'application/json',
                                    'Accept': 'application/json',
                                    'Authorization': 'Bearer ${user.token!}'
                                  },
                                  body: body)
                              .then((value) {
                            if (value.statusCode == 200 ||
                                value.statusCode == 201) {
                              Navigator.of(context).pop();
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
                                'Fill these fields carfully please !',
                                style: fileTitle(size),
                              ),
                            ),
                        
                            Form(
                              key: _formKey,
                              child: ResponsiveGridRow(children: [
                                for (var i in fields)
                                  ResponsiveGridCol(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        alignment: Alignment(0, 0),
                                        // color: Colors.green,
                                        child: TextFormField(
                                          // maxLines: 5,
                                          style: kTextFormFieldStyle(),
                                          controller: i[1],
                                          decoration: InputDecoration(
                                            // prefixIcon: Icon(Icons.person),
                                            label: Text(i[0]),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                            ),
                                          ),
                                          validator: ((v) {
                                            if (v!.length < 1) {
                                              return "fill this field please";
                                            }
                                            return null;
                                          }),
                                        ),
                                      ),
                                    ),
                                  ),
                              ]),
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
