import 'dart:convert';
import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/widgets/add_baby_file_widget.dart';
// import 'package:aldayat_screens/widgets/add_file_button.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:aldayat_screens/widgets/waiting_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import '../models/error_message.dart';
import '../models/user_hive.dart';
import '../widgets/add_file_widget.dart';
import '../widgets/bar_code.dart';
import '../widgets/log_out.dart';
import 'add_patient.dart';
import 'patient_page.dart';

class StatisticsHome extends StatefulWidget {
  final User user;
  const StatisticsHome({super.key, required this.user});

  @override
  State<StatisticsHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<StatisticsHome>
    with TickerProviderStateMixin {
  List patients = [];
  List searchPatients = [];
  List baby = [];
  List babySearch = [];
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    send();
    super.initState();
  }

  void _searchChanged(String searchText) {
    if (searchText != null && searchText.isNotEmpty) {
      _tabController.index == 0
          ? {
              setState(() {
                searchPatients = List.from(patients
                    .where((name) => name['name'].contains(searchText)));
              })
            }
          : {
              setState(() {
                babySearch = List.from(
                    baby.where((name) => name['name'].contains(searchText)));
              })
            };
    } else {
      setState(() {
        searchPatients = List.from(patients).reversed.toList();
      });
      setState(() {
        babySearch = List.from(baby).reversed.toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleD(Colors.deepOrangeAccent, size),

            Divider(),
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
                              suffixIcon: Visibility(
                                  visible: patients.isNotEmpty &&
                                      _tabController.index == 0,
                                  child: ScanCode(
                                    context: context,
                                    patients: patients,
                                    user: widget.user,
                                  )),
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Search',
                            ),

                            // controller: emailController,
                            // The validator receives the text that the user has entered.
                          ),
                        ),
                        Column(
                          children: [
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
                                                  const AddPatient()),
                                          (Route<dynamic> route) => true,
                                        );
                                      },
                                      child: SizedBox(
                                          height: 30,
                                          child: Center(
                                            child: Text("Add Patient"),
                                          ))),
                                ),
                              ),
                            ),
                            addBabyFileWidget(widget.user, context, 0, 0)
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            Divider(),
            mothersOrBaby(size),
            SizedBox(
                width: size.width,
                height: size.height,
                child: searchPatients.isEmpty
                    ? waitingList()
                    : TabBarView(controller: _tabController, children: <Widget>[
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: searchPatients.length,
                            itemBuilder: (context, index) => Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PatientPage(
                                                              patient:
                                                                  searchPatients[
                                                                      index],
                                                              user: widget.user,
                                                            )),
                                                    (Route<dynamic> route) =>
                                                        true,
                                                  );
                                                },
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      searchPatients[index]
                                                          ['name'],
                                                      style: fileTitle(size),
                                                    ),
                                                    Text(
                                                        "${searchPatients[index]['age']} years old"),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          addFile(searchPatients[index],
                                              context, size),
                                        ],
                                      ),
                                    ),
                                    Divider()
                                  ],
                                )

                            //
                            //

                            // trailing: T,

                            ),
                        searchPatients.isEmpty
                            ? waitingList()
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: babySearch.length,
                                itemBuilder: (context, index) => ListTile(
                                      leading: Text(
                                          babySearch[index]['id'].toString()),
                                      title: GestureDetector(
                                        onTap: () {
                                          // Navigator.pushAndRemoveUntil(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) => PatientPage(
                                          //             patient: babySearch[index],
                                          //             user: widget.user,
                                          //           )),
                                          //   (Route<dynamic> route) => true,
                                          // );
                                        },
                                        child: Text(
                                          babySearch[index]['name'],
                                        ),
                                      ),
                                      subtitle: Text(
                                          "+249${babySearch[index]['phone']}"),

                                      // trailing: T,
                                    )),
                      ])),

            // for (var item in patients.reversed)
            // ListTile(
            //   leading: Text(item['id'].toString()),
            //   title: GestureDetector(
            //     onTap: () {
            //       Navigator.pushAndRemoveUntil(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => PatientPage(
            //                   patient: item,
            //                 )),
            //         (Route<dynamic> route) => true,
            //       );
            //     },
            //     child: Text(
            //       item['name'],
            //     ),
            //   ),
            //   subtitle: Text("${item['age']} years old"),

            //   // trailing: T,
            // )
          ],
        ),
      ),
    );
  }

  send() async {
    try {
      await http.get(Uri.parse('${url}patient'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${widget.user.token!}'
      }).then((value) {
        getBaby();
        if (value.statusCode == 200) {
          setState(() {
            patients = json.decode(value.body);
            searchPatients = patients.reversed.toList();
          });
          // print('Patients :  ${json.decode(value.body)}');
        } else {
          // print('Error : ${value.body}');
          errono("${json.decode(value.body)}", "${json.decode(value.body)}",
              context, true, Container(), 1);
        }
      });
    } catch (e) {}
    // ... Navigate To your Home Page
  }

  getBaby() async {
    try {
      await http.get(Uri.parse('${url}baby'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${widget.user.token!}'
      }).then((value) {
        if (value.statusCode == 200) {
          setState(() {
            baby = json.decode(value.body);
            babySearch = baby.reversed.toList();
          });
        } else {
          // print('Error : ${value.body}');
          errono("${json.decode(value.body)}", "${json.decode(value.body)}",
              context, true, Container(), 1);
        }
      });
    } catch (e) {}
    // ... Navigate To your Home Page
  }

  late TabController _tabController;
  TabBar mothersOrBaby(size) {
    return TabBar(
        onTap: (value) {
          setState(() {});
        },
        indicatorColor: Colors.orange,
        unselectedLabelColor: Colors.blueGrey.shade100,
        labelColor: Colors.blueGrey.shade900,
        controller: _tabController,
        tabs: <Widget>[
          Tab(
            child: Text(
              "Mothers",
              style: fileTitle(size / 1.1),
            ),
          ),
          Tab(
            child: Text(
              "Baby",
              style: fileTitle(size / 1.1),
            ),
          ),
        ]);
  }
}
