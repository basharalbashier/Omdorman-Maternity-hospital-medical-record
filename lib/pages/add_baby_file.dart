import 'dart:convert';
import 'package:aldayat_screens/models/change_arabic_numbers.dart';
import 'package:aldayat_screens/models/error_message.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../models/user_hive.dart';

class AddBabyFile extends StatefulWidget {
  final User user;
  final int patientId;
  final int fileId;
  const AddBabyFile(
      {super.key,
      required this.user,
      required this.patientId,
      required this.fileId});

  @override
  State<AddBabyFile> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddBabyFile> {
  var nameController = TextEditingController();
  var coPatientNameController = TextEditingController();
  var bithDayController = TextEditingController();
  var coPatientIdController = TextEditingController();
  var phoneNumberController = TextEditingController();

  bool show = true;

  User user = User({}, '');
  @override
  void initState() {
    getinfo(context).then((value) => setState(() {
          user = value;

          // print(user.user);
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!show) {
      return Scaffold(
        body: Center(
            child: LinearProgressIndicator(
          color: Colors.lightBlue,
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
              TitleD(Colors.lightBlueAccent, size),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Baby File info',
                  style: fileTitle(size),
                ),
              ),
              Divider(),
              ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    xs: 6,
                    md: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        alignment: Alignment(0, 0),
                        // color: Colors.green,
                        child: TextFormField(
                          controller: nameController,
                          style: kTextFormFieldStyle(),
                          decoration: const InputDecoration(
                            // prefixIcon: Icon(Icons.person),
                            hintText: 'Name',
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
                  ResponsiveGridCol(
                    xs: 6,
                    md: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        alignment: Alignment(0, 0),
                        // color: Colors.green,
                        child: TextFormField(
                          controller: bithDayController,
                          style: kTextFormFieldStyle(),
                          decoration: const InputDecoration(
                            // prefixIcon: Icon(Icons.person),
                            hintText: 'yyyy-MM-DD',
                            label: Text('Date of Birth'),
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
                  ResponsiveGridCol(
                    xs: 6,
                    md: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        alignment: Alignment(0, 0),
                        // color: Colors.green,
                        child: TextFormField(
                          controller: coPatientNameController,
                          style: kTextFormFieldStyle(),
                          decoration: const InputDecoration(
                            // prefixIcon: Icon(Icons.person),
                            hintText: 'Co-patient name',
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
                  ResponsiveGridCol(
                    xs: 6,
                    md: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        alignment: Alignment(0, 0),
                        // color: Colors.green,
                        child: TextFormField(
                          controller: coPatientIdController,
                          style: kTextFormFieldStyle(),
                          decoration: const InputDecoration(
                            // prefixIcon: Icon(Icons.person),
                            hintText: 'Co-patient ID',
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
                  ResponsiveGridCol(
                    xs: 6,
                    md: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        alignment: Alignment(0, 0),
                        // color: Colors.green,
                        child: TextFormField(
                          maxLength: 9,
                          controller: phoneNumberController,
                          style: kTextFormFieldStyle(),
                          decoration: const InputDecoration(
                            // prefixIcon: Icon(Icons.person),
                            label: Text('Phone number'),
                            hintText: "1 or 9 xxxxxxx",
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
                ],
              ),
              submit()
            ],
          ),
        ),
      ),
    );
  }

  // Login Button
  Widget submit() {
    return Padding(
      padding: const EdgeInsets.only(left: 80.0, right: 80, bottom: 80),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          style: ButtonStyle(
            // backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          onPressed: () async {
            setState(() {
              show = !show;
            });
            final msg = jsonEncode({
              'name': nameController.text,
              'date_birth': bithDayController.text,
              'person_in_charg': coPatientNameController.text,
              'ident': coPatientIdController.text,
              'phone': replaceArabicNumber(phoneNumberController.text),
              'patient_id': "${widget.patientId}",
              'file_id': "${widget.fileId}",
              'user_id': "${user.user!['id']}"
            });
            try {
              await http
                  .post(Uri.parse('${url}neofile/add'),
                      headers: {
                        'Content-type': 'application/json',
                        'Accept': 'application/json',
                        'Authorization': 'Bearer ${user.token}'
                      },
                      body: msg)
                  .then((value) {
                if (value.statusCode == 200 || value.statusCode == 201) {
                  Navigator.of(context).pop();
                } else {
                  setState(() {
                    show = !show;
                  });
                  print(value.body);
                  errono("Connection Error", "Connection Error", context, true,
                      Container(), 2);
                }
              });
            } catch (e) {
              setState(() {
                show = !show;
              });
              errono("Connection Error", "Connection Error", context, true,
                  Container(), 2);
            }
          },
          child: const Text('Confirm'),
        ),
      ),
    );
  }
}
