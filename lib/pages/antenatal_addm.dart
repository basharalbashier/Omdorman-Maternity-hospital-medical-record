import 'dart:convert';

import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../constant.dart';
import '../models/error_message.dart';
import '../models/make_request.dart';
import '../models/user_hive.dart';

class AntenatalAddmission extends StatefulWidget {
  final User user;
  final Map patient;
  final Map file;
  const AntenatalAddmission(
      {super.key,
      required this.user,
      required this.patient,
      required this.file});

  @override
  State<AntenatalAddmission> createState() => _AddPatientState();
}

class _AddPatientState extends State<AntenatalAddmission> {
  var complaintController = TextEditingController();
  var historyController = TextEditingController();
  var fhrController = TextEditingController();
  var lieController = TextEditingController();
  var immediateController = TextEditingController();
  var pulseController = TextEditingController();
  var fundalController = TextEditingController();
  var vaginalController = TextEditingController();
  var fmController = TextEditingController();
  var tempController = TextEditingController();
  var bpController = TextEditingController();
  var persntaController = TextEditingController();
  var diaController = TextEditingController();
  var generalController = TextEditingController();

  var cvsController = TextEditingController();
  var unit = 1;

  bool pale = false;
  bool jaundice = false;
  bool cyan = false;
  bool odema = false;
  bool espll = false;
  @override
  void initState() {
    genralList = [
      ["Pale", pale],
      ["Jaundice", jaundice],
      ["Cynosis", cyan],
      ["Odema", odema],
      ['Espll', espll]
    ];
    super.initState();
  }

  var lie = ['Longitudinal', 'Transeverse', 'Oblique'];

  var whichlie = '';

  List<List> genralList = [];

  List<String> choosenGenalList = [];

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
                  'Antenatal admission',
                  style: kLoginTitleStyle(size, Colors.black),
                ),
              ),
              ResponsiveGridRow(children: [
                ResponsiveGridCol(
                  // xs: 6,
                  // md: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,

                      alignment: Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        maxLines: 3,
                        controller: complaintController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          label: Text('Complaint'),
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
                  // xs: 6,
                  // md: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,

                      alignment: Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        maxLines: 5,
                        controller: historyController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          label: Text('History of Presenting Illness'),
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
                  xs: 4,
                  md: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        controller: pulseController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          label: Text('Pulse'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        // controller: nameController,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Pulse';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  xs: 4,
                  md: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        style: kTextFormFieldStyle(),
                        controller: bpController,
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          label: Text('Bp'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        // controller: nameController,
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Bp';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  xs: 4,
                  md: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        controller: tempController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          label: Text('Temp'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        controller: generalController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          label: Text('General Condition'),
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
                for (var i in genralList)
                  ResponsiveGridCol(
                    xs: 4,
                    md: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 100,
                          alignment: Alignment(0, 0),
                          // color: Colors.green,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: i[1],
                                  onChanged: (v) {
                                    v!
                                        ? choosenGenalList.add(i[0])
                                        : choosenGenalList.remove(i[0]);
                                    setState(() {
                                      i[1] = !i[1];
                                    });
                                  }),
                              Text(i[0])
                            ],
                          )),
                    ),
                  ),
                ResponsiveGridCol(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        controller: cvsController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          label: Text('CVS & Chext Examination'),
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
                  xs: 4,
                  md: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        controller: fundalController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          label: Text('FundalHeight'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
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
                  xs: 4,
                  md: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      // color: Colors.green,
                      child: PopupMenuButton<int>(
                          itemBuilder: (context) => [
                                for (int i = 0; i < lie.length; i++)
                                  PopupMenuItem(
                                    value: i,
                                    // row with 2 children
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(lie[i])
                                      ],
                                    ),
                                  ),
                              ],
                          offset: const Offset(0, 100),
                          elevation: 2,
                          // on selected we show the dialog box
                          onSelected: (value) {
                            // if value 1 show dialog
                            setState(() {
                              whichlie = lie[value];
                            });
                          },
                          child: Row(
                            children: [
                              Text(whichlie == '' ? 'Lie' : whichlie,
                                  style: insuranceStyle(size)),
                              Icon(Icons.arrow_drop_down)
                            ],
                          )),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  xs: 4,
                  md: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        controller: persntaController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          label: Text('Presentation'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
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
                  md: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        style: kTextFormFieldStyle(),
                        controller: fhrController,
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          label: Text('FHR'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
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
                  md: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        controller: fmController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          label: Text('FM'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
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
                  // xs: 6,
                  // md: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,

                      alignment: Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        maxLines: 2,
                        controller: vaginalController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          label: Text('Vaginal Examination (if needed)'),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        controller: diaController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          label: Text('Diagnosis'),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        maxLines: 5,
                        controller: immediateController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          label: Text('Immediate Instructions'),
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
              ]),
              SizedBox(
                height: 30,
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
            var body = json.encode({
              'unit': unit.toString(),
              'complaint': complaintController.text,
              'history_presenting_illness': historyController.text,
              'pulse': pulseController.text,
              'bp': bpController.text,
              'temp': tempController.text,
              'gentral_condition': generalController.text,
              'gentral_condition_list': choosenGenalList.toString(),
              'cvs_chest_examination': cvsController.text,
              'fundel_height': fundalController.text,
              'lie': whichlie,
              'presentation': persntaController.text,
              'fhr': fhrController.text,
              'fm': fmController.text,
              'vaginal_exam': vaginalController.text,
              'diagnosis': diaController.text,
              'immediat_instruction': immediateController.text,
              'dr_id': widget.user.user!['id'],
              'patient_id': widget.patient['id'],
              'file_id': widget.file['id'],
            });
            var tryLogin =
                await makeHttpRequest('${url}anten', body, true, widget.user);
            if (tryLogin[1] == "Successfully sent") {
            } else {
              errono(tryLogin[1], tryLogin[1], context, true, Container(), 5);
              setState(() {
                // show = true;
              });
            }
          },
          child: const Text('Confirm'),
        ),
      ),
    );
  }
}
/*
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
               

*/