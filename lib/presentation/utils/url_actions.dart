// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:url_launcher/url_launcher.dart';

Future<void> launchSomeUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw 'No se pudo abrir la URL: $url';
  }
}

void downloadCV(String path, String languageCode) {
  AnchorElement(href: path)
    ..download = 'CV $languageCode Gerard Gutiérrez'
    ..click();
}
