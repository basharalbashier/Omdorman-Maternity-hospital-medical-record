import 'dart:convert';
import 'package:aldayat_screens/pages/icu_addmission.dart';
import 'package:aldayat_screens/widgets/new_open_mother_file.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../constant.dart';
import '../main.dart';
import '../models/user_hive.dart';
import 'waiting_widget.dart';

class ShowRequestInfo extends StatefulWidget {
  final Map request;
  final User user;
  const ShowRequestInfo({super.key, required this.request, required this.user});

  @override
  State<ShowRequestInfo> createState() => _ShowRequestInfoState();
}

class _ShowRequestInfoState extends State<ShowRequestInfo> {
  var responsController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isAccepted = true;
  bool show = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            naoOpenMotherFileButton(context, widget.request, widget.user),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Request Info',
                style: fileTitle(size),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(width: 2, color: Colors.grey),
                columnWidths: const <int, TableColumnWidth>{
                  0: FlexColumnWidth(),
                  // 1: FlexColumnWidth(),
                },
                children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('ID'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.request['id'].toString()),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Remarks'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.request['remaks']),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Comment'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.request['comment']),
                    )
                  ])
                ],
              ),
            ),
            SizedBox(
              height: size.height / 8,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isAccepted ? 'Accept The Patient' : "Reject The Patient",
                      style: fileTitle(size),
                    ),
                    Checkbox(
                        value: isAccepted,
                        onChanged: (value) =>
                            setState(() => isAccepted = !isAccepted))
                  ],
                ),
              ),
            ),
            Visibility(
              visible: !isAccepted,
              child: ResponsiveGridRow(children: [
                ResponsiveGridCol(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment(0, 0),
                            // color: Colors.green,
                            child: TextFormField(
                              maxLines: 5,
                              style: kTextFormFieldStyle(),
                              controller: responsController,
                              decoration: const InputDecoration(
                                // prefixIcon: Icon(Icons.person),
                                label: Text('Response'),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                              validator: ((v) {
                                if (v!.length < 5) {
                                  return "Is this a Response?";
                                }
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: size.height / 8,
            ),
            submit(size, widget.request, widget.user)
          ]),
        ),
      ),
    );
  }

  Widget submit(size, request, User user) {
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
            if (!isAccepted) {
              if (_formKey.currentState!.validate()) {
                setState(() => show = !show);
                final body = jsonEncode({
                  'remaks': responsController.text,
                  'comment': responsController.text,
                  "dr_id": user.user!['id'].toString(),
                  "request_id": request['id'].toString(),
                  "file_id": request['file_id'].toString(),
                  "patient_id": request['patient_id'].toString(),
                });
                try {
                  await http
                      .post(Uri.parse('${url}icuresp/add'),
                          headers: {
                            'Content-type': 'application/json',
                            'Accept': 'application/json',
                            'Authorization': 'Bearer ${user.token!}'
                          },
                          body: body)
                      .then((value) {
                    if (value.statusCode == 200 || value.statusCode == 201) {
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
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => IcuAddmission(
                        request: widget.request,
                        user: widget.user,
                        whichCu: int.parse(widget.request['type']))),
                (Route<dynamic> route) => false,
              );
            }
          },
          child: Text(
           isAccepted ?'Confirm':"Reject",
            style: confirmStyle(size),
          ),
        ),
      ],
    );
  }
}
