import 'package:aldayat_screens/widgets/waiting_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../constant.dart';
import '../models/user_hive.dart';
import '../models/add_for_table_model.dart';
import '../pages/icu_follow_up.dart';

Widget icuFollowUpTable(List data, context, Map patient, Map admission, user) {
  List<String> tKeys = [
    "created_at",
    "init_diag",
    "icu_diag",
    "pro_one",
    "pro_two",
    "pro_three",
    "pro_four",
    "brif_history",
    "recent_in_24",
    "gcs",
    "e",
    "v",
    "m",
    "fifteen",
    "pup_y",
    "pup_n",
    "react_y",
    "react_n",
    "sedat_drug",
    "analgesia",
    "paraly",
    "anti",
    "sedation",
    "ct",
    "mri",
    "pulse",
    "bp",
    "vassopr",
    "inotro",
    "ecg_echo",
    "with_o2",
    "without_o2",
    "pulmonary_rr",
    "spo2",
    "chest_exam",
    "fio2",
    "peep",
    "map",
    "po2",
    "mode",
    "vt",
    "rr",
    "o2",
    "pip",
    "platea",
    "resistance",
    "compliance",
    "rsbi",
    "nif",
    "git",
    "us",
    "obs",
    "fetal_heart",
    "surgical_drains",
    "postive_culture_site",
    "organism",
    "sensitive_to",
    "central_site",
    "catheter_days",
    "drains",
    "ett",
    "na",
    "k",
    "mg",
    "ci",
    "bicarb",
    "po4",
    "bun",
    "cr",
    "avg",
    "intake",
    "output",
    "fluid",
    "stress_ulcer",
    "feeding",
    "dvt",
    "activity_pt",
    "plan_of_management",
    // "dr_id",
    // "patient_id",
    // "file_id",
    // "created_at",
    // "updated_at",
  ];
  List<String> titles = [
    'Date',
    'Initial diagnosis',
    'ICU diagnosis',
    "Problem",
    "Problem",
    "Problem",
    "Problem",
    'Brief History:',
    'Recent Event in 24 hours:',
    'Nervous system: GCS',
    'E:',
    "V:",
    "M:",
    '=/15',
    'PUPILS: EQUAl: Y',
    "N:",
    "REACTIVE: Y:",
    "N:",
    "Sedative drugs",
    "Analgesia",
    "Paraytics",
    "Anticonvulsant",
    "Sedation Score",
    "CT",
    "MRI",
    'Cardiovascular system: PULSE:',
    'BP:',
    "Vassopressor",
    "inotropes",
    "ecg/echo",
    'Spont breathing with O2:',
    'Without O2:',
    'Pulmonary: RR:',
    'SPO2:',
    'Chest Examination:',
    "On mv: Oxygen FIO2",
    "On mv: Oxygen PEEP",
    'On mv: Oxygen MAP',
    "On mv: Oxygen PO2",
    "On mv: Ventilation Mode",
    "On mv: Ventilation VT",
    "On mv: Ventilation RR",
    "On mv: Ventilation O2 sat%",

    "On mv: Dynamics PIP",
    "On mv: Dynamics Plateau",
    "On mv: Dynamics Resistance",
    "On mv: Dynamics Compliance",
    "On mv: Weaning Parameters RSBI",
    "On mv: Weaning Parameters NIF",
    'Git : aBdominal exam',
    'U/S',
    'Obst.examination: ',
    'Fetal heart sounds/CTG',
    'Surgical drains:',
    'Infectious Diseases Fever Pattern: Positive culture site:',
    'Organism:',
    'Sensitive to:',
    'Central line\nSITE and days:',
    'catheter days:',
    'drains:',
    'ETT',
    "Na",
    "K",
    'MG',
    "CI",
    "Bicarb",
    "PO4",
    "BUN",
    "Cr",
    "AVG hourly UOP",
    "24 hour intake",
    "24 hour output",
    "Fluid Balance",

    "Stress ulcer bleeding prophylaxis",
    "Feeding",
    "DVT prophylaxis",
    "Activity/PT/OT",
    'Plan of management:',

    // '',

    // '',

    // 'Renal Electrolytes, Fluid Metabolic:'
    //     'Health Maintenance',

    // ',
    // "O2 sat%",
    //  "Mg",
  ];
  print(titles.length);
  print(tKeys.length);
  Size size = Size(500, 500);
  return ListView(
    // scrollDirection: Axis.,
    shrinkWrap: true,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addButtonModel(
                    "See Admission",
                    (() async =>
                        seeAdmission(context, patient, admission, user, size))),
                addButtonModel(
                    "+",
                    (() async => addToIcuFollowup(
                        context, patient, admission, user, size))),
              ],
            ),
          ],
        ),
      ),
      SizedBox(
        width: size.width * 20,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(width: 2, color: Colors.grey),
                columnWidths: const <int, TableColumnWidth>{
                  0: IntrinsicColumnWidth(),
                  1: FlexColumnWidth(),
                  // 2: IntrinsicColumnWidth(),
                },
                children: <TableRow>[
                  // for(int conu=0;conu<30;conu++)
                  // TableRow(
                  //   children: <Widget>[
                  //     for (var i in titles)

                  //   ],
                  // ),
                  for (Map followUp in data)
                    for (int valueIndex = 0;
                        valueIndex < titles.length;
                        valueIndex++)
                      TableRow(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 32,
                              child: Center(
                                  child: Text(
                                titles[valueIndex],
                                style: fileTitle(size),
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 32,
                              child: Center(
                                  child: Text(
                                // i.keys.toList()

                                valueIndex == 0
                                    ? '${followUp[tKeys[valueIndex]].toString().substring(0, 10)} \n ${followUp[tKeys[valueIndex]].toString().substring(11, 19)}'
                                    : followUp[tKeys[valueIndex]].toString(),
                                // style: fileTitle(size),
                              )),
                            ),
                          ),
                        ],
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Future<void> addToIcuFollowup(
  contexte,
  Map patient,
  Map admission,
  User user,
  size,
) async {
  Navigator.pushAndRemoveUntil(
    contexte,
    MaterialPageRoute(
        builder: (context) => IcuFollow(
              admission: admission,
              patient: patient,
              user: user,
            )),
    (Route<dynamic> route) => true,
  );
}

Future<void> seeAdmission(
  contexte,
  Map patient,
  Map admission,
  User user,
  size,
) async {
  var head = [
    'Gestational Age',
    'Regular antenatal care ',
    '',
    'Indication of ${admission['icu_file_id'] == '0' ? "IC" : "HD"}U admission',
    'Initial diagnosis',
    '',
    'Active Problem:',
    'Active Problem:',
    'Active Problem:',
    'Active Problem:',
    'Detailed History',
        'PMH'
  ];
  bool show = true;
  return await showDialog<void>(
    context: contexte,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              width: size.width,
              child: !show
                  // ignore: dead_code
                  ? waitingWidget("3")
                  : SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                '${admission['icu_file_id'] == '0' ? "IC" : "HD"}U Admission'),
                            SizedBox(
                              height: size.height / 8,
                            ),
                            ResponsiveGridRow(children: [
                              ResponsiveGridCol(
                                child: Column(
                                  children: [
                                    for (int i = 0;
                                        i < head.length;
                                        i++)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(head[i]
                                              .toString()),
                                          // Text(admission.keys
                                          //     .toList()[i]
                                          //     .toString()),
                                          Text(admission.values
                                              .toList()[i+1]==null?'':admission.values
                                              .toList()[i+1]
                                              .toString()=='true'?"Yes":admission.values
                                              .toList()[i+1]
                                              .toString()=="false"?"No":admission.values
                                              .toList()[i+1]
                                              .toString()),
                                        ],
                                      )
                                  ],
                                ),
                              ),
                            ]),
                            SizedBox(
                              height: size.height / 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                              ],
                            )
                          ]),
                    ),
            );
          },
        ),
      );
    },
  );
}
