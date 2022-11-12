import 'package:aldayat_screens/main.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../widgets/u_s_request.dart';

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

  var level = [
    'Consultant',//full
    'Specialist',//full
    'Registrar',//unit only
    'Medical',//unit only
    'House Officer',//unit only
    'Medical Director',//full
    'Nurse',//ward
    'Clinical Pharmacist',//ward
    'Ultrasound specialist',//request only
    'Pharmacist',//request only
    'Lab specialist',
    'Insuranse Agent',
    'Statistics Officer',
    'Nutritionist',
    'Psychiatrist',
  ];

  var whichlevel = '';

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
              TitleD(unit, size),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add New Account',
                  style: kLoginTitleStyle(size,Colors.black),
                ),
              ),
              ResponsiveGridRow(children: [
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
                    child: Divider(),
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
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 80),
                          child: PopupMenuButton<int>(
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
                        ),
                        PopupMenuButton<int>(
                            itemBuilder: (context) => [
                                  for (int i = 0; i < level.length; i++)
                                    PopupMenuItem(
                                      value: i,
                                      // row with 2 children
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            level[i],
                                            style: TextStyle(
                                       
                                                backgroundColor: i % 2 == 0
                                                    ? Colors.white
                                                    : Colors.grey),
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
                     
                      ],
                    ),
                  ),
                ),
              ]),
            uSRequest(context,size)
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
            try {
              await http
                  .post(Uri.parse('${url}patient'), headers: headr, body: {
                'unit': unit.toString(),
             
                'name': nameController.text,
                // 'age': ageController.text,
                // 'tel': telController.text,
                // 'occup': occupController.text,
                // 'residance': reseidancenameController.text,
                // 'husband': husbandController.text,
                // 'husband_tel': husbandTelController.text,
                // 'husband_occup': husbandOccupController.text,
                // 'blood': whatIsBlood.toString(),
                // 'allerg': allergController.text,
                // 'insurance': whichInsurance.toString(),
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

}
