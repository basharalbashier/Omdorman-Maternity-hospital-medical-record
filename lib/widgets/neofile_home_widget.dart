import 'package:aldayat_screens/widgets/neo_admission_table.dart';
import 'package:aldayat_screens/widgets/neo_unit_table.dart';
import 'package:flutter/material.dart';
import '../models/user_hive.dart';
import '../pages/lab_request_form.dart';
import 'matural_assesm_button.dart';
import 'neo_admissio_button.dart';

Widget homeWidget(context, size, file, User user, List labRequest,
    bool isVisible, List unit, List admissioList) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: size.width < 800
                ? Column(
                    children: [
                      Visibility(
                        visible:
                            user.user!['dep'] != 'Department of Statistics',
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: maturalAssessment(context, file, user),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: nauAdmissionButton(
                                    context, file, user, isVisible),
                              ),
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
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Visibility(
                      visible: user.user!['dep'] != 'Department of Statistics',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          maturalAssessment(context, file, user),
                          nauAdmissionButton(context, file, user, isVisible),
                          Material(
                            child: Center(
                              child: ElevatedButton(

                                  // style:ButtonStyle(backgroundColor:Colors.te ),
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddRequestForm(
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
                  )),
        Divider(),
        Visibility(
          visible: unit.isNotEmpty,
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: neoUnitTable(
              unit,
            ),
          ),
        ),
        Visibility(
          visible: admissioList.isNotEmpty,
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: neoAdmissionTable(
              admissioList,
            ),
          ),
        )
      ],
    ),
  );
}
