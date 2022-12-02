





import 'package:flutter/material.dart';

import '../constant.dart';
import '../models/user_hive.dart';
import '../pages/lab_history.dart';
import '../pages/lab_request_form.dart';
import 'genterate_qr_for_file.dart';
import 'matural_assesm_button.dart';
import 'neo_admissio_button.dart';

Widget homeWidget(context, size, file, User user, List labRequest) {
  return Column(
    children: [
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: size.width > 700
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                     
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Visibility(
                                  visible: user.user!['dep'] !=
                                      'Department of Statistics',
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      maturalAssessment(context, file, user),
                                      nauAdmissionButton(context, file, user),
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
                                                            patient: {},
                                                            file: file,
                                                            type: "2",
                                                          )),
                                                  (Route<dynamic> route) =>
                                                      true,
                                                );
                                              },
                                              child: SizedBox(
                                                  height: 30,
                                                  child: Center(
                                                    child: Text("Lab Request"),
                                                  ))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    generatQr({}, file, "2")
                  ],
                )
              : Column(
                  children: [
                    Column(
                      children: [
                   
                        Visibility(
                          visible:
                              user.user!['dep'] != 'Department of Statistics',
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                maturalAssessment(context, file, user),
                                nauAdmissionButton(context, file, user),
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
                                                      patient: {},
                                                      file: file,
                                                      type: "2",
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
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    generatQr({}, file, "2")
                  ],
                )),
      Divider(),
      Visibility(
        visible: !labRequest.isEmpty,
        child: SizedBox(
            width: size.width,
            height: size.height / 2,
            child: LabHistory(
              source: labRequest,
            )),
      )
    ],
  );
}
