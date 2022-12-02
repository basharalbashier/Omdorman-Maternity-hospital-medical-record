import 'package:aldayat_screens/models/check_input_isinteger.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/widgets/accept_or_not_lab_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../constant.dart';
import '../widgets/title.dart';

class UsResponseGynae extends StatefulWidget {
  const UsResponseGynae({
    super.key,
  });

  @override
  State<UsResponseGynae> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<UsResponseGynae> {
bool isEmpty=F;
  var fetalHeart = true;
  var comm = TextEditingController();
  var numPregnancesCon=TextEditingController();

  var numPregnan = ['Single', 'Twin'];

  var whatIsnumPregnan = 'Single';


  var presentation = ['Cephalic', 'Breech', 'Shoulder'];

  var whatIspresentation = '';

  var placental = ['Fundal', 'Anterior', 'Posterior', 'Not Low', 'Low'];

  var whatIsplacental = '';

  var anot = [
    'Less Than 3 CMS (Olighydraminos)',
    '3 - 8 CMS (Average)',
    'More Than 8 CMS (Polyhramnios)'
  ];

  var whatIsanot = '';

  var bioph = ['BM', 'FM', 'FT', 'Liquor'];

  var whatIsbioph = '';

  var doppler = ['Present', 'Absent', 'Reversed'];

  var whatIsdoppler = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
        
            children: [
              TitleD(setUniColor('unit'), size),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'U/S Response form',
                      style: kLoginTitleStyle(size/2,Colors.black),
                    ),
                      Text(
                      'GYNAE',
                      style: kLoginTitleStyle(size,Colors.pink),
                    ),
                  ],
                ),
              ),
              const Divider(),

              Center(child:   Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("empty Uterine cavity ?".toUpperCase()),
                                Checkbox(
                                    value:isEmpty,
                                    onChanged: ((value) {
                                

                                      setState(() {
                                   
                                        isEmpty = !isEmpty;
                                      });
                                    }))
                              ],
                            ),
                         ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: const Divider(),
                              ),

                         SizedBox(child: !isEmpty?utrineNotEmpty(size):  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width,
                  alignment: Alignment(0, 0),
                  // color: Colors.green,
                  child: TextFormField(
                    maxLines: 3,
                    controller: comm,
                    style: kTextFormFieldStyle(),
                    decoration: const InputDecoration(
                      // prefixIcon: Icon(Icons.person),

                      label: Text('Comments and Suggestions'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    // controller: nameController,
                    // The validator receives the text that the user has entered.
                  ),
                ),
              ),)
           
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget utrineNotEmpty(size){


    return Column(children: [
         Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Number of Pregnancies',
                        style: kLoginTitleStyle(size / 2,Colors.black),
                      ),
                    ],
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: ResponsiveGridRow(children: [
                      for (int i = 0; i < numPregnan.length; i++)
                        ResponsiveGridCol(
                          xs: 4,
                          md: 3,
                          child: Container(
                            height: 50,
                            alignment: Alignment(0, 0),
                            // color: Colors.purple,

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: 
                              Row(
                                children: [
                                  Text(numPregnan[i]),
                                  Checkbox(
                                      value: whatIsnumPregnan == numPregnan[i]
                                          ? true
                                          : false,
                                      onChanged: ((value) {
                                        numPregnancesCon.clear();

                                        setState(() {
                                           numPregnancesCon.clear();
                                          whatIsnumPregnan = numPregnan[i];
                                        });
                                      }))
                                ],
                              ),
                           
                            ),
                          ),
                        ),
                      ResponsiveGridCol(
                        xs: 4,
                          md: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            alignment: const Alignment(0, 0),
                            // color: Colors.green,
                            child: TextFormField(
                              onChanged: (v){
                              
                                setState(() {
                               if(v=='' || v=="1" || !checkIfInt(v)){
                                whatIsnumPregnan ="Single";
                                numPregnancesCon.clear();

                               }else if(v=='2'){
                                 whatIsnumPregnan ="Twin";
                                numPregnancesCon.clear();

                               }else{
                                   whatIsnumPregnan=v;
                               }
                                });

                              },
                              controller: numPregnancesCon,
                              style: kTextFormFieldStyle(),
                              decoration: const InputDecoration(
                                label: Text('Multiple'),
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
                  ),
                ),
               
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Fetal Heart',
                        style: kLoginTitleStyle(size / 2,Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: ResponsiveGridRow(children: [
                      ResponsiveGridCol(
                        xs: 4,
                        md: 3,
                        child: Container(
                          height: 50,
                          alignment: Alignment(0, 0),
                          // color: Colors.purple,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: fetalHeart,
                                  onChanged: (v) {
                                    setState(() {
                                      fetalHeart = !fetalHeart;
                                    });
                                  }),
                              Text(
                                'Positive',
                                // style: kLoginTitleStyle(size/4),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        xs: 4,
                        md: 3,
                        child: Container(
                          height: 50,
                          alignment: Alignment(0, 0),
                          // color: Colors.purple,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: !fetalHeart,
                                  onChanged: (v) {
                                    setState(() {
                                      fetalHeart = !fetalHeart;
                                    });
                                  }),
                              const Text(
                                'Negative',
                                // style: kLoginTitleStyle(size/4),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              
           
                Center(
                  child: Text(
                    'Fetal Biometry',
                    style: kLoginTitleStyle(size / 1.8,Colors.black),
                  ),
                ),
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 100,
                             width: size.width/4,
                      alignment: const Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        // controller: ageController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          suffix: Text('CM'),
                          label: Text('BPD'),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        // controller: nameController,
                        // The validator receives the text that the user has entered.
                      ),
                    ),
                    Container(
                      height: 100,
                      width: size.width/4,
                      alignment: const Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        // controller: ageController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          suffix: Text('Weeks'),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        // controller: nameController,
                        // The validator receives the text that the user has entered.
                      ),
                    ),
                  ],
                ),
                
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                     height: 100,
                             width: size.width/4,
                      alignment: const Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        // controller: ageController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          suffix: Text('CM'),
                          label: Text('HC'),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        // controller: nameController,
                        // The validator receives the text that the user has entered.
                      ),
                    ),
                    Container(
                    height: 100,
                             width: size.width/4,
                      alignment: const Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        // controller: ageController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          suffix: Text('Weeks'),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        // controller: nameController,
                        // The validator receives the text that the user has entered.
                      ),
                    ),
                  ],
                ),
              
              
                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                     height: 100,
                             width: size.width/4,
                      alignment: const Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        // controller: ageController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          suffix: Text('CM'),
                          label: Text('F.L'),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        // controller: nameController,
                        // The validator receives the text that the user has entered.
                      ),
                    ),
                        
                    Container(
                     height: 100,
                             width: size.width/4,
                      alignment: const Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        // controller: ageController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          suffix: Text('Weeks'),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        // controller: nameController,
                        // The validator receives the text that the user has entered.
                      ),
                    ),
                  ],
                ),
                Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     Container(
                     height: 100,
                             width: size.width/4,
                      alignment: const Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        // controller: ageController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          suffix: Text('CM'),
                          label: Text('AC'),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        // controller: nameController,
                        // The validator receives the text that the user has entered.
                      ),
                    ),
                 
                    Container(
                     height: 100,
                             width: size.width/4,
                      alignment: const Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        // controller: ageController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          suffix: Text('Weeks'),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        // controller: nameController,
                        // The validator receives the text that the user has entered.
                      ),
                    ),
                   
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
             
                    Container(
                     height: 100,
                             width: size.width/4,
                      alignment: const Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        // controller: ageController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          suffix: Text('CM'),
                          label: Text('CRL'),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        // controller: nameController,
                        // The validator receives the text that the user has entered.
                      ),
                    ),
              
                    Container(
                     height: 100,
                             width: size.width/4,
                      alignment: const Alignment(0, 0),
                      // color: Colors.green,
                      child: TextFormField(
                        // controller: ageController,
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          suffix: Text('Weeks'),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        // controller: nameController,
                        // The validator receives the text that the user has entered.
                      ),
                    ),
                  ],
                ),
                Row(

                  children: [
                    ResponsiveGridCol(
                      xs: 6,
                      md: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          alignment: const Alignment(0, 0),
                          // color: Colors.green,
                          child: TextFormField(
                            // controller: ageController,
                            style: kTextFormFieldStyle(),
                            decoration: const InputDecoration(
                              suffix: Text('Kgs'),
                              label: Text('EFW'),
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
                          alignment: const Alignment(0, 0),
                          // color: Colors.green,
                          child: TextFormField(
                            // controller: ageController,
                            style: kTextFormFieldStyle(),
                            decoration: const InputDecoration(
                              label: Text('USS EDD'),
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                Row(
                  children: [
                    Text(
                      'Placental Site',
                      style: kLoginTitleStyle(size / 2,Colors.black),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: ResponsiveGridRow(children: [
                      for (int i = 0; i < placental.length; i++)
                        ResponsiveGridCol(
                          xs: 4,
                          md: 3,
                          child: Container(
                            height: 50,
                            alignment: Alignment(0, 0),
                            // color: Colors.purple,

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(placental[i]),
                                  Checkbox(
                                      value: whatIsplacental == placental[i]
                                          ? true
                                          : false,
                                      onChanged: ((value) {
                                        setState(() {
                                          whatIsplacental = placental[i];
                                        });
                                      }))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ResponsiveGridCol(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            alignment: const Alignment(0, 0),
                            // color: Colors.green,
                            child: TextFormField(
                              // controller: ageController,
                              style: kTextFormFieldStyle(),
                              decoration: const InputDecoration(
                                label: Text('More'),
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
                  ),
                ),
               
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                Row(
                  children: [
                    Text(
                      'Amniotic Fluid Volume',
                      style: kLoginTitleStyle(size / 2,Colors.black),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'MVP',
                        style: kLoginTitleStyle(size / 3,Colors.black),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0; i < anot.length; i++)
                            Container(
                              height: 50,
                              alignment: const Alignment(0, 0),
                              // color: Colors.purple,

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value:
                                            whatIsanot == anot[i] ? true : false,
                                        onChanged: ((value) {
                                          setState(() {
                                            whatIsanot = anot[i];
                                          });
                                        })),
                                    Text(anot[i]),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width,
                    alignment: Alignment(0, 0),
                    // color: Colors.green,
                    child: TextFormField(
                      maxLines: 2,
                      controller: comm,
                      style: kTextFormFieldStyle(),
                      decoration: const InputDecoration(
                        // prefixIcon: Icon(Icons.person),

                        label: Text('Structural Abnormalities'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      // controller: nameController,
                      // The validator receives the text that the user has entered.
                    ),
                  ),
                ),
           
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width,
                    alignment: Alignment(0, 0),
                    // color: Colors.green,
                    child: TextFormField(
                      maxLines: 3,
                      controller: comm,
                      style: kTextFormFieldStyle(),
                      decoration: const InputDecoration(
                        // prefixIcon: Icon(Icons.person),

                        label: Text('Comments and Suggestions'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      // controller: nameController,
                      // The validator receives the text that the user has entered.
                    ),
                  ),
                ),
             
    ],);
  }
}
