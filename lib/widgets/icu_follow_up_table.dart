import 'package:flutter/material.dart';
import '../models/user_hive.dart';
import '../models/add_for_table_model.dart';
import '../pages/icu_follow_up.dart';

Widget icuFollowUpTable(List data, context, Map patient, Map admission, user) {
  List<String> tKeys = [
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
    "pip",
    "platea",
    "resistance",
    "compliance",
    "rsbi",
    "nif",
    "git",
    "us",
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
    "dr_id",
    "patient_id",
    "file_id",
    "created_at",
    "updated_at",
    "patient_id",
    "file_id",
  ];
  List<String> titles = [
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
    'MAP:',
    "Vassopressor",
    "inotropes",
    "ecg/echo",
    'Chest Examination:',
    'On mv:',
    'Oxygenation',
    'Ventilation',
    'Dynamics',
    'Weaning Parameters',
    'Infectious Diseases',
    'Fever Pattern:',
    'Positive culture site:'
        'Organism:',
    'Sensitive to:',
    'Central line\nSITE and days:',
    'catheter days:',
    'drains:',
    'ETT',
    'Renal Electrolytes, Fluid Metabolic:'
        'Health Maintenance',
    'Plan of management:'
        "FIO2",
    "PEEP",
    "MAP",
    "PO2"
        "Mode",
    "VT",
    "RR",
    "O2 sat%",
    "PIP",
    "Plateau",
    "Resistance",
    "Compliance",
    "RSBI"
        "NIF",
    "Stress ulcer bleeding prophylaxis",
    "Feeding",
    "DVT prophylaxis"
        "Activity/PT/OT",
    "Na",
    "K",
    "Mg",
    "CI",
    "Bicarb",
    "PO4",
    "BUN",
    "Cr",
    "AVG hourly UOP",
    "24 hour intake",
    "24 hour output",
    "Fluid Balance",
    'Git : aBdominal exam',
    'Obst.examination: ',
    'U/S',
    'Fetal heart sounds/CTG'
        'Surgical drains:',
    'Pulmonary:',
    'Spont breathing with O2:',
    'Without O2:',
    'RR:',
    'SPO2:'
  ];
  print(titles.length);
  print(tKeys.length);
  Size size = Size(500, 500);
  return ListView(
    scrollDirection: Axis.horizontal,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            border: TableBorder.all(width: 2, color: Colors.grey),
            columnWidths: const <int, TableColumnWidth>{
              // 0: IntrinsicColumnWidth(),
              // 1: FlexColumnWidth(),
              // 2: IntrinsicColumnWidth(),
            },
            children: <TableRow>[
              TableRow(
                children: <Widget>[
                  for (var i in titles)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          i,
                          // style: fileTitle(size),
                        )),
                      ),
                    ),
                ],
              ),
              for (Map i in data)
                TableRow(
                  children: <Widget>[
                    for (int valueIndex = 0;
                        valueIndex < titles.length;
                        valueIndex++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 32,
                          child: Center(
                              child: Text(
                            // i.keys.toList()

                            tKeys[valueIndex].toString(),
                            // style: fileTitle(size),
                          )),
                        ),
                      ),
                  ],
                ),
            ],
          ),
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
