import 'package:flutter/cupertino.dart';

Future<String> pickTime(context) async {
  String timePicked = 'Time';
  await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height * 0.25,
          color: Color.fromRGBO(255, 255, 255, 1),
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            onDateTimeChanged: (value) {
              timePicked = value.toString();
            },
            initialDateTime: DateTime.now(),
            minimumYear: 2000,
            maximumYear: 3000,
          ),
        );
      });

  return timePicked;
}
