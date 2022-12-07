import 'dart:convert';
import 'package:aldayat_screens/main.dart';
import 'package:aldayat_screens/models/change_arabic_numbers.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddUser> {
  var nameController = TextEditingController();
  var emailContrller = TextEditingController();
  var telController = TextEditingController();
  var passWordController = TextEditingController();

  bool isScure = true;
  var unit = 'General';
  var whichlevel = '';
  var depart = '';
  var level = [
    'Consultant', //full
    'Specialist', //full
    'Registrar', //unit only
    'Medical', //unit only
    'House Officer', //unit only
    'Medical Director', //full
    'Nurse', //ward
    'Clinical Pharmacist', //ward
    'Ultrasound specialist', //request only
    'Pharmacist', //request only
    'Lab specialist',
    'Insuranse Agent',
    'Statistics Officer',
    'Nutritionist',
    'Psychiatrist',
  ];

  var dep = [
    'Department of Obstetrics',
    'Department of Pediatrics', //full
    'Department of Internal Medicine', //unit only
    'Department of Nutrition Medicine', //unit only
    'Department of Psychiatry', //unit only
    'Department of Clinical Pharmacy', //full
    'Department of Surgery', //ward
    'Department of Anesthesiology',
    'Department of Dentistry',
    'Department of Statistics',
    'Department of Ultrasound',
    'Medical lab',
    'Department of Pharmacy',
    'Insuranse',
  ];
  final _formKey = GlobalKey<FormState>();
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
              TitleD(setUniColor(unit), size),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add New Account',
                  style: kLoginTitleStyle(size, Colors.black),
                ),
              ),
              Form(
                key: _formKey,
                child: ResponsiveGridRow(children: [
                  ResponsiveGridCol(
                    xs: 6,
                    md: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
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
                        height: 50,
                        alignment: Alignment(0, 0),
                        // color: Colors.green,
                        child: TextFormField(
                          controller: emailContrller,
                          style: kTextFormFieldStyle(),
                          decoration: const InputDecoration(
                            // prefixIcon: Icon(Icons.person),
                            hintText: 'Email',
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
                        height: 50,
                        alignment: Alignment(0, 0),
                        // color: Colors.green,
                        child: TextFormField(
                          style: kTextFormFieldStyle(),
                          controller: telController,
                          decoration: const InputDecoration(
                            // prefixIcon: Icon(Icons.person),
                            hintText: 'Phone',
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
                        height: 50,
                        alignment: Alignment(0, 0),
                        // color: Colors.green,
                        child: TextFormField(
                          obscureText: isScure,
                          controller: passWordController,
                          style: kTextFormFieldStyle(),
                          decoration: InputDecoration(
                            suffix: GestureDetector(
                              child: Icon(
                                !isScure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                // size: 15,
                              ),
                              onTap: () => setState(() {
                                isScure = !isScure;
                              }),
                            ),
                            hintText: 'Password',
                            border: const OutlineInputBorder(
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: 12,
                    child: Container(
                      height: size.height / 6,
                      alignment: Alignment(0, 0),
                      // color: Colors.purple,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PopupMenuButton<int>(
                              child: Row(
                                children: [
                                  Text(
                                    'Unit  :  $unit',
                                    style: fileTitle(size),
                                  ),
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                              itemBuilder: (context) => [
                                    for (int i = 1; i < 6; i++)
                                      PopupMenuItem(
                                        value: i,
                                        // row with 2 children
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Unit:  '),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text("$i")
                                          ],
                                        ),

                                        onTap: () {
                                          setState(() {
                                            unit = i.toString();
                                          });
                                        },
                                      ),
                                    // Pop
                                  ]),
                          PopupMenuButton<int>(
                              itemBuilder: (context) => [
                                    for (int i = 0; i < level.length; i++)
                                      PopupMenuItem(
                                        value: i,
                                        // row with 2 children
                                        child: Container(
                                          color: i % 2 == 0
                                              ? Colors.white
                                              : Colors.amber,
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                level[i],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                              offset: const Offset(0, 100),
                              elevation: 2,
                              // on selected we show the dialog box
                              onSelected: (value) {
                                // if value 1 show dialog
                                setState(() {
                                  whichlevel = level[value];
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                      whichlevel == ''
                                          ? 'Occupation'
                                          : whichlevel,
                                      style: insuranceStyle(size)),
                                  const Icon(Icons.arrow_drop_down)
                                ],
                              )),
                          PopupMenuButton<int>(
                              itemBuilder: (context) => [
                                    for (int i = 0; i < dep.length; i++)
                                      PopupMenuItem(
                                        value: i,
                                        // row with 2 children
                                        child: Container(
                                          color: i % 2 == 0
                                              ? Colors.white
                                              : Colors.amber,
                                          child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                dep[i],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                              offset: const Offset(0, 100),
                              elevation: 2,
                              // on selected we show the dialog box
                              onSelected: (value) {
                                // if value 1 show dialog
                                setState(() {
                                  depart = dep[value];
                                });
                              },
                              child: Row(
                                children: [
                                  Text(depart == '' ? 'Department' : depart,
                                      style: insuranceStyle(size)),
                                  const Icon(Icons.arrow_drop_down)
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
              submit(size)
            ],
          ),
        ),
      ),
    );
  }

  // Login Button
  Widget submit(size) {
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
            if (_formKey.currentState!.validate()) {
              var body = jsonEncode({
                'unit': replaceArabicNumber(unit.toString()),
                'name': nameController.text,
                'password': passWordController.text,
                'email': emailContrller.text,
                'phone': replaceArabicNumber(telController.text),
                'level': whichlevel,
                'dep': depart,
              });
              try {
                await http
                    .post(Uri.parse('${url}user/donat'),
                        headers: headr, body: body)
                    .then((value) {
                  print('Value error:  ${value.body}');
                });
              } catch (e) {
                print(e);
              }
//Validate returns true if the form is valid, or false otherwise.

              // ... Navigate To your Home Page
            }
          },
          child: Text(
            'Confirm',
            style: confirmStyle(size),
          ),
        ),
      ),
    );
  }
}
