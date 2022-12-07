import 'dart:convert';
import 'package:aldayat_screens/main.dart';
import 'package:aldayat_screens/models/change_arabic_numbers.dart';
import 'package:aldayat_screens/models/error_message.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../models/choos_file_type.dart';
import '../models/user_hive.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var telController = TextEditingController();
  var occupController = TextEditingController();

  User user = User({}, '');
  @override
  void initState() {
    getinfo(context).then((value) => setState(() {
          user = value;
        }));
    super.initState();
  }
  bool show = true;
  @override
  Widget build(BuildContext context) {
    if (user.token == '' || !show) {
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
              TitleD(setUniColor('General'), size),
              ResponsiveGridRow(children: [
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
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                     
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
                    
                        controller: ageController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          hintText: 'Age',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
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
                        onChanged: ((v){
                         

                        }),
                        style: kTextFormFieldStyle(),
                        controller: telController,
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                            hintText: "1 or 9 xxxxxxx",
                            label: Text('Phone'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
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
                        controller: occupController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          hintText: 'Occupation',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        // controller: nameController,
                        // The validator receives the text that the user has entered.
                     
                      ),
                    ),
                  ),
                ),

                // ResponsiveGridCol(
                //   lg: 12,
                //   child: Container(
                //     height: size.height / 9,
                //     alignment: Alignment(0, 0),
                //     // color: Colors.purple,
                //     child: Column(
                //       children: [
                //         Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: TextFormField(
                //             controller: allergController,
                //             style: kTextFormFieldStyle(),
                //             decoration: const InputDecoration(
                //               // prefixIcon: Icon(Icons.person),
                //               hintText: 'Allergies',
                //               border: OutlineInputBorder(
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(15)),
                //               ),
                //             ),
                //             // controller: nameController,
                //             // The validator receives the text that the user has entered.

                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // // ResponsiveGridCol(
                //   lg: 12,
                //   child: Container(
                //     height: size.height / 6,
                //     alignment: Alignment(0, 0),
                //     // color: Colors.purple,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                //       children: [
                //      bloodGroup(context,size,whatIsBlood),
                //         PopupMenuButton<int>(
                //             itemBuilder: (context) => [
                //                   for (int i = 0; i < insurance.length; i++)
                //                     PopupMenuItem(
                //                       value: i,
                //                       // row with 2 children
                //                       child: Row(
                //                         children: [
                //                           const SizedBox(
                //                             width: 10,
                //                           ),
                //                           Text(insurance[i])
                //                         ],
                //                       ),
                //                     ),
                //                 ],
                //             offset: const Offset(0, 100),
                //             elevation: 2,
                //             // on selected we show the dialog box
                //             onSelected: (value) {
                //               // if value 1 show dialog
                //               setState(() {
                //                 whichInsurance = insurance[value];
                //               });
                //             },
                //             child: Text(
                //                 whichInsurance == ''
                //                     ? 'Insurance'
                //                     : whichInsurance,
                //                 style: insuranceStyle(size))),
                //       ],
                //     ),
                //   ),
                // ),
              ]),
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
              setState(() {
                show = !show;
              });
            final msg = jsonEncode({
              'name': nameController.text,
              'age': replaceArabicNumber(ageController.text),
              'tel': replaceArabicNumber(telController.text),
              'occup': occupController.text,
              'user_id': user.user!['id']
            });
            try {
              await http
                  .post(Uri.parse('${url}patient/add'),
                      headers: {
                        'Content-type': 'application/json',
                        'Accept': 'application/json',
                        'Authorization': 'Bearer ${user.token}'
                      },
                      body: msg)
                  .then((value) {
                if (value.statusCode == 205) {
                           setState(() {
                show = !show;
              });
                  errono(
                      "${json.decode(value.body)['name']}",
                      "${json.decode(value.body)['name']}",
                      context,
                      true,
                      Container(),
                      10);
                  // print('Patient exist:  ${value.body}');
                } else {
                  // print(value.statusCode);
                  if (value.statusCode == 201) {
                      setState(() {
                show = !show;
              });
                    chooseFileType(
                        json.decode(value.body), context, size);
                  }
                }
              });
            } catch (e) {
                setState(() {
                show = !show;
              });
                 errono("Connection Error", "Connection Error", context, true,
                  Container(), 2);
              // print(e);
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
