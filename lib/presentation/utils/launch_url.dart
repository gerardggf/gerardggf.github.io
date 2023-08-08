import 'package:url_launcher/url_launcher.dart';

Future<void> launchSomeUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw 'No se pudo abrir la URL: $url';
  }
}
