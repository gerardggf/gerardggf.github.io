import 'package:flutter/material.dart';

const double kPadding = 15.0;

class FirebasePaths {
  FirebasePaths._();

  static const String cv = 'cv';
  static const String texts = 'texts';

  static const String projectsStorage = 'cv/projects';
  static const String certificationsStorage = 'cv/certifications';
  static const String logosStorage = 'cv/logos';
}

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
  static const String buyMeACoffee = "https://www.buymeacoffee.com/gerardggf";
  static String sendEmailUrl() {
    return Uri(
      scheme: 'mailto',
      path: 'gerard.ggf@gmail.com',
    ).toString();
  }
}
