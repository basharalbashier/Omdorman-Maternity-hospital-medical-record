import 'dart:convert';

import 'package:aldayat_screens/main.dart';
import 'package:aldayat_screens/models/error_message.dart';
import 'package:aldayat_screens/pages/add_file.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../models/blood_group.dart';
import '../models/user_hive.dart';
import 'file_page.dart';

class PatientPage extends StatefulWidget {
  final Map patient;
   PatientPage({super.key, required this.patient});

  @override
  State<PatientPage> createState() => _PatientPage();
}

class _PatientPage extends State<PatientPage> {
  List files=[];
  getPatientFiles()async{
          try {
      await http.post(Uri.parse('${url}file/${widget.patient['id']}'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${user.token!}'
      }).then((value) {
        if (value.statusCode == 200) {
          setState(() {
            files = json.decode(value.body);
          });
          print('Files :  ${json.decode(value.body)}');
        } else {
          print('Error : ${value.body}');
          errono("${json.decode(value.body)}", "${json.decode(value.body)}",
              context, true, Container(), 1);
        }
      });
    } catch (e) {}
    }
  User user = User({}, '');
  @override
  void initState() {
 
    getinfo(context).then((value) => setState(() {
          user = value;
           getPatientFiles();
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (user.token == '') {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          strokeWidth: 1,
        )),
      );
    }
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleD('General', size),
            Center(child: Text(widget.patient['name']),),
        

             Visibility(visible: files.isEmpty,
            child:Center(
            child: CircularProgressIndicator(
          strokeWidth: 1,
        )), ),
          for (var item in files)
            ListTile(
              leading: Text(item['id'].toString()),
              title: GestureDetector(
                onTap: (){
                    Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  FilePage(file: item,)),
                                  (Route<dynamic> route) => true,
                                );
                },
                child: Text(
                  item['created_at'],
                ),
              ),
              subtitle: Text(item['husbasnd']),


              // trailing: T,
            )
       
            ],
          ),
        ),
      ),
    );
  }

  // Login Button

}
