import 'package:aldayat_screens/constant.dart';
import 'package:aldayat_screens/widgets/title.dart';
import 'package:flutter/material.dart';
import '../models/user_hive.dart';
import '../widgets/log_out.dart';

class NutritioneHome extends StatefulWidget {
  final User user;
  const NutritioneHome({super.key, required this.user});

  @override
  State<NutritioneHome> createState() => _SurgeryHomeState();
}

class _SurgeryHomeState extends State<NutritioneHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleD(Colors.indigo, size),
            Center(
                child: Text(
              'Nutrition',
              style: kLoginTitleStyle(size, Colors.black),
            )),
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
                        SizedBox(
                          height: 40,
                          width: size.width / 4,
                          child: TextFormField(
                            onChanged: ((v) {}),
                            // controller: searchController,
                            style: kTextFormFieldStyle(),
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Search',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
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
                                      logout(context, size));
                            },
                            icon: Icon(Icons.logout_outlined))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
