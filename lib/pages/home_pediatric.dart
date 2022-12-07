import 'dart:convert';

import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/pages/baby_file_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import '../main.dart';
import '../models/error_message.dart';
import '../models/user_hive.dart';
import '../widgets/add_baby_file_widget.dart';
import '../widgets/log_out.dart';
import '../widgets/title.dart';

class PediatricHome extends StatefulWidget {
  final User user;
  const PediatricHome({super.key,required this.user});

  @override
  State<PediatricHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<PediatricHome> {
    List baby = [];
  List babySearch = [];

@override
  void initState() {
    getBaby();
    super.initState();
  }

  void _searchChanged(String searchText) {
    if (searchText != null && searchText.isNotEmpty) {
     
              setState(() {
                babySearch = List.from(
                    baby.where((name) => name['name'].contains(searchText)));
              });
  
    } else {
   
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
                     
                      ]
                      ,
                    ),
                  )
               
                ],
              ),
            ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Divider(),
           ),
               ListView.builder(
                      shrinkWrap: true,
                      itemCount: babySearch.length,
                      itemBuilder: (context, index) => ListTile(
                            leading: Text(babySearch[index]['id'].toString()),
                            title: GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BabyFile(
                                            file: babySearch[index],
                                            user: widget.user,
                                          )),
                                  (Route<dynamic> route) => true,
                                );
                              },
                              child: Text(
                                babySearch[index]['name'],
                              ),
                            ),
                            subtitle: Text("+249${babySearch[index]['phone']}"),

                            // trailing: T,
                          )),
                

          
          ],
        ),
      ),
    );
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
}
