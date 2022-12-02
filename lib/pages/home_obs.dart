import 'dart:convert';

import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/pages/add_patient.dart';
import 'package:aldayat_screens/widgets/log_out.dart';
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
  final User user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

List patients = [];

class _HomePageState extends State<HomePage> {
  var searchController = TextEditingController();


  @override
  void initState() {


    super.initState();
  }

  send() async {
    try {
      await http.get(Uri.parse('${url}patient'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${widget.user.token!}'
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

    if (widget.user.token == '') {
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
          TitleD(setUniColor(widget.user.user!['unit']), size),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.user.user!['level'],
                      style: kLoginSubtitleStyle(size * 1.2),
                    ),
                    SizedBox(
                      width: size.width / 3.1,
                      child: Text(
                       widget. user.user!['name'],
                        overflow: TextOverflow.fade,
                        style: fileTitle(size),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 40,
                        width: size.width / 4,
                        child: TextFormField(
                          onChanged: ((v) {}),
                          controller: searchController,
                          style: kTextFormFieldStyle(),
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          // controller: emailController,
                          // The validator receives the text that the user has entered.
                        ),
                      ),
                 
                      Visibility(
                          visible: patients.isNotEmpty,
                          child: ScanCode(
                            context: context,
                            patients: patients,
                            user: widget.user,
                          )),
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    logout(context));
                          },
                          icon: Icon(Icons.logout_outlined))
                    ],
                  ),
                )
              ],
            ),
          ),
         
          Divider(),
          Visibility(
            visible: patients.isEmpty,
            child: Center(
                child: LinearProgressIndicator(
              backgroundColor: Colors.white,
              color: setUniColor(widget.user.user!['unit']),
            )),
          ),
          for (var item in patients.reversed)
            ListTile(
              leading: Text(item['id'].toString()),
              title: GestureDetector(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PatientPage(
                              patient: item,
                              user: widget.user,
                            )),
                    (Route<dynamic> route) => true,
                  );
                },
                child: Text(
                  item['name'],
                ),
              ),
              subtitle: Text("${item['age']} years old"),

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