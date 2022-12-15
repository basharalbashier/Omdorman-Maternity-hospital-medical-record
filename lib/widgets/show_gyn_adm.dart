import 'package:flutter/material.dart';

import '../constant.dart';

Widget gynAdmissionTable(size, obsHistory) {
  List obsTitles = [
    'Patient Name',
    'Age',
    'Main Complaint',
    'History of Present',
    'LMP',
    'Cycle',
    'IMB',
        'PMB',
    'PCB',
    'Dyspareunia',
    'Vaginal Discharg',
    'Previous Gynae Operation',
    'Contraception',
    'Opstetrical History',
    'GR',
    'Para',
    'Previous C.S',
     'Past Medical History',
    'DM',
    'Hypertention',
       'Cardiac Diseases',
         'Throid Disorders',
           'Others',
           '',
           'Previous Operations',
           'Medications & Allergies'


  ];

  return Table(
      border: TableBorder.all(width: .1, color: Colors.grey),
      columnWidths: <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),

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
              for (var map in obsHistory)
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
                                .value
                                .toString()
                            // textAlign: TextAlign.center,

                            // style: fileTitle(size),
                            )),
                  ),
                ),
            ],
          ),
      ]);
}
