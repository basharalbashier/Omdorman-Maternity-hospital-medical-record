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
              needToken ? 'Authorization' : 'Bearer ${user.token!}': ''
            },
            body: body)
        .then((value) {
      print(value.body);
      if ((value.statusCode == 200 || value.statusCode == 201)) {
        respons = "Successfully Sent";
      } else {
        respons = "Connection Error";
      }
    });
  } catch (e) {
    respons = "Connection Error";
  }
  return respons;
}
