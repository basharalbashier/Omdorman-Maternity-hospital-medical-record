import 'dart:convert';

import 'package:http/http.dart' as http;
import 'user_hive.dart';

Future<dynamic> makeHttpRequest(
    String url, body, bool needToken, User user) async {
  var respons ;
  try {
    await http
        .post(Uri.parse(url),
            headers: {
              'Content-type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer ${user.token!}'
            },
            body: body)
        .then((value) {
      print(json.decode(value.body));
      if ((value.statusCode == 200 || value.statusCode == 201)) {
        respons = [json.decode(value.body),"Successfully sent"];
      } else {
        // ${json.decode(value.body)['message']}
        respons =[json.decode(value.body),"Error"] ;
      }
    });
  } catch (e) {
    respons =[ e,"Connection Error"];
  }
  return respons;
}
