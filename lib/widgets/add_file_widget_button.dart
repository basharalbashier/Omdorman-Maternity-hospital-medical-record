import 'package:flutter/material.dart';

import '../models/choos_file_type.dart';
import '../models/user_hive.dart';

Widget addFile(patient, context, size,User user) {
  return SizedBox(
    width: size.width / 5,
    child: MaterialButton(
        color: Colors.amber,
        onPressed: () {
          chooseFileType(patient, context, size,user);
        },
        child: SizedBox(
            height: 30,
            child: Center(
              child: Text(
                "Add File",
                style: TextStyle(color: Colors.blueGrey.shade900),
              ),
            ))),
  );
}
