



import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../main.dart';

Widget submit(size,body) {
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
          onPressed: () async {
            try {
              await http
                  .post(Uri.parse('${url}user'), headers: headr, body: body).then((value) {
                print('Value error:  ${value.body}');
              });
            } catch (e) {
              // print(e);
            }
            // Validate returns true if the form is valid, or false otherwise.
            // if (_formKey.currentState!.validate()) {
            //   // ... Navigate To your Home Page
            // }
          },
          child: Text(
            'Confirm',
            // style: confirmStyle(size),
          ),
        ),
      ),
    );
  }