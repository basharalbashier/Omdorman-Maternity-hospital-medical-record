import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

Widget backButton(context) {
  return Visibility(
    visible: !kIsWeb,
    child: Row(
      children: [BackButton()],
    ),
  );
}
