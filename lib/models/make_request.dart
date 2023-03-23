import 'dart:convert';

import 'package:http/http.dart' as http;
import 'user_hive.dart';

Future<dynamic> makeHttpRequest(
    String url, body, bool needToken, User user) async {
  var response;
  try {
    var value = await http.post(Uri.parse(url),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${user.token}',
        },
        body: body);
    print(value.body);
    if (value.statusCode == 200 || value.statusCode == 201) {
      response = [json.decode(value.body), "Successfully sent"];
    } else {
      // ${json.decode(value.body)['message']}
      response = [json.decode(value.body), "Error"];
    }
  } catch (e) {
    print(e);
    response = [e, "Connection Error"];
  }
  return response;
}
