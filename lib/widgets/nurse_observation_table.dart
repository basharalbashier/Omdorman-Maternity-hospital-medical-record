import 'dart:convert';
import 'package:aldayat_screens/widgets/table_raw.dart';
import 'package:http/http.dart' as http;
import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../models/add_for_table_model.dart';
import '../models/user_hive.dart';

List<String> titles = [
  "Date & Time",
  "Temp",
  "Puls\nRate",
  "Resp\nRate",
  "B.P",
  "Urine\nN",
  "Urine\nD",
  "Level of\nConaciouances\nMuscle Tone\nReflex",
  "O2",
  "Odema\nGeneral",
  "Odema\nLL",
  "Urine\nAccetocen",
  "Urine\nSugar",
  "Urine\nProtein",
  "Skin\nColor",
  "Remarks",
  "Spacific\nNursing\nCare\nComment",
  'Dr Name'
];
List<String> keys = [
  "created_at",
  "temp",
  "puls_rate",
  "resp_rate",
  "b_p",
  "urine_output_n",
  "urine_output_d",
  "level_of_conaciouances",
  "o_two",
  "odema_general",
  "odema_ll",
  "urine_acetone",
  "urine_sugar",
  "urine_protein",
  "skin_color",
  "remarks",
  "comment",
  'dr_id'
];
Widget nurseObserTable(List data, context, Map file, User user) {
  Size size = Size(500, 500);

  return Column(
    children: [
      Visibility(
        visible: user.user['dep'] == 'Department of Obstetrics',
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              addButtonModel("+",
                  (() async => addnurseObserTable(context, file, user, size))),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(width: 2, color: Colors.grey),
          columnWidths: <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(),

            // 1: FlexColumnWidth(),
            16: FlexColumnWidth(3),
          },
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                for (var i in titles)
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      height: 32,
                      child: Center(
                          child: Text(
                        textAlign: TextAlign.center,
                        i,
                        // style: fileTitle(size),
                      )),
                    ),
                  ),
              ],
            ),
            for (var row in data)
             makeTableRaw(row, keys)
          ],
        ),
      ),
    ],
  );
}

Future<void> addnurseObserTable(
  contexte,
  Map file,
  User user,
  size,
) async {
  var bp = TextEditingController();
  var ga = TextEditingController();
  var fl = TextEditingController();
  var pres = TextEditingController();
  var eng = TextEditingController();
  var fh = TextEditingController();
  var hb = TextEditingController();
  var urine = TextEditingController();
  var comment = TextEditingController();
  var next_visit = TextEditingController();
  var more = TextEditingController();
  var moree = TextEditingController();
  var moreee = TextEditingController();
  var moreeee = TextEditingController();
  var moreo = TextEditingController();
  var moreeo = TextEditingController();
  var moreeeo = TextEditingController();
  var controllers = [
    bp,
    ga,
    fl,
    pres,
    eng,
    fh,
    hb,
    urine,
    comment,
    next_visit,
    more,
    moree,
    moreee,
    moreeee,
    moreo,
    moreeo,
    moreeeo
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
                          for (int i = 1; i < keys.length - 1; i++)
                            keys[i]: controllers[i - 1].text,
                          "nurse_id": user.user['id'].toString(),
                          "file_id": file['id'].toString(),
                          "patient_id": file['patient_id'].toString(),
                        });

                        try {
                          await http
                              .post(Uri.parse('${url}nurseobserv/add'),
                                  headers: {
                                    'Content-type': 'application/json',
                                    'Accept': 'application/json',
                                    'Authorization': 'Bearer ${user.token}'
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
                                'Fill these fields please !',
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
                                  child: Column(
                                    children: [
                                      for (int i = 0; i < keys.length - 2; i++)
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            alignment: Alignment(0, 0),
                                            // color: Colors.green,
                                            child: TextFormField(
                                              style: kTextFormFieldStyle(),
                                              controller: controllers[i],
                                              decoration: InputDecoration(
                                                // prefixIcon: Icon(Icons.person),
                                                label: Text(titles[i + 1]),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(15)),
                                                ),
                                              ),
                                              validator: ((v) {
                                                if (v!.length < 5) {
                                                  return "Is this a ${titles[i + 1]}?";
                                                }
                                                return null;
                                              }),
                                            ),
                                          ),
                                        ),
                                    ],
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
