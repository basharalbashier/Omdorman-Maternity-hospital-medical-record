import 'dart:async';

import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/models/am_or_pm_time.dart';
import 'package:aldayat_screens/models/get_request.dart';
import 'package:aldayat_screens/models/play_audio.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/widgets/lab_result.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import '../models/user_hive.dart';

import '../widgets/accept_or_not_lab_request.dart';
import '../widgets/log_out.dart';
import '../widgets/waiting_list.dart';

class LabHome extends StatefulWidget {
  final User user;
  const LabHome({super.key, required this.user});

  @override
  State<LabHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<LabHome> with TickerProviderStateMixin {
  List labRequests = [];
  List labRequestsSearch = [];
  getAllRequests() async {
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
  }

  bool shouldAlert = false;
  var color = Colors.white;
  late TabController _tabController;
  @override
  void initState() {
    getAllRequests();
    _tabController = TabController(length: 4, vsync: this);

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
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            if (_start % 2 == 0) {
              color = Colors.pink;
              runRingTone(1);
            } else {
              color = Colors.white;
            }
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          TitleD(setUniColor(widget.user.user!['unit']), size),
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
                      widget.user.user!['level'],
                      style: kLoginSubtitleStyle(size * 1.2),
                    ),
                    SizedBox(
                      width: size.width / 3.1,
                      child: Text(
                        widget.user.user!['name'],
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
                                    logout(context));
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
          filterRequests(size),
          SizedBox(
            width: size.width,
            height: size.height,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Column(
                  children: [
                    Divider(),
                    Visibility(
                        visible: labRequests.isEmpty, child: waitingList()),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: labRequestsSearch.length,
                      itemBuilder: (context, index) =>
                          labRequestsSearch[index]['status'] == '0'
                              ? GestureDetector(
                                  onTap: () {
                                    labRequstDialog(labRequestsSearch[index],
                                        context, size, widget.user);
                                  },
                                  child: SizedBox(
                                    height: size.height / 10,
                                    child: Card(
                                      color: color.withOpacity(.3),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "ID : ${labRequestsSearch[index]['id']}",
                                              style: fileTitle(size),
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height / 5,
                                            child: SizedBox(
                                                width: size.width / 3,
                                                child: Text(amOrPm(
                                                    labRequestsSearch[index]
                                                        ["created_at"],
                                                    true))),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                              : Container(),
                    )
                  ],
                ),
                Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: labRequestsSearch.length,
                      itemBuilder: (context, index) =>
                          labRequestsSearch[index]['status'] == '1'
                              ? GestureDetector(
                                  onTap: () {
                                    labResult(labRequestsSearch[index], context,
                                        size, widget.user);
                                  },
                                  child: SizedBox(
                                    height: size.height / 10,
                                    child: Card(
                                      // color: setUniColor(request['id'].toString()),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                                                "Seen at:  ",
                                                style: fileTitle(size),
                                              ),
                                              Text(
                                                  "${labRequestsSearch[index]['seen_at']}"
                                                      .substring(0, 19)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                              : Container(),
                    )
                  ],
                ),
                Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: labRequestsSearch.length,
                      itemBuilder: (context, index) => labRequestsSearch[index]
                                  ['status'] ==
                              '2'
                          ? GestureDetector(
                              onTap: () {
                                // labRequstDialog(request, context, size);
                              },
                              child: Card(
                                color: setUniColor(
                                    labRequestsSearch[index]['id'].toString()),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "${labRequestsSearch[index]['id']}"),
                                    ),
                                    Column(
                                      children: [
                                        for (int i = 1;
                                            i <
                                                labRequestsSearch[index]
                                                        .entries
                                                        .map((e) => e)
                                                        .toList()
                                                        .length -
                                                    12;
                                            i++)
                                          labRequestsSearch[index]
                                                      .entries
                                                      .map((e) => e)
                                                      .toList()[i]
                                                      .value !=
                                                  'false'
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "${labRequestsSearch[index].entries.map((e) => e).toList()[i].key}   :  "
                                                            .toUpperCase(),
                                                        style: fileTitle(size),
                                                      ),
                                                      Text(
                                                          "${labRequestsSearch[index].entries.map((e) => e).toList()[i].value}"),
                                                    ],
                                                  ),
                                                )
                                              : Container(),
                                        Text(
                                            "${labRequestsSearch[index]['if_rejected_why']}"
                                                .substring(0, 19)),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                          : Container(),
                    )
                  ],
                ),
                Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: labRequestsSearch.length,
                      itemBuilder: (context, index) =>
                          labRequestsSearch[index]['status'] == '5'
                              ? GestureDetector(
                                  onTap: () {
                                    // labRequstDialog(request, context, size,user);
                                  },
                                  child: SizedBox(
                                    height: size.height / 10,
                                    child: Card(
                                      color: setUniColor(
                                          labRequestsSearch[index]['id']
                                              .toString()),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                "${labRequestsSearch[index]['id']}"),
                                          ),
                                          Text(
                                              "${labRequestsSearch[index]['if_rejected_why']}")
                                        ],
                                      ),
                                    ),
                                  ))
                              : Container(),
                    )
                  ],
                ),
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
          Tab(
            child: Text(
              "New",
              style: fileTitle(size / 1.1),
            ),
          ),
          Tab(
            child: Text(
              "In progress",
              style: fileTitle(size / 1.1),
            ),
          ),
          Tab(
            child: Text(
              "Finished",
              style: fileTitle(size / 1.1),
            ),
          ),
          Tab(
            child: Text(
              "Rejected",
              style: fileTitle(size / 1.1),
            ),
          ),
        ]);
  }
}
