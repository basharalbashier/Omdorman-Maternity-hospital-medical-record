import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aldayat_screens/models/user_hive.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';
import 'error_message.dart';

Future<List> getIt(String privateUrl, User user, String token,
    BuildContext context, String fileId) async {
  List list = [];

  try {
    await http.get(
      Uri.parse('${url}$privateUrl/f/$fileId'),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    ).then((value) {
      if (value.statusCode == 200) {
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
