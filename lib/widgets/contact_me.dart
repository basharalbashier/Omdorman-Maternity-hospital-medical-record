import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';
import '../models/error_message.dart';

class PrivateScaffold extends Scaffold {
  final Widget body;
  final BuildContext context;
  const PrivateScaffold(this.body, this.context);
  Scaffold conntactMe(context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          body,
          Positioned(
            bottom: 0,
            right: 10,
            child: GestureDetector(
              onTap: () async {
                try {
                  await launchUrl(
                      Uri.parse("https://wa.me/+249117630388?text=Dr."));
                } catch (e) {
                  errono('+249117630388', '+249117630388', context, true,
                      Container(), 20);
                }
              },
              child: RichText(
                text: TextSpan(
                  text: 'Do you need any help?',
                  style: kHaveAnAccountStyle(Size(500, 500)),
                  children: [
                    TextSpan(
                      text: " Contact us",
                      style: kLoginOrSignUpTextStyle(Size(500, 500)),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
