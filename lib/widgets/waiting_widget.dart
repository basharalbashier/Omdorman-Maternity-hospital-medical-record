import 'package:flutter/material.dart';

import '../models/setUnitColor.dart';

Widget waitingWidget(String color) {
  return Center(
      child: LinearProgressIndicator(
    color: setUniColor(color),
    backgroundColor: Colors.white,
  ));
}
