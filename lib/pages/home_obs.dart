import 'dart:convert';
import 'package:aldayat_screens/models/setUnitColor.dart';
import 'package:aldayat_screens/widgets/log_out.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';
import '../main.dart';
import '../models/error_message.dart';
import '../models/user_hive.dart';
import '../widgets/bar_code.dart';
import '../widgets/title.dart';
import '../widgets/waiting_list.dart';
import 'patient_page.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

List patients = [];

class _HomePageState extends State<HomePage> {
  var searchController = TextEditingController();

  int patientIndex = 0;
  @override
  void initState() {
    getPatients();
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          TitleD(setUniColor(widget.user.user!['unit']), size),
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
                      Visibility(
                          visible: patients.isNotEmpty,
                          child: ScanCode(
                            context: context,
                            patients: patients,
                            user: widget.user,
                          )),
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
          Divider(),
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
                          subtitle:
                              Text("${patientSearch[index]['age']} years old"),
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
                  ))
        ],
      )),
    );
  }
}
