import 'dart:convert';

import 'package:aldayat_screens/widgets/matural_assesm_button.dart';
import 'package:aldayat_screens/widgets/neo_dr_order_table.dart';
import 'package:aldayat_screens/widgets/neo_dr_progress_tabel.dart';
import 'package:aldayat_screens/widgets/neo_feeding_table.dart';
import 'package:aldayat_screens/widgets/neo_investigation_table.dart';
import 'package:aldayat_screens/widgets/neo_nurse_not_table.dart';
import 'package:aldayat_screens/widgets/neo_opservation_table.dart';
import 'package:aldayat_screens/widgets/neo_problem_list_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import '../constant.dart';
import '../main.dart';
import '../models/error_message.dart';
import 'package:http/http.dart' as http;
import '../models/user_hive.dart';
import '../widgets/genterate_qr_for_file.dart';
import '../widgets/neo_admissio_button.dart';
import '../widgets/neofile_home_widget.dart';
import '../widgets/title.dart';
import 'lab_history.dart';
import 'lab_request_form.dart';

class BabyFile extends StatefulWidget {
  final Map file;
  final User user;
  const BabyFile({super.key, required this.file, required this.user});

  @override
  State<BabyFile> createState() => _BabyFileState();
}

class _BabyFileState extends State<BabyFile> with TickerProviderStateMixin {
  List labRequest = [];
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 8, vsync: this);

    getLabRequest();
    super.initState();
  }

  List taps = [
    "Doctor Order",
    "Feeding & Medication",
    "Problem List",
    "progress notes",
    "Nurses notes",
    "Investigations",
    "Opservations",
  ];

  

  @override
  Widget build(BuildContext context) {
 
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleD(Colors.lightBlue, size),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("Name"),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.file['name'],
                  style: fileTitle(size),
                ),
              ],
            ),
            Row(
              children: [
                Text("Birthday: "),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.file['date_birth'].toString(),
                  style: fileTitle(size),
                ),
              ],
            ),
            Row(
              children: [
                Text("File Id: "),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.file['id'].toString(),
                  style: fileTitle(size),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(),
            ),
            babyTaps(size),
            SizedBox(
                width: size.width,
                height: size.height,
                child:
                    TabBarView(controller: _tabController, children: <Widget>[
                  homeWidget(
                      context, size, widget.file, widget.user, labRequest),
                  neoDoctorOrderTable(
                      doctorList, context, widget.file, widget.user),
                  neoFeedingAndMedication(
                      feedList, size, context, widget.file, widget.user),
                  neoProblemListTable(
                      problemList, context, widget.file, widget.user),
                  neoProgressTable(
                      progressList, context, widget.file, widget.user),
                  neoNurseNoteTable(
                      nurseList, context, widget.file, widget.user),
                  neoInvestgationAndResultTable(
                      invList, context, widget.file, widget.user),
                  neoOpservationTable(
                      opserList, size, context, widget.file, widget.user),
                ])),
          ],
        ),
      ),
    );
  }

  List progressList = [];
  List doctorList = [];
  List feedList = [];
  List problemList = [];
  List nurseList = [];
  List invList = [];
  List opserList = [];
  getProgressNote() async {
    if (widget.user.user!['dep'] != 'Department of Statistics') {
      try {
        await http.get(
          Uri.parse('${url}neoprog/f/${widget.file['id']}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${widget.user.token!}'
          },
        ).then((value) {
          if (value.statusCode == 200) {
            setState(() {
              progressList = json.decode(value.body);
            
            });
          } else {
            print('Error : ${value.body}');
            errono("${json.decode(value.body)}", "${json.decode(value.body)}",
                context, true, Container(), 1);
          }
        });
      } catch (e) {
        print(e);
      }
    }
    // ... Navigate To your Home Page
  }

  getDoctorNote() async {
    if (widget.user.user!['dep'] != 'Department of Statistics') {
      try {
        await http.get(
          Uri.parse('${url}neodoctor/f/${widget.file['id']}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${widget.user.token!}'
          },
        ).then((value) {
          if (value.statusCode == 200) {
            setState(() {
              doctorList = json.decode(value.body);
            });
          } else {
            print('Error : ${value.body}');
            errono("${json.decode(value.body)}", "${json.decode(value.body)}",
                context, true, Container(), 1);
          }
        });
      } catch (e) {
        print(e);
      }
    }
    // ... Navigate To your Home Page
  }

  getFeedings() async {
    if (widget.user.user!['dep'] != 'Department of Statistics') {
      try {
        await http.get(
          Uri.parse('${url}neofeed/f/${widget.file['id']}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${widget.user.token!}'
          },
        ).then((value) {
          if (value.statusCode == 200) {
            setState(() {
              feedList = json.decode(value.body);
            });
          } else {
            print('Error : ${value.body}');
            errono("${json.decode(value.body)}", "${json.decode(value.body)}",
                context, true, Container(), 1);
          }
        });
      } catch (e) {
        print(e);
      }
    }
    // ... Navigate To your Home Page
  }

  getProblemList() async {
    if (widget.user.user!['dep'] != 'Department of Statistics') {
      try {
        await http.get(
          Uri.parse('${url}neoprob/f/${widget.file['id']}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${widget.user.token!}'
          },
        ).then((value) {
          if (value.statusCode == 200) {
            setState(() {
              problemList = json.decode(value.body);
            });
          } else {
            print('Error : ${value.body}');
            errono("${json.decode(value.body)}", "${json.decode(value.body)}",
                context, true, Container(), 1);
          }
        });
      } catch (e) {
        print(e);
      }
    }
    // ... Navigate To your Home Page
  }

  getNurseNote() async {
    if (widget.user.user!['dep'] != 'Department of Statistics') {
      try {
        await http.get(
          Uri.parse('${url}neonurse/f/${widget.file['id']}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${widget.user.token!}'
          },
        ).then((value) {
          if (value.statusCode == 200) {
            setState(() {
              nurseList = json.decode(value.body);
            });
          } else {
            print('Error : ${value.body}');
            errono("${json.decode(value.body)}", "${json.decode(value.body)}",
                context, true, Container(), 1);
          }
        });
      } catch (e) {
        print(e);
      }
    }
    // ... Navigate To your Home Page
  }

  getInvestigation() async {
    if (widget.user.user!['dep'] != 'Department of Statistics') {
      try {
        await http.get(
          Uri.parse('${url}neoinv/f/${widget.file['id']}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${widget.user.token!}'
          },
        ).then((value) {
          if (value.statusCode == 200) {
            setState(() {
              invList = json.decode(value.body);
            });
          } else {
            print('Error : ${value.body}');
            errono("${json.decode(value.body)}", "${json.decode(value.body)}",
                context, true, Container(), 1);
          }
        });
      } catch (e) {
        print(e);
      }
    }
    // ... Navigate To your Home Page
  }

  getOpservations() async {
    if (widget.user.user!['dep'] != 'Department of Statistics') {
      try {
        await http.get(
          Uri.parse('${url}neoops/f/${widget.file['id']}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${widget.user.token!}'
          },
        ).then((value) {
          if (value.statusCode == 200) {
            setState(() {
              opserList = json.decode(value.body);
              print(opserList);
            });
          } else {
            print('Error : ${value.body}');
            errono("${json.decode(value.body)}", "${json.decode(value.body)}",
                context, true, Container(), 1);
          }
        });
      } catch (e) {
        print(e);
      }
    }
    // ... Navigate To your Home Page
  }

  getLabRequest() async {
    if (widget.user.user!['dep'] != 'Department of Statistics') {
      try {
        await http.post(Uri.parse('${url}lab/fileid/${widget.file['id']}'),
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${widget.user.token!}'
            },
            body: {
              "type": "2"
            }).then((value) {
          if (value.statusCode == 200) {
            setState(() {
              labRequest = json.decode(value.body);
            });
          } else {
            print('Error : ${value.body}');
            errono("${json.decode(value.body)}", "${json.decode(value.body)}",
                context, true, Container(), 1);
          }
        });
      } catch (e) {}
    }
    // ... Navigate To your Home Page
  }
checkThefuckers(){
     if (doctorList.isEmpty && _tabController.index == 1) {
      getDoctorNote();
    }
    if (feedList.isEmpty && _tabController.index == 2) {
      getFeedings();
    }
    if (problemList.isEmpty && _tabController.index == 3) {
      getProblemList();
    }
    if (progressList.isEmpty && _tabController.index == 4) {
      getProgressNote();
    }
    if (nurseList.isEmpty && _tabController.index == 5) {
      getNurseNote();
    }
    if (invList.isEmpty && _tabController.index == 6) {
      getInvestigation();
    }
    if (opserList.isEmpty && _tabController.index == 7) {
      getOpservations();
    }
}
  TabBar babyTaps(size) {
    return TabBar(
        onTap: (value) {
          checkThefuckers();
          setState(() {});
        },
        indicatorColor: Colors.orange,
        unselectedLabelColor: Colors.blueGrey.shade100,
        labelColor: Colors.blueGrey.shade900,
        controller: _tabController,
        tabs: <Widget>[
          Tab(
            child: Icon(Icons.home),
          ),
          for (var i in taps)
            Tab(
              child: Text(
                i,
                // style: fileTitle(size / 1.1),
              ),
            ),
        ]);
  }
}
