import 'dart:async';
import 'dart:convert';

import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/models/am_or_pm_time.dart';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/pages/usResponseGynae.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import '../models/error_message.dart';
import '../models/user_hive.dart';
import 'package:http/http.dart' as http;
import '../widgets/log_out.dart';
import 'uSRespons.dart';

class UltrasoundHome extends StatefulWidget {
  final User user;
  const UltrasoundHome({super.key, required this.user});

  @override
  State<UltrasoundHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<UltrasoundHome>
    with TickerProviderStateMixin {
  List usRequests = [];
  List usRequestsSearch = [];
//patient_id
  getAllRequests() async {
    try {
      await http.get(Uri.parse('${url}us'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${widget.user.token!}'
      }).then((value) {
        if (value.statusCode == 200) {
          setState(() {
            usRequests = json.decode(value.body);
            usRequestsSearch = usRequests.reversed.toList();
          });
        } else {
          errono("${json.decode(value.body)}", "${json.decode(value.body)}",
              context, true, Container(), 1);
        }
      });
    } catch (e) {
      print(e);
    }
    // ... Navigate To your Home Page
  }

  void _searchChanged(String searchText) {
    if (searchText.isNotEmpty) {
      {
        setState(() {
          usRequestsSearch = List.from(usRequests
              .where((name) => name['id'].toString().contains(searchText)));
        });
      }
    } else {
      setState(() {
        usRequestsSearch = List.from(usRequests).reversed.toList();
      });
    }
  }

  var color = Colors.white;
  late TabController _tabController;
  @override
  void initState() {
    getAllRequests();
    _tabController = TabController(length: 2, vsync: this);
    startTimer();
    super.initState();
  }

  int _start = 1000;
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
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
          child: Column(
        children: [
          TitleD(setUniColor(widget.user.user!['unit']), size),
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
                      SizedBox(
                        height: 40,
                        width: size.width / 3,
                        child: TextFormField(
                          onChanged: (search) => _searchChanged(search),
                          // controller: searchController,
                          style: kTextFormFieldStyle(),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search',
                          ),

                          // controller: emailController,
                          // The validator receives the text that the user has entered.
                        ),
                      ),

                      // Visibility(
                      //     visible: patients.isNotEmpty,
                      //     child: ScanCode(
                      //       context: context,
                      //       patients: patients,
                      //     )),
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
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: usRequestsSearch.length,
                    itemBuilder: (context, index) => usRequestsSearch[index]
                                ['status'] ==
                            '0'
                        ? GestureDetector(
                            onTap: () {
                              usRequestsSearch[index]['type'] == '0'
                                  ? Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UsResponse(
                                                user: widget.user,
                                                request:
                                                    usRequestsSearch[index],
                                              )),
                                      (Route<dynamic> route) => true,
                                    )
                                  : Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UsResponseGynae(
                                                user: widget.user,
                                                request:
                                                    usRequestsSearch[index],
                                              )),
                                      (Route<dynamic> route) => true,
                                    );
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "ID: ${usRequestsSearch[index]['id']}",
                                      style: fileTitle(size),
                                    ),
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Divider(),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "From: ${usRequestsSearch[index]['type'] == "0" ? "OBS" : "GYNAE"}",
                                              style: fileTitle(size / 1.3),
                                            ),
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: size.width / 20,
                                                height: size.width / 20,
                                                color: setUniColor(
                                                    usRequestsSearch[index]
                                                            ['unit']
                                                        .toString()),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Unit: ${usRequestsSearch[index]['unit']}",
                                                  style: fileTitle(size / 1.3),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            for (int i = 3;
                                                i <
                                                    usRequestsSearch[index]
                                                            .entries
                                                            .map((e) => e)
                                                            .toList()
                                                            .length -
                                                        10;
                                                i++)
                                              usRequestsSearch[index]
                                                          .entries
                                                          .map((e) => e)
                                                          .toList()[i]
                                                          .value !=
                                                      null
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "${i - 2}   /  "
                                                                .toUpperCase(),
                                                            style:
                                                                fileTitle(size),
                                                          ),
                                                          Text(
                                                              "${usRequestsSearch[index].entries.map((e) => e).toList()[i].value}"),
                                                        ],
                                                      ),
                                                    )
                                                  : Container(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: color,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20))),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Doctor remarks:",
                                                          style: fileTitle(
                                                              size / 1.5),
                                                        ),
                                                        SizedBox(
                                                            width:
                                                                size.width / 3,
                                                            child: Text(
                                                              "${usRequestsSearch[index]['remarks']}",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Sent:  ${amOrPm(usRequestsSearch[index]['created_at'], true).replaceAll('\n', ' ')}",
                                      // style: fileTitle(size/1.3),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                        : Container()),
                Column(
                  children: [
                    for (var request in usRequestsSearch.reversed)
                      request['status'] == '2'
                          ? Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "ID: ${request['id']}",
                                      style: fileTitle(size),
                                    ),
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          Divider(),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "From: ${request['type'] == "0" ? "OBS" : "GYNAE"}",
                                              style: fileTitle(size / 1.3),
                                            ),
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: size.width / 20,
                                                height: size.width / 20,
                                                color: setUniColor(
                                                    request['unit'].toString()),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Unit: ${request['unit']}",
                                                  style: fileTitle(size / 1.3),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            for (int i = 3;
                                                i <
                                                    request.entries
                                                            .map((e) => e)
                                                            .toList()
                                                            .length -
                                                        10;
                                                i++)
                                              request.entries
                                                          .map((e) => e)
                                                          .toList()[i]
                                                          .value !=
                                                      null
                                                  ? Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "${i - 2}   /  "
                                                                .toUpperCase(),
                                                            style:
                                                                fileTitle(size),
                                                          ),
                                                          Text(
                                                              "${request.entries.map((e) => e).toList()[i].value}"),
                                                        ],
                                                      ),
                                                    )
                                                  : Container(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "Doctor remarks:",
                                                        style: fileTitle(
                                                            size / 1.5),
                                                      ),
                                                      SizedBox(
                                                          width: size.width / 3,
                                                          child: Text(
                                                            "${request['remarks']}",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Sent:  ${amOrPm(request['created_at'], true).replaceAll('\n', ' ')}",
                                      // style: fileTitle(size/1.3),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Responded at: ${amOrPm(request['updated_at'], true).replaceAll('\n', ' ')}",
                                      // style: fileTitle(size/1.3),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
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
              "Finished",
              style: fileTitle(size / 1.1),
            ),
          ),
        ]);
  }
}
