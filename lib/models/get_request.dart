import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aldayat_screens/models/user_hive.dart';
import 'package:flutter/cupertino.dart';
import '../constant.dart';
import 'error_message.dart';

Future<List> getIt(
    String privateUrl, User user, BuildContext context, String fileId) async {
  List list = [];

  try {
    await http.get(
      Uri.parse('${url}$privateUrl/f/$fileId'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${user.token}'
      },
    ).then((value) {
      // print(json.decode(value.body)['message']);
      if (value.statusCode == 200 || value.statusCode == 201) {
        list = json.decode(value.body);

        return list;
      } else {
        errono(
            "${json.decode(value.body)['message']}",
            "${json.decode(value.body)['message']}",
            context,
            true,
            Container(),
            1);
        return list;
      }
    });
  } catch (e) {
    print(e);
    return list;
  }

  return list;
  // ... Navigate To your Home Page
}
