import 'package:aldayat_screens/models/user_hive.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../pages/login.dart';

Dialog logout(BuildContext context, Size size) {
  return Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)), //this right here
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('Are you leaving?', style: fileTitle(size)),
          ),
          Padding(padding: EdgeInsets.only(top: 50.0)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  color: Colors.pink,
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: confirmStyle(size),
                  ),
                ),
                MaterialButton(
                  color: Colors.teal,
                  onPressed: () async {
                    remove(context)
                        .then((value) => Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginView()),
                              (Route<dynamic> route) => false,
                            ));
                  },
                  child: Text(
                    'Yes',
                    style: confirmStyle(size),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
