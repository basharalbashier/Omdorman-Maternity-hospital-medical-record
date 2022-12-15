import 'package:aldayat_screens/constant.dart';
import 'package:flutter/material.dart';

import '../pages/add_file.dart';
import '../pages/add_gynae_file.dart';

chooseFileType(Map patient, context, size) async {
  await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'choose file\'s type for',
                      // style: kLoginTitleStyle(size/2, Colors.blueGrey.shade900),
                    ),
                  ),
                     Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                     patient['name'],
                      style: kLoginTitleStyle(size/2, Colors.blueGrey.shade900),
                    ),
                  ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                     patient['age'],
                      style: kLoginTitleStyle(size/2, Colors.blueGrey.shade900),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddFile(patient['id'])),
                            (Route<dynamic> route) => true,
                          );
                        },
                        color: Colors.red,
                        child: Text(
                          'Obs file',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddGynaeFile(patient['id'])),
                            (Route<dynamic> route) => true,
                          );
                        },
                        color: Colors.green,
                        child: Text(
                          'Gynaen file',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
