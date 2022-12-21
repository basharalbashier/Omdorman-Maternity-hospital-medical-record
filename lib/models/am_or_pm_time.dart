import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/simpleUIController.dart';

String amOrPm(String Time,bool fullDateAndtime) {
  String time ;
  String hour = Time.substring(11, 13);
  String after = Time.substring(13, 16);
  int intHour = int.parse(hour);
  if (intHour > 12) {
    time = "${intHour - 12 + 2}${after} PM";
  } else {
    time = "${intHour + 2}${after} AM";
  }
  DateTime date = DateTime.parse('2028-30-11');
String dateFormat = DateFormat('EEEE').format(date);

  return time;
}

String drName(int id) {

  Get.put(SimpleUIController());
  SimpleUIController simpleUIController = Get.find<SimpleUIController>();
  return simpleUIController.users.where((e) => e['id'] == id).isNotEmpty?simpleUIController.users.firstWhere((e) => e['id'] == id)['name']:"Not Found";

}
