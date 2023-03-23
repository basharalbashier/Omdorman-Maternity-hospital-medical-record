import 'dart:convert';

import 'package:aldayat_screens/models/change_arabic_numbers.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../models/error_message.dart';
import '../models/user_hive.dart';

class AddFile extends StatefulWidget {
  final int patienId;
  final User user;
  const AddFile(this.patienId,this.user, {super.key});

  @override
  State<AddFile> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddFile> {
  var reseidancenameController = TextEditingController();
  var husbandController = TextEditingController();
  var husbandTelController = TextEditingController();
  var husbandOccupController = TextEditingController();
  var allergController = TextEditingController();
  var unit = "1";

  var booking = ['PW', 'First Class', 'GW'];

  var whatIsBooking = '';

  bool varified = F;
  bool show = true;
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.user.token == '' || !show) {
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
              TitleD(setUniColor(unit), size),
              ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PopupMenuButton<int>(
                          child: Text(
                            'Unit:  $unit',
                            style: fileTitle(size),
                          ),
                          itemBuilder: (context) => [
                                for (int i = 1; i < 6; i++)
                                  PopupMenuItem(
                                    value: i,
                                    // row with 2 children
                                    child: Row(
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
                  ResponsiveGridCol(
                    lg: 12,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30),
                      child: Container(
                        height: size.height / 6,
                        alignment: Alignment(0, 0),
                        // color: Colors.purple,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Booking Status: '),
                            for (int i = 0; i < booking.length; i++)
                              Row(
                                children: [
                                  Text(booking[i]),
                                  Checkbox(
                                      value: whatIsBooking == booking[i]
                                          ? true
                                          : false,
                                      onChanged: ((value) {
                                        setState(() {
                                          whatIsBooking = booking[i];
                                        });
                                      }))
                                ],
                              ),
                          ],
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
                          controller: reseidancenameController,
                          style: kTextFormFieldStyle(),
                          decoration: const InputDecoration(
                            // prefixIcon: Icon(Icons.person),
                            hintText: 'Residance',
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
                          controller: husbandController,
                          style: kTextFormFieldStyle(),
                          decoration: const InputDecoration(
                            // prefixIcon: Icon(Icons.person),
                            hintText: 'Husband\'s Name',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          // controller: nameController,
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter username';
                            } else if (value.length < 4) {
                              return 'at least enter 4 characters';
                            } else if (value.length > 13) {
                              return 'maximum character is 13';
                            }
                            return null;
                          },
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
                          controller: husbandTelController,
                          style: kTextFormFieldStyle(),
                          decoration: const InputDecoration(
                            // prefixIcon: Icon(Icons.person),
                            label: Text('Husband\'s Tel'),
                            hintText: "1 or 9 xxxxxxx",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          // controller: nameController,
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter username';
                            } else if (value.length < 4) {
                              return 'at least enter 4 characters';
                            } else if (value.length > 13) {
                              return 'maximum character is 13';
                            }
                            return null;
                          },
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
                          controller: husbandOccupController,
                          style: kTextFormFieldStyle(),
                          decoration: const InputDecoration(
                            // prefixIcon: Icon(Icons.person),
                            hintText: 'Husband\'s Occupation',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          // controller: nameController,
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter username';
                            } else if (value.length < 4) {
                              return 'at least enter 4 characters';
                            } else if (value.length > 13) {
                              return 'maximum character is 13';
                            }
                            return null;
                          },
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
              'unit': unit,
              'booking': whatIsBooking,
              'residance': reseidancenameController.text,
              'husband': husbandController.text,
              'husband_tel': replaceArabicNumber(husbandTelController.text),
              'husband_occup': husbandOccupController.text,
              'patient_id': "${widget.patienId}",
              'user_id': "${widget.user.user['id']}"
            });
            try {
              await http
                  .post(Uri.parse('${url}file/add'),
                      headers: {
                        'Content-type': 'application/json',
                        'Accept': 'application/json',
                        'Authorization': 'Bearer ${widget.user.token}'
                      },
                      body: msg)
                  .then((value) {
                print(value.body);
                errono(
                    "File Added Successfully",
                    "File Added Successfully",
                    context,
                    true,
                    Icon(
                      Icons.check,
                      color: Colors.teal,
                    ),
                    2);
                Navigator.of(context).pop();
              });
            } catch (e) {
              print(e);
              errono("Connection Error", "Connection Error", context, true,
                  Container(), 2);
              setState(() {
                show = !show;
              });
            }
            // Validate returns true if the form is valid, or false otherwise.
            // if (_formKey.currentState!.validate()) {
            //   // ... Navigate To your Home Page
            // }
          },
          child: const Text('Confirm'),
        ),
      ),
    );
  }
}
