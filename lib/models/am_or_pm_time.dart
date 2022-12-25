import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/simpleUIController.dart';

String amOrPm(String timeFrom, bool fullDateAndtime) {
  String time;
  String hour = timeFrom.substring(11, 13);
  String after = timeFrom.substring(13, 16);
  String dateFrom = timeFrom.substring(0, 10);
  int intHour = int.parse(hour);
  if (!fullDateAndtime) {
    if (intHour > 12) {
      time = "${intHour - 12 + 2}${after} PM";
    } else {
      time = "${intHour + 2}${after} AM";
    }
  } else {
    DateTime date = DateTime.parse(dateFrom);
    String dateFormat = DateFormat('EEEE').format(date);

    if (intHour > 12) {
      time = "$dateFormat\n${intHour - 12 + 2}${after} PM\n$dateFrom";
    } else {
      time = "$dateFormat\n${intHour + 2}${after} AM\n$dateFrom";
    }
  }

  return time;
}

String drName(String id) {
  Get.put(SimpleUIController());
  SimpleUIController simpleUIController = Get.find<SimpleUIController>();
  return simpleUIController.users.where((e) => e['id'].toString() == id).isNotEmpty
      ? simpleUIController.users.firstWhere((e) => e['id'].toString() == id)['name']
      : "Not Found";
}
