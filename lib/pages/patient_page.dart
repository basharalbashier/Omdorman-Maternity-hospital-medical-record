import 'dart:convert';

import 'package:aldayat_screens/main.dart';
import 'package:aldayat_screens/models/error_message.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/pages/add_file.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../models/blood_group.dart';
import '../models/user_hive.dart';
import 'file_page.dart';

class PatientPage extends StatefulWidget {
  final Map patient;
  int? fileId;
  PatientPage({super.key, required this.patient,this.fileId});

  @override
  State<PatientPage> createState() => _PatientPage();
}

class _PatientPage extends State<PatientPage> {
  List files = [];

  bool showSorryMessage=F;
  getPatientFiles() async {
    try {
      await http.get(Uri.parse('${url}file/patientid/${widget.patient['id']}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${user.token!}'
          }).then((value) {
        if (value.statusCode == 200) {
          setState(() {
            files = json.decode(value.body);
          });
         if(files.isEmpty){

          setState((){
             showSorryMessage=true;
          });
         }
          if(widget.fileId!=null){
            for(var file in files){
              if(file['id']==widget.fileId){
                         Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => FilePage(
                        patient: widget.patient,file: file,
                      )),
              (Route<dynamic> route) => true,
            );

              }
            }

          }

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
              TitleD(setUniColor(user.user!['unit']), size),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    widget.patient['name'],
                    style: fileTitle(size),
                  ),
                ),
              ),
              Divider(),
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
                                builder: (context) =>
                                    AddFile(widget.patient['id'])),
                            (Route<dynamic> route) => true,
                          );
                        },
                        child: SizedBox(
                            height: 30,
                            child: Center(
                              child: Text("Add File"),
                            ))),
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: files.isEmpty&&!showSorryMessage,
                  child: Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 1,
                  )),
                ),
              ),

                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: files.isEmpty&&showSorryMessage,
                  child: Center(
                      child: Column(
                        children: [
                              Text("Sorry, Mother"),
                          Text("${widget.patient['name']}",style: fileTitle(size),),
                             Text("has no file yet"),
                        ],
                      )),
                ),
              ),
            
              for (var item in files)
                ListTile(
                  leading: Text(item['id'].toString()),
                  title: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FilePage(
                                  file: item,
                                  patient: widget.patient,
                                )),
                        (Route<dynamic> route) => true,
                      );
                    },
                    child: Text(item['husband']),
                  ),
                  subtitle:
                      Text(item['created_at'].toString().substring(0, 10)),

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
