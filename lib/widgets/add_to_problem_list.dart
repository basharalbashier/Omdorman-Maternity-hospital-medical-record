import 'dart:convert';
import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../models/user_hive.dart';

Future <void> addToProblemListDialog(contexte, Map file, User user, size,)async{
    var probController = TextEditingController();
        var commController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool show = true;
    return await showDialog<void>(
          context: contexte,
          barrierDismissible: false,
          builder: (BuildContext context) {
            
            return AlertDialog(
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  
                  Widget submit(size, file, User user) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          color: Colors.pink,
                          onPressed: () async {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancel',
                            style: confirmStyle(size),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.teal,
                          onPressed: () async {
                          
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                             setState(()=>show=!show);
                            final body = jsonEncode({
                              'problem': probController.text,
                                'comment': commController.text,
                              "dr_id": user.user!['id'].toString(),
                              "file_id": file['id'].toString(),
                               "mother_id": file['patient_id'].toString(),
                            });
                            try {
                              await http
                                  .post(Uri.parse('${url}neoprob/add'),
                                      headers: {
                                        'Content-type': 'application/json',
                                        'Accept': 'application/json',
                                        'Authorization': 'Bearer ${user.token!}'
                                      },
                                      body: body)
                                  .then((value) {
                           if(value.statusCode==200||value.statusCode ==201){
                             Navigator.of(context).pop();
                           }else{
                            print(value.body);
                             setState(()=>show=!show);
                           }
                              });
                            } catch (e) {
                              setState(()=>show=!show);
                            }
                            }
                          },
                          child: Text(
                            'Confirm',
                            style: confirmStyle(size),
                          ),
                        ),
                      ],
                    );
                  }

                  return SizedBox(
                    width: size.width,
                    child: !show?waitingWidget("3"):SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Add problem please !',
                                style: fileTitle(size),
                              ),
                            ),
                          
                            ResponsiveGridRow(children: [
                              ResponsiveGridCol(
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                         Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          alignment: Alignment(0, 0),
                                          // color: Colors.green,
                                          child: TextFormField(
                                            // maxLines: 5,
                                            style: kTextFormFieldStyle(),
                                            controller: probController,
                                            decoration: const InputDecoration(
                                              // prefixIcon: Icon(Icons.person),
                                              label: Text('Problem'),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                            ),
                                           validator: ((v){
                                            if(v!.length<2){
                                              return "Is this a Problem?";
                                            }
                                            return null;
                                           }),
                                          ),
                                        ),
                                      ),
                                    
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          alignment: Alignment(0, 0),
                                          // color: Colors.green,
                                          child: TextFormField(
                                            maxLines: 5,
                                            style: kTextFormFieldStyle(),
                                            controller: commController,
                                            decoration: const InputDecoration(
                                              // prefixIcon: Icon(Icons.person),
                                              label: Text('Comment'),
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15)),
                                              ),
                                            ),
                                           validator: ((v){
                                            if(v!.length<1){
                                              return "Is this a Comment?";
                                            }
                                            return null;
                                           }),
                                          ),
                                        ),
                                      ),
                                    
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(
                              height: size.height / 8,
                            ),
                            submit(size, file, user)
                          ]),
                    ),
                  );
                },
              ),
            );
          },
        );
     
}