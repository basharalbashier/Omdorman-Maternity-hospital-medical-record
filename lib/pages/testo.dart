import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import '../constant.dart';
import '../main.dart';
import '../models/user_hive.dart';
import '../widgets/ant_adm_folow.dart';
import '../widgets/antenatal_table.dart';
import '../widgets/anticoagulation_chart_table.dart';
import '../widgets/gyn_inve_table.dart';
import 'package:http/http.dart' as http;

import '../widgets/gyne_comment_table.dart';
import '../widgets/gyne_perciption_table.dart';
import '../widgets/gyne_post_operative_follow_up_table.dart';
import '../widgets/house_off_follow_up_table.dart';
import '../widgets/iv_fluid_table.dart';
import '../widgets/labour_ward_inst.dart';
import '../widgets/neo_dr_order_table.dart';
import '../widgets/nurse_observation_table.dart';
import '../widgets/obs_discharg_drugs_table.dart';
import '../widgets/obs_treatment_table.dart';

class Testo extends StatefulWidget {
  const Testo({Key? key}) : super(key: key);

  @override
  _SearchNameState createState() => _SearchNameState();
}

class _SearchNameState extends State<Testo> {
 
 List<List> genralList=[];
  @override
  void initState() {

    super.initState();
    for (int i = 0; i < gynAdmList.length; i++) {
      print(gynAdmList[i].entries.toList());
    }
    // gynAdmList.every((element) {
    //   print(element);

    //   return true;
    // });
  }

  List<Map<String, dynamic>> gynAdmList = [
    {
      //0,3,4,5,6,7,8,9,10,
      "unit": "1",
      "gr": "1",
      "para": "1",
      "comment": "1",

      "lmp": "2022-2-2",
      "edd": "2022-11-11",
      "scan_edd": "scanEddCont.text",
      "weeks": "43",
      "past_m_history": "ghfhgjfhghgf",
      "past_s_history": "gffghghfhgf",
      "drug_history": "hgfhgfhgfhgfhgfh",
      "social_history": "hgfhgfhgfhgfhfhg",
      "hypertention": "1",
      "diabetes": "1",
      "multiple_pregnancy": "mul",
      "others": "oth",
      "chest_cvs_exam": "hgfhgfjhfuyofiyf",
      "diagnosis": "dig",
      "comments_and_social_plans": "uyoguygyuvouybb",
      "dr_id": "2",
      "patient_id": "2",
      "file_id": "2",
      "updated_at": "2022-12-05T13:40:29.000000Z",
      "created_at": "2022-12-05T13:40:29.000000Z",
      "id": 1
    }
  ];

  List obsTitles = [
    'GR',
    'Para',
      'comment',
    'LMP',
    'EDD',
    'Scan EDD',
    'GA',
    'Past Medical History',
    'Past Surgical History',
    'Drug History',
    'Social History',
    'Chest CVS  Examination',
    ' Comments & Special Plans'
  ];

  List dimo = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Table(
            border: TableBorder.all(width: .1, color: Colors.grey),
            columnWidths: <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: IntrinsicColumnWidth(),

              // 1: FlexColumnWidth(),
              // 9: FlexColumnWidth(3),
            },
            children: <TableRow>[
              for (int i = 0; i < obsTitles.length; i++)
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          obsTitles[i],
                          // textAlign: TextAlign.center,

                          style: fileTitle(size),
                        )),
                      ),
                    ),
                    // gynAdmList[i].entries
                    for (var map in gynAdmList)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 32,
                          child: Center(
                              child: Text(map.entries
                                      // .skip(1)
                                      // .skip(3)
                                      // .skip(4)
                                      // .skip(5)
                                 
                                      .skip(1) 
                                     
                                      .toList()[i]
                                      .key.toString()
                                  // textAlign: TextAlign.center,

                                  // style: fileTitle(size),
                                  )),
                        ),
                      ),
                  ],
                ),
            ])
    
      ],
    )));
  }

  doTheShit() async {
    for (int i = 0; i < 10; i++) {
      setState(() {
        dimo.add({
          "id": i,
          "comment":
              "Plain text ($i. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.Plain text (. txt) is a type of digital file that is free of computer tags, special formatting, and code. This is the only file type recognized by the Lexile Analyzer. Note: Copying and pasting or uploading text and text files other than plain text may include computer tags, special formatting, and code.",
          "dr_id": i,
          "created_at": "2022-11-12T17:34:29.$i",
          "urine": "file",
          "fh": "file",
          "eng": "file",
          "pres": "file",
          "fl": "file",
          "ga": "file",
          "bp": "digital",
          "hb": "Plain text",
          "next_visit": "free",
        });
      });
    }
    try {
      await http.get(
        Uri.parse('${url}user'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer ${user.token!}'
        },
      ).then((value) {
        if (value.statusCode == 200 || value.statusCode == 201) {
          // print(value.body);
          setState(() {
            dimo = json.decode(value.body);
          });
          List users = json.decode(value.body);

          storTheFuckers(users).then((value) async {
            List<int> ha = [];
            for (var i in dimo) {
              ha.add(i['id']);
            }

            findFromData(ha).then((value) {
              for (int i = 0; i < dimo.length; i++) {
                setState(() {
                  dimo[i]['dr_name'] = value[i];
                });
              }
            });
          });
        } else {
          // print(value.body);
          // setState(() => show = !show);
        }
      });
    } catch (e) {
      // setState(() => show = !show);
    }
  }
}
