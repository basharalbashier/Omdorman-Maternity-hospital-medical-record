import 'dart:convert';

import 'package:aldayat_screens/pages/add_patient.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../main.dart';
import '../models/error_message.dart';
import '../models/user_hive.dart';
import '../widgets/bar_code.dart';
import '../widgets/title.dart';
import 'patient_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List patients = [];

class _HomePageState extends State<HomePage> {
  
  User user = User({}, '');
  @override
  void initState() {
    getinfo(context).then((value) => setState(() {
          user = value;
          send();
          // print(user.user);
        }));
    ;
    super.initState();
  }

  send() async {
    try {
      await http.get(Uri.parse('${url}patient'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${user.token!}'
      }).then((value) {
        if (value.statusCode == 200) {
          setState(() {
            patients = json.decode(value.body);
          });
          // print('Patients :  ${json.decode(value.body)}');
        } else {
          // print('Error : ${value.body}');
          errono("${json.decode(value.body)}", "${json.decode(value.body)}",
              context, true, Container(), 1);
        }
      });
    } catch (e) {}
    // ... Navigate To your Home Page
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    if (user.token == '') {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          strokeWidth: 1,
        )),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          TitleD(user.user!['unit'], size),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            "Dr.",
                            style: kLoginSubtitleStyle(size),
                          ),
                        ),
                        Text(
                          user.user!['name'],
                          style: fileTitle(size),
                        ),
                      ],
                    ),
                    Text(
                      user.user!['level'],
                      style: kLoginSubtitleStyle(size * 1.2),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: size.width / 3,
                      child: TextFormField(
                        style: kTextFormFieldStyle(),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search by name,phone or file id',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        // controller: emailController,
                        // The validator receives the text that the user has entered.
                      ),
                    ),
                 
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        child: Center(
                          child: ElevatedButton(

                              // style:ButtonStyle(backgroundColor:Colors.te ),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AddPatient()),
                                  (Route<dynamic> route) => true,
                                );
                              },
                              child: SizedBox(
                                  height: 30,
                                  child: Center(
                                    child: Text("Add Patient"),
                                  ))),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(),

          Visibility(visible: patients.isEmpty,
            child:Center(
            child: CircularProgressIndicator(
          strokeWidth: 1,
        )), ),
          for (var item in patients)
            ListTile(
              leading: Text(item['id'].toString()),
              title: GestureDetector(
                onTap: (){
                    Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  PatientPage(patient: item,)),
                                  (Route<dynamic> route) => true,
                                );
                },
                child: Text(
                  item['name'],
                ),
              ),
              subtitle: Text(item['tel']),


              // trailing: T,
            )
       
        ],
      )),
    );
  }
}



/*

  send() async {
    try {
      await http.post(Uri.parse('${url}file/${user.user!['unit']}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${user.token!}'
          }).then((value) {
        if (value.statusCode == 200) {
          print('Patients :  ${json.decode(value.body)}');
        } else {
          print('Error : ${value.body}');
          errono("${json.decode(value.body)}", "${json.decode(value.body)}", context, true,Container(),1);
        }
      });
    } catch (e) {}
    // ... Navigate To your Home Page
  }



*/