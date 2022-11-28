import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../main.dart';

Widget submit(String title,size, Map body,String url, bool needToken, context) {
  return Padding(
    padding: const EdgeInsets.only(left: 80.0, right: 80, bottom: 80),
    child: SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ButtonStyle(
          // backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: ()  {

        },
        child: Text(
          title,
          // style: confirmStyle(size),
        ),
      ),
    ),
  );
}

makeHttpRequest(url, body, needToken) async {
  try {
    await http
        .post(Uri.parse(url),
            headers: {
              'Content-type': 'application/json',
              'Accept': 'application/json',
              needToken ? 'Authorization' : '<Your token>': ''
            },
            body: body)
        .then((value) {
      print('Value error:  ${value.body}');
    });
  } catch (e) {
    // print(e);
  }
}
