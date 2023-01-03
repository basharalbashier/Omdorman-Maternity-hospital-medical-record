import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kLoginTitleStyle(Size size, Color color) => GoogleFonts.ubuntu(
    fontSize: size.height * 0.060, fontWeight: FontWeight.bold, color: color);

TextStyle kLoginSubtitleStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.020,
    );

TextStyle kLoginTermsAndPrivacyStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: 15, color: Colors.grey, height: 1.5);

TextStyle kHaveAnAccountStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: size.height * 0.022, color: Colors.black);

TextStyle kLoginOrSignUpTextStyle(
  Size size,
) =>
    GoogleFonts.ubuntu(
      fontSize: size.height * 0.022,
      fontWeight: FontWeight.w500,
      color: Colors.deepPurple,
    );

TextStyle kTextFormFieldStyle() => const TextStyle(color: Colors.black);

TextStyle fileTitle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.030,
      fontWeight: FontWeight.bold,
    );

TextStyle healthStyle(
  Size size,
) =>
    GoogleFonts.ubuntu(
      fontSize: size.height * 0.022,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );

TextStyle bloodStyle(Size size) => GoogleFonts.ubuntu(
    fontSize: size.height * 0.030,
    fontWeight: FontWeight.bold,
    color: Colors.red);

TextStyle insuranceStyle(Size size) => GoogleFonts.ubuntu(
    fontSize: size.height * 0.030,
    fontWeight: FontWeight.bold,
    color: Colors.indigo);

TextStyle confirmStyle(Size size) => GoogleFonts.ubuntu(
    fontSize: size.height * 0.030,
    fontWeight: FontWeight.bold,
    color: Colors.white);

String url = 'http://localhost:8000/api/';











/*
1 # php artisan make:mail WelcomeNewUser --markdown=emails/users/welcome-new-user

2#  composer require symfony/mailgun-mailer symfony/http-client
 */
