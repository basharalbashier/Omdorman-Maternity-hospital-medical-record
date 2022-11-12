import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../main.dart';

Widget uSRequest(contexte, size) {
  var clin = TextEditingController();
  var emailContrller = TextEditingController();
  var telController = TextEditingController();
  var passWordController = TextEditingController();

  var forHow = [
    'PW',
    'Public Clinic',
    'Gyne',
    'Ward',
    'ICU',
  ];

  var whichforHow = '';
  return MaterialButton(
      color: Colors.amber,
      child: Text('U/S Request'),
      onPressed: (() async {
        await showDialog<void>(
          context: contexte,
          builder: (BuildContext context) {
            return AlertDialog(
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return SizedBox(
                    width: size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PopupMenuButton<int>(
                              itemBuilder: (context) => [
                                    for (int i = 0; i < forHow.length; i++)
                                      PopupMenuItem(
                                        value: i,
                                        // row with 2 children
                                        child: Row(
                                          children: [
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              forHow[i],
                                            )
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
                                  whichforHow = forHow[value];
                                });
                              },
                              child: Row(
                                children: [
                                  Text(whichforHow == '' ? 'For' : whichforHow,
                                      style: insuranceStyle(size)),
                                  const Icon(Icons.arrow_drop_down)
                                ],
                              )),
                        ),
                        ResponsiveGridRow(children: [
                          ResponsiveGridCol(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 50,
                                alignment: Alignment(0, 0),
                                // color: Colors.green,
                                child: TextFormField(
                                  maxLines: 2,
                                  controller: emailContrller,
                                  style: kTextFormFieldStyle(),
                                  decoration: const InputDecoration(
                                    // prefixIcon: Icon(Icons.person),
                                    label: Text('Remarks'),
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'U/S',
                                style: kLoginTitleStyle(size,Colors.black),
                              ),
                            ),
                          ),
                          ResponsiveGridCol(
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
                                    label: Text('1 /'),
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
                                    label: Text('2 /'),
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
                                    label: Text('3 /'),
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
                                    label: Text('4 /'),
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
                        ]),
                        submit(size)
                      ]),
                    ),
                  );
                },
              ),
            );
          },
        );
      }));

  ;
}

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
          try {
            await http.post(Uri.parse('${url}patient'), headers: headr, body: {
              // 'unit': unit.toString(),

              // 'name': nameController.text,
              // // 'age': ageController.text,
              // // 'tel': telController.text,
              // // 'occup': occupController.text,
              // // 'residance': reseidancenameController.text,
              // // 'husband': husbandController.text,
              // // 'husband_tel': husbandTelController.text,
              // // 'husband_occup': husbandOccupController.text,
              // // 'blood': whatIsBlood.toString(),
              // // 'allerg': allergController.text,
              // // 'insurance': whichInsurance.toString(),
            }).then((value) {
              print('Value error:  ${value.body}');
            });
          } catch (e) {
            // print(e);
          }
          // Validate returns true if the form is valid, or false otherwise.
          // if (_formKey.currentState!.validate()) {
          //   // ... Navigate To your Home Page
          // }
        },
        child: Text(
          'Confirm',
          style: confirmStyle(size),
        ),
      ),
    ),
  );
}


// 
  
  