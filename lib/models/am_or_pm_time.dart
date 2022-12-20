String amOrPm(String dateAndTime) {
  print(dateAndTime);
  String time = '';
  String hour = dateAndTime.substring(11, 13);
  String after = dateAndTime.substring(13, 16);
  int intHour = int.parse(hour);
  if (intHour > 12) {
    time = "${intHour - 12 + 2}${after} PM";
  } else {
    time = "${intHour + 2}${after} AM";
  }

  return time;
}
