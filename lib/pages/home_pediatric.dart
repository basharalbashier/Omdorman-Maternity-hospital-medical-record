import 'dart:convert';

import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/pages/baby_file_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/error_message.dart';
import '../models/user_hive.dart';
import '../widgets/log_out.dart';
import '../widgets/title.dart';

class PediatricHome extends StatefulWidget {
  final User user;
  const PediatricHome({super.key, required this.user});

  @override
  State<PediatricHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<PediatricHome>
    with TickerProviderStateMixin {
  List baby = [];
  List babySearch = [];
  Widget bo = Container();
  @override
  void initState() {
    getBaby();
    super.initState();
  }

  late TabController _tabController;
  List taps = [];
  tabViews(Size size) {
    return TabBarView(
        physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        controller: _tabController,
        children: <Widget>[for (int i = 0; i < taps.length; i++) taps[i]]);
  }

  void _searchChanged(String searchText) {
    if (searchText.isNotEmpty) {
      setState(() {
        taps.clear();
        babySearch =
            List.from(baby.where((name) => name['name'].contains(searchText)));
        for (var oneBaby in babySearch) {
          setState(() {
            taps.add(BabyFile(
              file: oneBaby,
              user: widget.user,
            ));
          });
        }
      });
    } else {
      setState(() {
        taps.clear();
        babySearch = List.from(baby).reversed.toList();

        for (var oneBaby in babySearch) {
          setState(() {
            taps.add(BabyFile(
              file: oneBaby,
              user: widget.user,
            ));
          });
        }
      });
    }
  }

  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleD(Colors.lightBlue, size),
            Center(
                child: Text(
              'Pediatric',
              style: kLoginTitleStyle(size, Colors.black),
            )),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40,
                          width: size.width / 1.7,
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
            Row(
              children: [
                SizedBox(
                  width: size.width / 4,
                  height: size.height,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: babySearch.length,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              setState(() => {
                                    _selected = index,
                                    _tabController.index = index,
                                  });
                            },
                            child: Container(
                              color: index == _selected
                                  ? Colors.lightBlue.withOpacity(.2)
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          babySearch[index]['name'],
                                          style: fileTitle(size / 1.7),
                                        ),
                                        Text("${babySearch[index]['phone']}",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ],
                                    ),
                                    Container(
                                      color: index == _selected
                                          ? Colors.lightBlue
                                          : null,
                                      width: 5,
                                      height: size.height / 15,
                                      child: Text(''),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )),
                ),
                smallFileWidget(size)
              ],
            ),
          ],
        ),
      ),
    );
  }

  smallFileWidget(Size size) {
    return StatefulBuilder(
        builder: (context, setState) => SizedBox(
            width: size.width / 1.35,
            height: size.height,
            child: Stack(
              // fit: StackFit.loose,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 10,
                        color: Colors.lightBlue.withOpacity(.2),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: taps.isNotEmpty ? tabViews(size) : bo,
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: Icon(
                      Icons.fullscreen,
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BabyFile(
                                  file: babySearch[_tabController.index],
                                  user: widget.user,
                                )),
                        (Route<dynamic> route) => true,
                      );
                    },
                  ),
                ),
              ],
            )));
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
            // for (int i = 0; i < 100; i++) {
            //   baby.add(baby[0]);
            // }
            babySearch = baby.reversed.toList();
            for (var oneBaby in babySearch) {
              setState(() {
                taps.add(BabyFile(
                  file: oneBaby,
                  user: widget.user,
                ));
              });
            }
            _tabController =
                TabController(length: babySearch.length, vsync: this);
         
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
}

