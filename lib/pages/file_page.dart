import 'dart:convert';
import 'package:aldayat_screens/main.dart';
import 'package:aldayat_screens/models/error_message.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/pages/lab_request_form.dart';
import 'package:aldayat_screens/widgets/antenatal_table.dart';
import 'package:aldayat_screens/widgets/anticoagulation_chart_table.dart';
import 'package:aldayat_screens/widgets/genterate_qr_for_file.dart';
import 'package:aldayat_screens/widgets/gyn_adm_button.dart';
import 'package:aldayat_screens/widgets/gyne_comment_table.dart';
import 'package:aldayat_screens/widgets/gyne_perciption_table.dart';
import 'package:aldayat_screens/widgets/gyne_post_operative_follow_up_table.dart';
import 'package:aldayat_screens/widgets/icr_request.dart';
import 'package:aldayat_screens/widgets/iv_fluid_table.dart';
import 'package:aldayat_screens/widgets/labour_ward_inst.dart';
import 'package:aldayat_screens/widgets/nurse_observation_table.dart';
import 'package:aldayat_screens/widgets/obs_adm_button.dart';
import 'package:aldayat_screens/widgets/obs_treatment_table.dart';
import 'package:aldayat_screens/widgets/private_info_for_static.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../models/user_hive.dart';
import '../widgets/add_baby_file_widget.dart';
import '../widgets/ant_adm_folow.dart';
import '../widgets/gyn_inve_table.dart';
import '../widgets/obs_discharg_drugs_table.dart';
import '../widgets/show_gyn_adm.dart';
import '../widgets/show_obs_history.dart';
import '../widgets/u_s_request.dart';
import 'lab_history.dart';

class FilePage extends StatefulWidget {
  final Map file;
  final Map patient;
  final String type;
  final User user;
  FilePage(
      {super.key,
      required this.file,
      required this.patient,
      required this.type,
      required this.user});

  @override
  State<FilePage> createState() => _PatientPage();
}

class _PatientPage extends State<FilePage> with TickerProviderStateMixin {
  List labRequest = [];
  List obsHistory = [];
  List gynAdmList = [
    {
      "unit": "1",
      "gr": "1",
      "para": "1",
      "one": "1",
      "two": "1",
      "three": "1",
      "four": "1",
      "five": "1",
      "six": "1",
      "seven": "1",
      "eight": "1",
      "nine": "1",
      "ten": "ten",
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
  List gynInvestigation = [];
  List gynCommentList = [];
  List gynPerciptionList = [];
  List gynPostOpreative = [];
  List antfollowupList = [];
  List antAdmissionFollowupList = [];
  List labourWardInst = [];
  List nurseObserList = [];
  List antiList = [];
  List treatmentList = [];
  List disChargList = [];
  List iVfluidsList = [];

  bool showAddObsButton = false;
  TabController? _tabController;
  @override
  void initState() {
    widget.type == "0"
        ? taps = [
            "Home",
            "Antenatal Follow Up",
            "Antenatal Admission Follow Up",
            "Labour Ward Instructions",
            "Nurse Observations",
            "Treatment",
            "IV Fluids",
            "Anticoagulation Chart",
            "Discharge Drugs",
          ]
        : taps = [
            "Home",
            "Investigation",
            "Comments",
            "Perciption",
            "Post-Operative",
          ];
    getLabRequest();
    _tabController = TabController(length: taps.length, vsync: this);
    super.initState();
  }

  List obsTitles = [
    'GR',
    'Para',
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

  List taps = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleD(setUniColor(widget.user.user!['unit'] ?? ''), size),
              SizedBox(
                height: 10,
              ),
              heading(size),
              Divider(),
              widget.user.user!['dep'] != 'Department of Statistics'
                  ? obsFileTabs(size)
                  : Container(),
              SizedBox(
                  width: size.width,
                  height: size.height,
                  child: widget.type == "0"
                      ? TabBarView(
                          physics: ScrollPhysics(
                              parent: NeverScrollableScrollPhysics()),
                          controller: _tabController,
                          children: <Widget>[
                              homeWidget(size),
                              anteFollowUpTable(
                                  antfollowupList.reversed.toList(),
                                  context,
                                  widget.file,
                                  widget.user),
                              anteAdmFollowUpTable(
                                  antAdmissionFollowupList.reversed.toList(),
                                  context,
                                  widget.file,
                                  widget.user),
                              labourWardInstTable(
                                  labourWardInst.reversed.toList(),
                                  context,
                                  widget.file,
                                  widget.user),
                              nurseObserTable(nurseObserList.reversed.toList(),
                                  context, widget.file, widget.user),
                              obsTeatmentTable(treatmentList.reversed.toList(),
                                  context, widget.file, widget.user),
                              iVFluidTable(iVfluidsList.reversed.toList(),
                                  context, widget.file, widget.user),
                              anticoagulationChartTable(
                                  antiList.reversed.toList(),
                                  context,
                                  widget.file,
                                  widget.user),
                              obaDischargDrugsTable(
                                  disChargList.reversed.toList(),
                                  context,
                                  widget.file,
                                  widget.user),
                            ])
                      //compleat gyn tabbars
                      : TabBarView(
                          physics: ScrollPhysics(
                              parent: NeverScrollableScrollPhysics()),
                          controller: _tabController,
                          children: <Widget>[
                              homeWidget(size),
                              gyneInvTable(gynInvestigation.reversed.toList(),
                                  context, widget.file, widget.user),
                              gyneCommentTable(gynCommentList.reversed.toList(),
                                  context, widget.file, widget.user),
                              gynePerciptionTable(
                                  gynPerciptionList.reversed.toList(),
                                  context,
                                  widget.file,
                                  widget.user),
                              gynePostOpratFollowSheet(
                                  gynPostOpreative.reversed.toList(),
                                  context,
                                  widget.file,
                                  widget.user),
                            ])),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeWidget(size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Visibility(
            visible: showAddObsButton &&
                widget.user.user!['dep'] != 'Department of Statistics',
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.type == "0"
                    ? obsAdmissionButton(
                        context, widget.patient, widget.file, widget.user)
                    : gynAdmissionButton(
                        context, widget.patient, widget.file, widget.user)),
          ),
          Visibility(
              visible: widget.user.user!['dep'] != 'Department of Statistics' &&
                  (gynAdmList.isNotEmpty || obsHistory.isNotEmpty),
              child: Text(
                  obsHistory.isNotEmpty ? "Obstetrical History" :gynAdmList.isNotEmpty? "Gynaecolo":'',style: fileTitle(size),)),
    
                  Visibility(visible:  obsHistory.isNotEmpty || gynAdmList.isNotEmpty,
                    
                    child:obsHistory.isNotEmpty? obsHistoryTable(size,obsHistory):gynAdmissionTable(size,gynAdmList)),
          Visibility(
            visible: labRequest.isNotEmpty,
            child: SizedBox(
                width: size.width,
                height: size.height / 2,
                child: LabHistory(
                  source: labRequest,
                )),
          ),
          Visibility(
              visible: widget.user.user!['dep'] == 'Department of Statistics',
              child: privateInfo(
                  widget.file, widget.patient, size, context, widget.user)),
        ],
      ),
    );
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
              "type": widget.type
            }).then((value) {
          getObsHistory();
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
      } catch (e) {
        getObsHistory();
      }
    }
    // ... Navigate To your Home Page
  }

  getObsHistory() async {
    if (widget.user.user!['dep'] != 'Department of Statistics') {
      if (widget.type == "0") {
        try {
          await http.post(Uri.parse('${url}obs/fileid/${widget.file['id']}'),
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer ${widget.user.token!}'
              },
              body: {
                "type": widget.type
              }).then((value) {
            if (value.statusCode == 200) {
              setState(() {
                obsHistory = json.decode(value.body);
                if (obsHistory.isEmpty) {
                  showAddObsButton = true;
                }
              });
            } else {
              errono("${json.decode(value.body)}", "${json.decode(value.body)}",
                  context, true, Container(), 1);
            }
          });
        } catch (e) {}
      } else {
        await getIt('gyn').then((value) => setState(() => {
              gynAdmList = value,
              gynAdmList.isEmpty ? showAddObsButton = true : null
            }));
      }
    }
    // ... Navigate To your Home Page
  }

  checkThefuckers() async {
    if (antfollowupList.isEmpty && _tabController!.index == 1) {
      widget.type == '0'
          ? await getIt('antfollowup')
              .then((value) => setState(() => antfollowupList = value))
          : await getIt('gyninv')
              .then((value) => setState(() => gynInvestigation = value));
    }
    if (antAdmissionFollowupList.isEmpty && _tabController!.index == 2) {
      widget.type == '0'
          ? await getIt('antenaddmission')
              .then((value) => setState(() => antAdmissionFollowupList = value))
          : await getIt('gyncomment')
              .then((value) => setState(() => gynCommentList = value));
    }
    if (labourWardInst.isEmpty && _tabController!.index == 3) {
      widget.type == '0'
          ? await getIt('lwi')
              .then((value) => setState(() => labourWardInst = value))
          : await getIt('gyndrug')
              .then((value) => setState(() => gynPerciptionList = value));
    }
    if (nurseObserList.isEmpty && _tabController!.index == 4) {
      widget.type == '0'
          ? await getIt('nurseobserv')
              .then((value) => setState(() => nurseObserList = value))
          : await getIt('gynpost')
              .then((value) => setState(() => gynPostOpreative = value));
    }
    if (treatmentList.isEmpty && _tabController!.index == 5) {
      widget.type == '0'
          ? await getIt('treat')
              .then((value) => setState(() => treatmentList = value))
          : null;
    }
    if (iVfluidsList.isEmpty && _tabController!.index == 6) {
      widget.type == '0'
          ? await getIt('ivf')
              .then((value) => setState(() => iVfluidsList = value))
          : null;
    }
    if (antiList.isEmpty && _tabController!.index == 7) {
      widget.type == '0'
          ? await getIt('antico')
              .then((value) => setState(() => antiList = value))
          : null;
    }
    if (disChargList.isEmpty && _tabController!.index == 7) {
      widget.type == '0'
          ? await getIt('disgdrug')
              .then((value) => setState(() => disChargList = value))
          : null;
    }
  }

  TabBar obsFileTabs(size) {
    return TabBar(
        onTap: (value) {
          checkThefuckers();

          setState(() {});
        },
        indicatorColor: setUniColor(widget.user.user!['unit']),
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

  Future<List> getIt(String privateUrl) async {
    List list = [];
    if (widget.user.user!['dep'] != 'Department of Statistics') {
      try {
        await http.get(
          Uri.parse('$url$privateUrl/fileid/${widget.file['id']}'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${widget.user.token!}'
          },
        ).then((value) {
          print(value.body);
          if (value.statusCode == 200) {
            list = json.decode(value.body);

            return list;
          } else {
            errono("${json.decode(value.body)}", "${json.decode(value.body)}",
                context, true, Container(), 1);
            return list;
          }
        });
      } catch (e) {
        print(e);
        return list;
      }
    }

    return list;
    // ... Navigate To your Home Page
  }

  Widget heading(size) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: size.width > 750
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Image.asset('lib/assets/avatar.jpg')),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Mother"),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.patient['name'],
                              style: fileTitle(size),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Age: "),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.patient['age'].toString(),
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
                        Row(
                          children: [
                            Text("Type: "),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.type == "0" ? "OBS" : "Gynae",
                              style: fileTitle(size),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Visibility(
                                  visible: widget.user.user!['dep'] ==
                                      'Department of Statistics',
                                  child: addBabyFileWidget(widget.user, context,
                                      widget.patient['id'], widget.file['id'])),
                              Visibility(
                                visible: widget.user.user!['dep'] !=
                                    'Department of Statistics',
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    uSRequest(context, size, widget.file,
                                        widget.user, widget.type),
                                    Material(
                                      child: Center(
                                        child: ElevatedButton(

                                            // style:ButtonStyle(backgroundColor:Colors.te ),
                                            onPressed: () {
                                              Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddRequestForm(
                                                          patient:
                                                              widget.patient,
                                                          file: widget.file,
                                                          type: widget.type,
                                                        )),
                                                (Route<dynamic> route) => true,
                                              );
                                            },
                                            child: SizedBox(
                                                height: 30,
                                                child: Center(
                                                  child: Text("Lab Request"),
                                                ))),
                                      ),
                                    ),
                                    iCuRequest(context, size, widget.file,
                                        widget.user),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  generatQr(widget.patient, widget.file, widget.type)
                ],
              )
            : Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child:
                                        Image.asset('lib/assets/avatar.jpg')),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("Mother"),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.patient['name'],
                                    style: fileTitle(size),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Age: "),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.patient['age'].toString(),
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
                              Row(
                                children: [
                                  Text("Type: "),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    widget.type == "0" ? "OBS" : "Gynae",
                                    style: fileTitle(size),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(),
                      ),
                      Visibility(
                          visible: widget.user.user!['dep'] ==
                              'Department of Statistics',
                          child: addBabyFileWidget(widget.user, context,
                              widget.patient['id'], widget.file['id'])),
                      Visibility(
                        visible: widget.user.user!['dep'] !=
                            'Department of Statistics',
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              uSRequest(context, size, widget.file, widget.user,
                                  widget.type),
                              Material(
                                child: Center(
                                  child: ElevatedButton(

                                      // style:ButtonStyle(backgroundColor:Colors.te ),
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddRequestForm(
                                                    patient: widget.patient,
                                                    file: widget.file,
                                                    type: widget.type,
                                                  )),
                                          (Route<dynamic> route) => true,
                                        );
                                      },
                                      child: SizedBox(
                                          height: 30,
                                          child: Center(
                                            child: Text("Lab Request"),
                                          ))),
                                ),
                              ),
                              iCuRequest(
                                  context, size, widget.file, widget.user),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  generatQr(widget.patient, widget.file, widget.type)
                ],
              ));
  }
}
