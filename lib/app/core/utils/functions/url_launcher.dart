import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlString(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

Future<void> launchUrlC(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

Future<void> launchNewTabPdf(String url) async {
  if (!await launchUrl(Uri.parse(url), webOnlyWindowName: '_blank')) {
    throw Exception('Could not launch $url');
  }
}
