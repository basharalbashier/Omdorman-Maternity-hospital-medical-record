

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../main.dart';
import '../models/user_hive.dart';

Widget iCuRequest(contexte, size, Map file, User user) {
  var remarksController = TextEditingController();

  var commentController = TextEditingController();



  Widget submit(size, file, User user) {
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
            final body =jsonEncode({
                'remarks': remarksController.text,
                'unit': user.user!['unit'].toString(),
     
                'status': "0",
                "dr_id": user.user!['id'].toString(),
                "patient_id": file['patient_id'].toString(),
                "file_id": file['id'].toString(),
                'money': "free",
              });
            try {
              await http.post(Uri.parse('${url}usrequest/add'), headers: {

                      'Content-type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer ${user.token!}'
              }, body: body).then((value) {
                print('Value error:  ${json.decode(value.body)}');
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


  return MaterialButton(
      color: Colors.teal,
      child: Text('ICU Request',style: TextStyle(color: Colors.white),),
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
                              child: Text(
            'Should we move Mother to ICU?',
            style: kLoginTitleStyle(size, Colors.black),
          ),
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
                                      controller: remarksController,
                                      style: kTextFormFieldStyle(),
                                      decoration: const InputDecoration(
                                        // prefixIcon: Icon(Icons.person),
                                        label: Text('Remarks'),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
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
                                      maxLines: 3,
                                      style: kTextFormFieldStyle(),
                                      controller: commentController,
                                      decoration: const InputDecoration(
                                        
                                        // prefixIcon: Icon(Icons.person),
                                        label: Text('Comment'),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                      ),
                                      // controller: nameController,
                                      // The validator receives the text that the user has entered.
                                    ),
                                  ),
                                ),
                              ),
                          
                            ]),
                            submit(size, file, user)
                          ]),
                    ),
                  );
                },
              ),
            );
          },
        );
      }));
}



// 
  
  