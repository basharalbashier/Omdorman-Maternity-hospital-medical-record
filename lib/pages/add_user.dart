import 'dart:convert';
import 'package:aldayat_screens/models/change_arabic_numbers.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddUser> {
  bool isScure = true;
  var unit = '';
  var whichlevel = '';
  var depart = '';
  var titles = ["Name", "Phone", "Email"];
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

  void sendData() async {
    // ignore: unused_local_variable
    var body = jsonEncode({
      'unit': depart == 'Department of Obstetrics'
          ? replaceArabicNumber(unit.toString())
          : "General",
      'name': controlers[0].text,
      'email': controlers[2].text,
      'phone': replaceArabicNumber(controlers[1].text),
      'level': whichlevel,
      'dep': depart,
          'password': "123456", /**need to do somthing whith optaining password */
    });
    // List o = [];
    // o.add(jsonEncode({
    //   'unit': "1",
    //   'name': "obs",
    //   'password': "123456",
    //   'email': "obs@gmail.com",
    //   'phone': "4329805742389",
    //   'level': 'Consultant',
    //   'dep': 'Department of Obstetrics',
    // }));
    // o.add(jsonEncode({
    //   'unit': "1",
    //   'name': "ana",
    //   'password': "123456",
    //   'email': "ana@gmail.com",
    //   'phone': "4329805742389",
    //   'level': 'Consultant',
    //   'dep': 'Department of Anesthesiology',
    // }));
    // o.add(jsonEncode({
    //   'unit': "General",
    //   'name': "lab",
    //   'password': "123456",
    //   'email': "lab@gmail.com",
    //   'phone': "4329805742389",
    //   'level': 'Consultant',
    //   'dep': 'Medical lab',
    // }));
    // o.add(jsonEncode({
    //   'unit': "General",
    //   'name': 'sta',
    //   'password': "123456",
    //   'email': "sta@gmail.com",
    //   'phone': "4329805742389",
    //   'level': 'Statistics Officer',
    //   'dep': 'Department of Statistics',
    // }));

    // for (var i in o) {
    try {
      await http
          .post(Uri.parse('${url}user/donat'),
              headers: {
                'Access-Control-Allow-Origin': '*',
                'Content-type': 'application/json',
                'Accept': 'application/json',
              },
              body: body)
          .then((value) {
        print('Value error:  ${value.body}');
      });
    } catch (e) {
      print(e);
      // }
    }
//Validate returns true if the form is valid, or false otherwise.

    // ... Navigate To your Home Page
  }

  List<TextEditingController> controlers = [];
  @override
  void initState() {
    for (var i in titles) {
      i;
      controlers.add(TextEditingController());
    }
    super.initState();
  }

  List<IconData> icons = [Icons.person, Icons.call, Icons.email];
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
              Row(
                children: [
                  BackButton(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add New Account',
                  style: kLoginTitleStyle(size, Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < titles.length; i++)
                        SizedBox(
                          width: size.width / 1.3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: controlers[i],
                              validator: (value) => value!.length < 5
                                  ? "Is this your ${titles[i]}"
                                  : null,
                              style: kTextFormFieldStyle(),
                              decoration: InputDecoration(
                                prefix: Icon(icons[i]),
                                label: Text(titles[i]),
                                // hintText: ,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PopupMenuButton<int>(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            itemBuilder: (context) => [
                                  for (int i = 0; i < level.length; i++)
                                    PopupMenuItem(
                                      value: i,
                                      // row with 2 children
                                      child: Container(
                                        color: i % 2 == 0
                                            ? Colors.white
                                            : Colors.amber.withOpacity(0.5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    whichlevel == ''
                                        ? 'Occupation'
                                        : whichlevel,
                                    style: insuranceStyle(size)),
                                const Icon(Icons.arrow_drop_down)
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: PopupMenuButton<int>(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              itemBuilder: (context) => [
                                    for (int i = 0; i < dep.length; i++)
                                      PopupMenuItem(
                                        padding: const EdgeInsets.all(8.0),
                                        value: i,
                                        child: Container(
                                          width: double.infinity,
                                          color: i % 2 == 0
                                              ? Colors.white
                                              : Colors.amber.withOpacity(.3),
                                          child: Text(
                                            dep[i],
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                  ],
                              offset: const Offset(0, 0),
                              elevation: 2,
                              // on selected we show the dialog box
                              onSelected: (value) {
                                // if value 1 show dialog
                                setState(() {
                                  depart = dep[value];
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(depart == '' ? 'Department' : depart,
                                      style: insuranceStyle(size)),
                                  const Icon(Icons.arrow_drop_down)
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Visibility(
                          visible: depart == 'Department of Obstetrics',
                          child: PopupMenuButton<int>(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: size.height / 8,
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
              sendData();
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
