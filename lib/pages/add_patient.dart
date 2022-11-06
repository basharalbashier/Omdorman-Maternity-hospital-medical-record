import 'package:aldayat_screens/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';

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
  var reseidancenameController = TextEditingController();
  var husbandController = TextEditingController();
  var husbandTelController = TextEditingController();
  var husbandOccupController = TextEditingController();
  var allergController = TextEditingController();
  var unit = 1;

  var blood = [
    'A - ve',
    'A + ve',
    'B - ve',
    'B + ve',
    'AB - ve',
    'AB +ve',
    'O - ve',
    'O + ve'
  ];

  var whatIsBlood = '';

  var insurance = ['Shwamikh', 'Shikan', 'Alislamia'];

  var whichInsurance = '';

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
              Container(
                height: size.height / 6,
                width: size.width,
                color: Colors.orange,
                child: SizedBox(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: size.width * .2,
                          child: Image.asset('lib/assets/minstery.jpeg')),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Republic of Sudan',
                              style: fileTitle(size),
                            ),
                          ),
                          Text(
                            'Ministry of health - Khartoum State',
                            style: kLoginSubtitleStyle(size),
                          ),
                        ],
                      ),
                      SizedBox(
                          width: size.width * .2,
                          child: Image.asset('lib/assets/download.jpeg'))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Omdurman Maternity Hospital',
                    style: kLoginOrSignUpTextStyle(size),
                  ),
                ),
              ),
              Container(
                color: unit == 1
                    ? Colors.teal
                    : unit == 2
                        ? Colors.pink
                        : unit == 3
                            ? Colors.amber
                            : unit == 4
                                ? Colors.purple
                                : unit == 5
                                    ? Colors.blue
                                    : Colors.white,
                height: size.height / 16,
                width: size.width,
                child: Center(
                  child: Text(
                    'Health Information & Research',
                    style: healthStyle(size),
                  ),
                ),
              ),
              Padding(
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
                                  unit = i;
                                });
                              },
                            ),

                          // Pop
                        ]),
              ),
              ResponsiveGridRow(children: [
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
                          Text('Booking Status: '),
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
                        controller: nameController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          hintText: 'Name',
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
                        style: kTextFormFieldStyle(),
                        controller: telController,
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          hintText: 'Tel',
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
                        controller: reseidancenameController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          hintText: 'Residance',
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
                        controller: husbandController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          hintText: 'Husband\'s Name',
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
                  md: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      alignment: Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        controller: husbandTelController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          // prefixIcon: Icon(Icons.person),
                          hintText: 'Husband\'s Tel',
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
                  lg: 12,
                  child: Container(
                    height: size.height / 12,
                    alignment: Alignment(0, 0),
                    // color: Colors.purple,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: allergController,
                            style: kTextFormFieldStyle(),
                            decoration: const InputDecoration(
                              // prefixIcon: Icon(Icons.person),
                              hintText: 'Allergies',
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
                      ],
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  lg: 12,
                  child: Container(
                    height: size.height / 6,
                    alignment: Alignment(0, 0),
                    // color: Colors.purple,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PopupMenuButton<int>(
                            itemBuilder: (context) => [
                                  for (int i = 0; i < blood.length; i++)
                                    PopupMenuItem(
                                      value: i,
                                      // row with 2 children
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(blood[i])
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
                                whatIsBlood = blood[value];
                              });
                            },
                            child: Text(
                              whatIsBlood == ''
                                  ? 'Blood group & RH'
                                  : whatIsBlood,
                              style: bloodStyle(size),
                            )),
                        PopupMenuButton<int>(
                            itemBuilder: (context) => [
                                  for (int i = 0; i < insurance.length; i++)
                                    PopupMenuItem(
                                      value: i,
                                      // row with 2 children
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(insurance[i])
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
                                whichInsurance = insurance[value];
                              });
                            },
                            child: Text(
                                whichInsurance == ''
                                    ? 'Insurance'
                                    : whichInsurance,
                                style: insuranceStyle(size))),
                      ],
                    ),
                  ),
                ),
              ]),
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
              await http
                  .post(Uri.parse('${url}patient'), headers: headr, body: {
                'unit': unit.toString(),
                'booking': whatIsBooking,
                'name': nameController.text,
                'age': ageController.text,
                'tel': telController.text,
                'occup': occupController.text,
                'residance': reseidancenameController.text,
                'husband': husbandController.text,
                'husband_tel': husbandTelController.text,
                'husband_occup': husbandOccupController.text,
                'blood': whatIsBlood.toString(),
                'allerg': allergController.text,
                'insurance': whichInsurance.toString(),
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
