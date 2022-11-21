import 'package:aldayat_screens/main.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';

class AntenatalAddmission extends StatefulWidget {
  const AntenatalAddmission({super.key});

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

    bool jaundicw = false;
      bool cyan = false;
        bool odema = false;
          bool espll = false;



  var lie = ['Longitudinal', 'Transeverse', 'Oblique'];

  var whichlie = '';

  var booking = ['PW', 'First Class', 'GW'];

  var whatIsBooking = '';
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

               
                ResponsiveGridCol(
                  xs: 4,
                  md: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      // color: Colors.green,
                      child: Row(children: [
                        Checkbox(value: pale, onChanged: (v){

                          setState(() {
                            pale=!pale;
                          });
                        }),
                          Text("Pale")
                      ],)
                      
                     
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
                      child: Row(children: [
                        Checkbox(value: jaundicw, onChanged: (v){

                          setState(() {
                            jaundicw=!jaundicw;
                          });
                        }),
                          Text("Jaundice")
                      ],)
                      
                     
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
                      child: Row(children: [
                        Checkbox(value: cyan, onChanged: (v){

                          setState(() {
                            cyan=!cyan;
                          });
                        }),
                          Text("Cynosis")
                      ],)
                      
                     
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
                      child: Row(children: [
                        Checkbox(value: odema, onChanged: (v){

                          setState(() {
                            odema=!odema;
                          });
                        }),
                          Text("Odema")
                      ],)
                      
                     
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
                      child: Row(children: [
                        Checkbox(value: espll, onChanged: (v){

                          setState(() {
                            espll=!espll;
                          });
                        }),
                        Text("Espll")
                      ],)
                      
                     
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
              SizedBox(height: 30,),
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
            try {
              await http.post(Uri.parse('${url}anten'), headers: headr, body: {
                'unit': unit.toString(),
                'booking': whatIsBooking,
                'name': complaintController.text,
                // 'age': ageController.text,
                // 'tel': telController.text,
                // 'occup': occupController.text,
                // 'residance': reseidancenameController.text,
                // 'husband': husbandController.text,
                // 'husband_tel': husbandTelController.text,
                // 'husband_occup': husbandOccupController.text,
                // 'blood': whatIsBlood.toString(),
                // 'allerg': allergController.text,
                'insurance': whichlie.toString(),
              }).then((value) {
                print('Value error:  ${value.body}');
              });
            } catch (e) {
              print(e);
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