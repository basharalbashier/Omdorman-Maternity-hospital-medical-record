import 'dart:convert';

import 'package:http/http.dart' as http;
import 'user_hive.dart';

Future<String> makeHttpRequest(
    String url, body, bool needToken, User user) async {
  String respons = '';
  try {
    await http
        .post(Uri.parse(url),
            headers: {
              'Content-type': 'application/json',
              'Accept': 'application/json',
              needToken ? 'Authorization' : 'Bearer ${user.token!}':
                  'Authorization',
            },
            body: body)
        .then((value) {
      print(json.decode(value.body));
      if ((value.statusCode == 200 || value.statusCode == 201)) {
        respons = "Successfully Sent";
      } else {
        // ${json.decode(value.body)['message']}
        respons = "Error";
      }
    });
  } catch (e) {
    respons = "Connection Error";
  }
  return respons;
}
