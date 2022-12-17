import 'package:aldayat_screens/models/get_request.dart';
import 'package:aldayat_screens/widgets/icu_follow_up_table.dart';
import 'package:aldayat_screens/widgets/icu_nurse_note.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../constant.dart';
import '../models/user_hive.dart';
import '../widgets/genterate_qr_for_file.dart';
import '../widgets/move_to_lab_button.dart';
import '../widgets/u_s_request.dart';

class IcuFile extends StatefulWidget {
  final Map admission;
  final User user;
  final Map patient;

  const IcuFile(
      {super.key,
      required this.user,
      required this.patient,
      required this.admission});

  @override
  State<IcuFile> createState() => _IcuFileState();
}

class _IcuFileState extends State<IcuFile> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    taps = [
      widget.admission['icu_file_id'] == '0'
          ? "ICU Follow up"
          : "HDU Follow up",
      "Nurse Notes"
    ];
    _tabController = TabController(length: taps.length, vsync: this);

    super.initState();
  }

  List<String> taps = [];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [heading(size), tapsWidget(size), tabView(size)],
      ),
    );
  }

  Widget heading(size) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: size.width > 750
            //
            ? largScreen(size)
            : smallScreen(size));
  }

  Widget largScreen(size) {
    return Row(
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
                              widget.patient['name'] ?? "",
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
                              widget.patient['age'] ?? "",
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
                              widget.admission['id'].toString(),
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
                              widget.admission['icu_file_id'] == "0"
                                  ? "ICU"
                                  : "HDU",
                              style: fileTitle(size),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    uSRequest(
                      context,
                      size,
                      widget.admission,
                      widget.user,
                      widget.admission['icu_file_id'] == "0" ? "ICU" : "HDU",
                    ),
                    labButton(
                      context,
                      widget.patient,
                      widget.admission,
                      widget.admission['icu_file_id'] == "0" ? "ICU" : "HDU",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // generatQr(widget.patient, widget.file, widget.type)
      ],
    );
  }

  Widget smallScreen(size) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: size.width / 4,
                      width: size.width / 4,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.asset('lib/assets/avatar.jpg')),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
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
                            widget.admission['file_id'].toString(),
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
                            widget.admission['icu_file_id'] == "0"
                                ? "ICU"
                                : "HDU",
                            style: fileTitle(size),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  uSRequest(
                    context,
                    size,
                    widget.admission,
                    widget.user,
                    widget.admission['icu_file_id'] == "0" ? "ICU" : "HDU",
                  ),
                  labButton(
                    context,
                    widget.patient,
                    widget.admission,
                    widget.admission['icu_file_id'] == "0" ? "ICU" : "HDU",
                  ),
                ],
              ),
            )
          ],
        ),
        // generatQr(widget.patient, widget.file, widget.type)
      ],
    );
  }

  TabBar tapsWidget(size) {
    return TabBar(
        onTap: (value) {
          getFollowUps();

          setState(() {});
        },
        indicatorColor: Colors.deepOrangeAccent,
        unselectedLabelColor: Colors.blueGrey.shade100,
        labelColor: Colors.blueGrey.shade900,
        controller: this._tabController,
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

  tabView(Size size) {
    return SizedBox(
        width: size.width,
        height: size.height,
        child: TabBarView(
            physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
            controller: _tabController,
            children: <Widget>[
              icuFollowUpTable(followUpList, context, widget.patient,
                  widget.admission, widget.user),
              icuNurseNoteTable(
                  nurseNote, context, widget.admission, widget.user)
            ])
        //compleat gyn tabbars
        );
  }

  List nurseNote = [];
  List followUpList = [];
  getNurse() async {
    await getIt(
            "icunurse", widget.user, context, widget.admission['id'].toString())
        .then((value) => setState(() => nurseNote = value));
  }

  getFollowUps() async {
    await getIt("icufollow", widget.user, context,
            widget.admission['id'].toString())
        .then((value) => setState(() => {followUpList = value, getNurse()}));
  }
}
