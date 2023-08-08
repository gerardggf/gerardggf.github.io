import 'package:flutter/material.dart';

const double kPadding = 15.0;

class AppColors {
  static const Color primary = Colors.black12;
}

class Urls {
  static const String linkedIn = "https://www.linkedin.com/in/gerardgutierrez/";
  static const String github = "https://github.com/gerardggf";
  static String sendEmailUrl() {
    return Uri(
      scheme: 'mailto',
      path: 'gerard.ggf@gmail.com',
      //query: 'subject=Default Subject&body=Default body',
    ).toString();
  }
}
