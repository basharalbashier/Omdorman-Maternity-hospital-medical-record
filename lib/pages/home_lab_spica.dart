import 'dart:async';
import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/models/am_or_pm_time.dart';
import 'package:aldayat_screens/models/get_request.dart';
import 'package:aldayat_screens/models/play_audio.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/widgets/lab_result.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../models/replace_key.dart';
import '../models/user_hive.dart';
import '../widgets/accept_or_not_lab_request.dart';
import '../widgets/add_external_lab_request.dart';
import '../widgets/log_out.dart';
import '../widgets/print_lab_result.dart';

class LabHome extends StatefulWidget {
  final User user;
  const LabHome({super.key, required this.user});
  @override
  State<LabHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<LabHome> with TickerProviderStateMixin {
  List labRequests = [];
  List labRequestsSearch = [];
  getAllRequests() async =>
      await getIt("lab", widget.user, context, '0').then((value) => {
            value.length != labRequests.length
                ? setState(() => {
                      shouldAlert = true,
                      _start = value.length * 10,
                      startTimer(),
                      labRequests = value,
                      labRequestsSearch = labRequests.reversed.toList()
                    })
                : null,
          });
  // ... Navigate To your Home Page

  List<String> titles = [
    "New",
    "In progress",
    "Finished",
    "Rejected",
  ];
  bool isSmall(Size size) {
    bool isSmallScreen = false;
    size.width < 700 ? isSmallScreen = true : isSmallScreen = false;
    return isSmallScreen;
  }

  bool shouldAlert = false;
  var color = Colors.white;
  late TabController _tabController;
  @override
  void initState() {
    getAllRequests();
    _tabController = TabController(length: titles.length, vsync: this);
    super.initState();
  }

  void _searchChanged(String searchText) {
    if (searchText.isNotEmpty) {
      setState(() {
        labRequestsSearch = List.from(labRequests
            .where((id) => id['id'].toString().contains(searchText)));
      });
    } else {
      setState(() {
        labRequestsSearch = List.from(labRequests).reversed.toList();
      });
    }
  }

  int _start = 0;
  Timer? _timer;
  void startTimer() async {
    const oneSec = const Duration(seconds: 1);
    // await getAllRequests().then((value) =>
    _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => {
              _start == 0
                  ? setState(() => timer.cancel())
                  : setState(
                      () => _start % 2 == 0
                          ? {color = Colors.pink, runRingTone(1)}
                          : color = Colors.white,
                    ),
              _start--,
            });
    //      _start--;
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  Widget drawer(int i, Size size) {
    return Container(
      height: size.height / 15,
      color: _tabController.index == i
          ? setUniColor(widget.user.user['unit'] ?? '').withOpacity(.2)
          : null,
      child: GestureDetector(
        onTap: () => setState(
            () => {_tabController.index = i, Navigator.of(context).pop()}),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titles[i],
                style: _tabController.index == i ? fileTitle(size / 1.5) : null,
              ),
              Container(
                color: _tabController.index == i
                    ? setUniColor(widget.user.user['unit'] ?? '')
                    : null,
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      key: _key,
      drawer: drawerWidget(size),
      floatingActionButton: Visibility(
        visible: isSmall(size) &&
            widget.user.user['dep'] != 'Department of Statistics',
        child: FloatingActionButton(
          backgroundColor: setUniColor(widget.user.user['unit'] ?? ''),
          child: Icon(Icons.menu),
          onPressed: () => _key.currentState!.openDrawer(), // <-- Opens drawer
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TitleD(setUniColor(widget.user.user['unit']), size),
          // Text(
          //   'Lab Home',
          //   style: kLoginTitleStyle(size, Colors.black),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.user.user['level'],
                      style: kLoginSubtitleStyle(size * 1.2),
                    ),
                    SizedBox(
                      width: size.width / 3.1,
                      child: Text(
                        widget.user.user['name'],
                        overflow: TextOverflow.fade,
                        style: fileTitle(size),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 40,
                              width: size.width / 2.6,
                              child: TextFormField(
                                onChanged: (search) => _searchChanged(search),
                                // controller: searchController,
                                style: kTextFormFieldStyle(),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  hintText: 'Search',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    logout(context, size));
                          },
                          icon: Icon(Icons.logout_outlined))
                    ],
                  ),
                )
              ],
            ),
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
                externalLabButton(context, {}, {}, "ex", widget.user),
                IconButton(
                  onPressed: () async => await getAllRequests(),
                  icon: Icon(Icons.refresh),
                )
              ],
            ),
          ),
          Visibility(visible: !isSmall(size), child: filterRequests(size)),
          SizedBox(
            width: size.width,
            height: size.height,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                newRequests(size),
                inProgress(size),
                finished(size),
                rejected(size)
              ],
            ),
          ),
        ],
      )),
    );
  }

  TabBar filterRequests(size) {
    return TabBar(
        indicatorColor: Colors.orange,
        unselectedLabelColor: Colors.blueGrey.shade100,
        labelColor: Colors.blueGrey.shade900,
        controller: _tabController,
        tabs: <Widget>[
          for (var i in titles)
            Tab(
              child: Text(
                i,
                style: fileTitle(size / 1.1),
              ),
            ),
        ]);
  }

  newRequests(Size size) => ListView.builder(
        shrinkWrap: true,
        itemCount: labRequestsSearch.length,
        itemBuilder: (context, index) => labRequestsSearch[index]['status'] ==
                '0'
            ? GestureDetector(
                onTap: () {
                  labRequstDialog(
                      labRequestsSearch[index], context, size, widget.user);
                },
                child: Card(
                  color: color.withOpacity(.3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ID : ${labRequestsSearch[index]['id']}",
                          style: fileTitle(size),
                        ),
                      ),
                      Text(amOrPm(labRequestsSearch[index]['created_at'], true)
                          .replaceAll("\n", " "))
                    ],
                  ),
                ))
            : Container(),
      );

  inProgress(Size size) => ListView.builder(
        shrinkWrap: true,
        itemCount: labRequestsSearch.length,
        itemBuilder: (context, index) => labRequestsSearch[index]['status'] ==
                '1'
            ? GestureDetector(
                onTap: () {
                  labResult(
                      labRequestsSearch[index], context, size, widget.user);
                },
                child: SizedBox(
                  height: size.height / 10,
                  child: Card(
                    // color: setUniColor(request['id'].toString()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "ID: ${labRequestsSearch[index]['id']}",
                            style: fileTitle(size),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Received at:  ",
                              style: fileTitle(size),
                            ),
                            Text(amOrPm(
                                    labRequestsSearch[index]['seen_at'], true)
                                .replaceAll("\n", " ")),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Received by:  ",
                              style: fileTitle(size),
                            ),
                            Text(drName(labRequestsSearch[index]['got_by_id'])),
                          ],
                        )
                      ],
                    ),
                  ),
                ))
            : Container(),
      );

  finished(Size size) => ListView.builder(
        shrinkWrap: true,
        itemCount: labRequestsSearch.length,
        itemBuilder: (context, index) => labRequestsSearch[index]['status'] ==
                '2'
            ? GestureDetector(
                onTap: () {
                  // labRequstDialog(request, context, size);
                },
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 1;
                              i <
                                  labRequestsSearch[index]
                                          .entries
                                          .map((e) => e)
                                          .toList()
                                          .length -
                                      13;
                              i++)
                            labRequestsSearch[index]
                                        .entries
                                        .map((e) => e)
                                        .toList()[i]
                                        .value !=
                                    'false'
                                ? Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          ////
                                          "${replacLabKey(labRequestsSearch[index].entries.map((e) => e).toList()[i].key)}  :  "
                                              .toUpperCase(),
                                          style: fileTitle(size),
                                        ),
                                        Text(
                                            "${labRequestsSearch[index]["result"]}"),
                                      ],
                                    ),
                                  )
                                : Container(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "comment  :  ".toUpperCase(),
                                  style: fileTitle(size),
                                ),
                                Text(labRequestsSearch[index]["comm"] ?? ''),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Requested At  :  ".toUpperCase(),
                                  style: fileTitle(size),
                                ),
                                Text(amOrPm(
                                        labRequestsSearch[index]["created_at"],
                                        true)
                                    .replaceAll("\n", " ")),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Responded At  :  ".toUpperCase(),
                                  style: fileTitle(size),
                                ),
                                Text(amOrPm(
                                        labRequestsSearch[index]["updated_at"],
                                        true)
                                    .replaceAll("\n", " ")),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Responded by  :  ".toUpperCase(),
                                  style: fileTitle(size),
                                ),
                                Text(drName(
                                  labRequestsSearch[index]["got_by_id"],
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'ID : ',
                                  style: fileTitle(size),
                                ),
                                Text("${labRequestsSearch[index]['id']}"),
                              ],
                            ),
                          ),
                          IconButton(
                              onPressed: () => Get.to(() => PrintLabResult(
                                  widget.user, labRequestsSearch[index])),
                              icon: Icon(Icons.print))
                        ],
                      ),
                    ],
                  ),
                ))
            : Container(),
      );

  rejected(Size size) => ListView.builder(
        shrinkWrap: true,
        itemCount: labRequestsSearch.length,
        itemBuilder: (context, index) => labRequestsSearch[index]['status'] ==
                '5'
            ? Card(
                // color: setUniColor(request['id'].toString()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "ID: ${labRequestsSearch[index]['id']}",
                        style: fileTitle(size),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Justification:  ",
                          style: fileTitle(size),
                        ),
                        Text(labRequestsSearch[index]['if_rejected_why']),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Rejected at:  ",
                          style: fileTitle(size),
                        ),
                        Text(amOrPm(labRequestsSearch[index]['seen_at'], true)
                            .replaceAll("\n", " ")),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Rejected by:  ",
                          style: fileTitle(size),
                        ),
                        Text(drName(labRequestsSearch[index]['got_by_id'])),
                      ],
                    )
                  ],
                ),
              )

            //if_rejected_why
            : Container(),
      );

  drawerWidget(Size size) {
    return Drawer(
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          for (int i = 0; i < _tabController.length; i++) drawer(i, size)
        ])));
  }
}
