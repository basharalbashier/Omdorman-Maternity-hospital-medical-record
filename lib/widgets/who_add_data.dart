import 'package:aldayat_screens/models/am_or_pm_time.dart';
import 'package:flutter/material.dart';

Widget whoAddDataAndWhen(Size size, BuildContext context, Map data) {
  var widget = Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: size.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Created by: ', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(drName(data['dr_id'])),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Created at: ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(amOrPm(data['created_at'], true)),
          ],
        )
      ]),
    ),
  );

  return widget;
}
