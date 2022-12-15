import 'package:flutter/material.dart';

errono(a, e, context, la, Widget ourWidget, int duratio) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: duratio),
      backgroundColor: Colors.grey.withOpacity(0.5),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 20,
                  height: 12,
                ),
                Text(
                  !la ? a : e,
                ),
              ],
            ),
          ],
        ),
      )));
}
