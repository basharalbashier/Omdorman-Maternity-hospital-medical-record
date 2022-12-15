import 'dart:convert';

import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/pages/patient_page.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../models/error_message.dart';
import '../models/user_hive.dart';
import '../widgets/log_out.dart';
import '../widgets/show_icu_request_info.dart';
import '../widgets/waiting_list.dart';

class AnaesthiayHome extends StatefulWidget {
  final User user;
  const AnaesthiayHome({super.key, required this.user});

  @override
  State<AnaesthiayHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<AnaesthiayHome> {
  List requists = [];
  getAllRequ() async {
    await http.get(Uri.parse(url + 'icur/0'), headers: headr).then((value) =>
        {setState(() => requists = json.decode(value.body)), getPatients()});
  }

  List patients = [];
  List patientSearch = [];
  getPatients() async {
    try {
      await http.get(Uri.parse('${url}patient'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${widget.user.token!}'
      }).then((value) {
        if (value.statusCode == 200) {
          setState(() {
            patients = json.decode(value.body);
            patientSearch = patients.reversed.toList();
          });
        } else {
          errono("${json.decode(value.body)}", "${json.decode(value.body)}",
              context, true, Container(), 1);
        }
      });
    } catch (e) {}
  }

  @override
  void initState() {
    getAllRequ();
    super.initState();
  }

  showNotification(Size size, contextOfPage) {
    return Visibility(
      visible: requists.isNotEmpty,
      child: PopupMenuButton<int>(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Icon(
                  Icons.notifications,
                  size: 40,
                ),
                Positioned(
                    right: 0,
                    child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.pink,
                        child: Text(
                          '${requists.length}',
                          style: TextStyle(color: Colors.white),
                        )))
              ],
            ),
          ),
          itemBuilder: (context) => [
                for (int i = 0; i < requists.length; i++)
                  PopupMenuItem(
                      value: i,
                      // row with 2 children
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${requists[i]['comment']}"),
                          Text(
                              "${requists[i]['created_at'].toString().substring(0, 10)}"),
                          Divider()
                        ],
                      ),
                      onTap: () {
                        Future.delayed(Duration(seconds: 1))
                            .then((value) => callTheDia(requists[i], size));
                      }),

                // Pop
              ]),
    );
  }

  void _searchChanged(String searchText) {
    if (searchText != null && searchText.isNotEmpty) {
      setState(() {
        patientSearch = List.from(
            patients.where((name) => name['name'].contains(searchText)));
      });
    } else {
      setState(() {
        patientSearch = List.from(patients).reversed.toList();
      });
    }
  }

  int patientIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleD(Colors.redAccent, size),
            Center(
                child: Text(
              'Anaesthia',
              style: kLoginTitleStyle(size, Colors.black),
            )),
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
                        width: size.width / 3,
                        child: Text(
                          widget.user.user!['name'],
                          overflow: TextOverflow.fade,
                          style: fileTitle(size),
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
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 40,
                      // width: size.width / 1.7,
                      child: TextFormField(
                        onChanged: (search) => _searchChanged(search),
                        // controller: searchController,
                        style: kTextFormFieldStyle(),
                        decoration: InputDecoration(
                          // suffixIcon: Visibility(
                          //     visible: patients.isNotEmpty &&
                          //         _tabController.index == 0,
                          //     child: ScanCode(
                          //       context: context,
                          //       patients: patients,
                          //       user: widget.user,
                          //     )),
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search',
                        ),

                        // controller: emailController,
                        // The validator receives the text that the user has entered.
                      ),
                    ),
                  ),
                  showNotification(size, context)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(),
            ),
            Visibility(visible: patients.isEmpty, child: waitingList()),
            ListView.builder(
                shrinkWrap: true,
                itemCount: patientSearch.length,
                itemBuilder: (context, index) => Column(
                      children: [
                        Card(
                          color: patientIndex == patientSearch[index]['id']
                              ? Colors.blueGrey.shade100
                              : null,
                          child: ListTile(
                            leading: SizedBox(
                                height: 100,
                                width: 50,
                                child: Image.asset('lib/assets/avatar.jpg')),
                            title: Text(
                              patientSearch[index]['name'],
                              style: fileTitle(size / 1.3),
                            ),
                            subtitle: Text(
                                "${patientSearch[index]['age']} years old"),
                            trailing: IconButton(
                                icon: Icon(
                                    patientIndex == patientSearch[index]['id']
                                        ? Icons.arrow_drop_up
                                        : Icons.arrow_drop_down),
                                onPressed: () {
                                  setState(() {
                                    if (patientIndex !=
                                        patientSearch[index]['id']) {
                                      patientIndex = patientSearch[index]['id'];
                                    } else {
                                      patientIndex = 0;
                                    }
                                  });
                                }),
                          ),
                        ),
                        Visibility(
                            visible: patientIndex == patientSearch[index]['id'],
                            child: SizedBox(
                              width: size.width / 1.5,
                              height: size.height / 5,
                              child: PatientPage(
                                patient: patientSearch[index],
                                user: widget.user,
                              ),
                            ))
                      ],
                    )),
          ],
        ),
      ),
    );
  }

  callTheDia(requist, size) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ShowRequestInfo(request: requist, user: widget.user)),
      (Route<dynamic> route) => true,
    );
    // Get.to(() => ShowRequestInfo(request: requist, user: widget.user));
  }
}
