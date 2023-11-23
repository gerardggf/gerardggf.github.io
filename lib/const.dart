import 'package:flutter/material.dart';

const double kPadding = 15.0;

class AppColors {
  AppColors._();
  static const Color primary = Colors.black;
  static const Color secondary = Colors.orange;
  static const Color text = Colors.white;
  static const Color containers = Color.fromARGB(255, 56, 56, 56);
}

class Urls {
  static const String linkedIn = "https://www.linkedin.com/in/gerardgutierrez/";
  static const String github = "https://github.com/gerardggf";
  static const String buymeACoffee = "https://www.buymeacoffee.com/gerardggf";
  static String sendEmailUrl() {
    return Uri(
      scheme: 'mailto',
      path: 'gerard.ggf@gmail.com',
      //query: 'subject=Default Subject&body=Default body',
    ).toString();
  }
}
