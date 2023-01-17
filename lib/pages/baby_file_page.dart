import 'dart:convert';

import 'package:aldayat_screens/widgets/neo_dr_order_table.dart';
import 'package:aldayat_screens/widgets/neo_dr_progress_tabel.dart';
import 'package:aldayat_screens/widgets/neo_feeding_table.dart';
import 'package:aldayat_screens/widgets/neo_nurse_not_table.dart';
import 'package:aldayat_screens/widgets/neo_opservation_table.dart';
import 'package:aldayat_screens/widgets/neo_problem_list_table.dart';
import 'package:aldayat_screens/widgets/neo_unit_button.dart';
import 'package:aldayat_screens/widgets/new_open_mother_file.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../models/get_request.dart';
import '../models/make_request.dart';
import '../models/user_hive.dart';
import '../widgets/genterate_qr_for_file.dart';
import '../widgets/neofile_home_widget.dart';
import 'file_invistigation_table.dart';

class BabyFile extends StatefulWidget {
  final Map file;
  final User user;
  const BabyFile({super.key, required this.file, required this.user});

  @override
  State<BabyFile> createState() => _BabyFileState();
}

class _BabyFileState extends State<BabyFile> with TickerProviderStateMixin {
  List labRequest = [];
  List neoUnitList = [];
  List progressList = [];
  List doctorList = [];
  List feedList = [];
  List problemList = [];
  List nurseList = [];

  List opserList = [];
  List neoAdmList = [];
  Map patient = {};
  getPatient() async {
    await getIt('patient', widget.user, context, widget.file['patient_id'])
        .then((value) => setState(() => patient = value[0]));
  }

  late TabController _tabController;
  @override
  void initState() {
    getPatient();
    if (widget.user.user['dep'] != 'Department of Statistics') {
      _tabController = TabController(length: taps.length, vsync: this);

      checkThefuckers();
      getLabRequest();
    }
    super.initState();
  }

  @override
  void dispose() {
    neoAdmList.clear();
    neoUnitList.clear();
    super.dispose();
  }

  List taps = [
    "Home",
    "Doctor Order",
    "Feeding & Medication",
    "Problem List",
    "progress notes",
    "Nurses notes",
    "Investigations",
    "Opservations",
  ];

  Widget drawer(int i, Size size) {
    return Container(
      height: size.height / 15,
      color:
          _tabController.index == i ? Colors.lightBlue.withOpacity(.2) : null,
      child: GestureDetector(
        onTap: () => setState(() => {
              _tabController.index = i,
              checkThefuckers(),
              Navigator.of(context).pop()
            }),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                taps[i],
                style: _tabController.index == i ? fileTitle(size / 1.5) : null,
              ),
              Container(
                color: _tabController.index == i ? Colors.lightBlue : null,
                width: 5,
                height: size.height / 15,
                child: Text(''),
              )
            ],
          ),
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return myWidget(size);
  }

  Widget myWidget(size) {
    return Scaffold(
      drawer: Drawer(
        child: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: size.height / 3,
              ),
              for (int i = 0; i < taps.length; i++) drawer(i, size)
            ],
          )),
        ),
      ),
      floatingActionButton: Visibility(
        visible: size.width < 770,
        child: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          child: Icon(Icons.menu),
          onPressed: () => _key.currentState!.openDrawer(), // <-- Opens drawer
        ),
      ),
      key: _key, //
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TitleD(Colors.lightBlue, size),
            // SizedBox(
            //   height: 10,
            // ),
            header(
                size, widget.file, widget.user, context, hasNeoUnit, patient),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(),
            ),
            widget.user.user['dep'] != 'Department of Statistics'
                ? size.width > 770
                    ? babyTaps(size)
                    : Center(
                        child: Text(
                          taps[_tabController.index],
                          style: fileTitle(size),
                        ),
                      )
                : Container(),
            SizedBox(
                width: size.width, height: size.height, child: tabViews(size))
          ],
        ),
      ),
    );
  }

  bool hasNeoAdmi = true;
  bool hasNeoUnit = true;

  getLabRequest() async {
    if (widget.user.user!['dep'] != 'Department of Statistics') {
      try {
        var value = await makeHttpRequest(
            '${url}lab/fileid/${widget.file['id']}',
            json.encode({"type": "2"}),
            true,
            widget.user);

        if (value[1] == "Successfully sent") {
          setState(() {
            labRequest = value[0];
          });
        }
      } catch (e) {}
    }
    // ... Navigate To your Home Page
  }

  void checkThefuckers() async {
    if (widget.user.user!['dep'] != 'Department of Statistics') {
      if (_tabController.index == 0) {
        neoUnitList.isEmpty
            ? await getIt('neounit', widget.user, context,
                    widget.file['id'].toString())
                .then((value) => setState(() => {
                      neoUnitList = value,
                      neoUnitList.isEmpty ? hasNeoUnit = false : null
                    }))
            : null;
        neoAdmList.isEmpty
            ? await getIt(
                    'neo', widget.user, context, widget.file['id'].toString())
                .then((value) => setState(() => {
                      neoAdmList = value,
                      neoAdmList.isEmpty ? hasNeoAdmi = false : null
                    }))
            : null;
      }
      if (doctorList.isEmpty && _tabController.index == 1) {
        await getIt(
                'neodoctor', widget.user, context, widget.file['id'].toString())
            .then((value) => setState(() => doctorList = value));
      }
      if (feedList.isEmpty && _tabController.index == 2) {
        await getIt(
                'neofeed', widget.user, context, widget.file['id'].toString())
            .then((value) => setState(() => feedList = value));
      }
      if (problemList.isEmpty && _tabController.index == 3) {
        await getIt(
                'neoprob', widget.user, context, widget.file['id'].toString())
            .then((value) => setState(() => problemList = value));
      }
      if (progressList.isEmpty && _tabController.index == 4) {
        await getIt(
                'neoprog', widget.user, context, widget.file['id'].toString())
            .then((value) => setState(() => progressList = value));
      }
      if (nurseList.isEmpty && _tabController.index == 5) {
        await getIt(
                'neonurse', widget.user, context, widget.file['id'].toString())
            .then((value) => setState(() => nurseList = value));
      }
      if (labRequest.isEmpty && _tabController.index == 6) {
        getLabRequest();
      }
      if (opserList.isEmpty && _tabController.index == 7) {
        await getIt(
                'neoops', widget.user, context, widget.file['id'].toString())
            .then((value) => setState(() => opserList = value));
      }
    }
  }

  TabBar babyTaps(size) {
    return TabBar(
        onTap: (value) {
          if (widget.user.user!['dep'] != 'Department of Statistics') {
            checkThefuckers();
            setState(() {});
          }
        },
        indicatorColor: Colors.orange,
        unselectedLabelColor: Colors.blueGrey.shade100,
        labelColor: Colors.blueGrey.shade900,
        controller: _tabController,
        tabs: <Widget>[
          for (var i in taps)
            Tab(
              child: Text(
                i,
                // style: fileTitle(size / 1.1),
              ),
            ),
        ]);
  }

  tabViews(Size size) {
    return TabBarView(controller: _tabController, children: <Widget>[
      homeWidget(context, size, widget.file, widget.user, labRequest,
          !hasNeoAdmi, neoUnitList, neoAdmList),
      neoDoctorOrderTable(
          doctorList.reversed.toList(), context, widget.file, widget.user),
      neoFeedingAndMedication(
          feedList.reversed.toList(), size, context, widget.file, widget.user),
      neoProblemListTable(
          problemList.reversed.toList(), context, widget.file, widget.user),
      neoProgressTable(
          progressList.reversed.toList(), context, widget.file, widget.user),
      neoNurseNoteTable(
          nurseList.reversed.toList(), context, widget.file, widget.user),
      fileInvestigationTable(labRequest.reversed.toList(), context, widget.file,
          widget.user, patient, '3'),
      neoOpservationTable(
          opserList.reversed.toList(), size, context, widget.file, widget.user),
    ]);
  }
}

Widget header(Size size, file, user, context, bool hasNeoUnit, Map patient) {
  return size.width < 800.0
      ? SizedBox(
          width: size.width,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Name"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        file['name'],
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
                        file['date_birth'].toString(),
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
                        file['id'].toString(),
                        style: fileTitle(size),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        naoOpenMotherFileButton(context, file, user, patient)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: !hasNeoUnit,
              child: Row(
                children: [
                  Expanded(
                    child: naoUnitButton(context, file, user),
                  )
                ],
              ),
            ),
            generatQr({}, file, "2")
          ]),
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Name"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        file['name'],
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
                        file['date_birth'].toString(),
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
                        file['id'].toString(),
                        style: fileTitle(size),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        naoOpenMotherFileButton(context, file, user, patient)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: !hasNeoUnit,
              child: Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: naoUnitButton(context, file, user),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            generatQr({}, file, "2")
          ],
        );
}
