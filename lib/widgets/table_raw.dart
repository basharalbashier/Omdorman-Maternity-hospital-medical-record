import 'package:aldayat_screens/models/am_or_pm_time.dart';
import 'package:flutter/material.dart';

TableRow makeTableRaw(Map<String, dynamic> row, List<String> keys) {
  return TableRow(
    children: <Widget>[
      for (int i = 0; i < keys.length; i++)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Center(
                child: Text(
              i == 0
                  ? amOrPm(row[keys[i]], true)
                  : (keys[i] == 'dr_id' || keys[i] == 'nurse_id'
                      ? drName(row[keys[i]])
                      : row[keys[i]] ?? ''),
              textAlign: TextAlign.center,
            )),
          ),
        ),
      //.toString().substring(0, 11)
    ],
  );
}
