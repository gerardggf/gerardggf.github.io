import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    super.key,
    required this.label,
    required this.data,
    required this.onPressedUrl,
  });

  final String label;
  final String data;
  final String onPressedUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => _launchUrl(Uri.parse(onPressedUrl)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 18),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(data),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw 'No se pudo abrir la URL: $url';
    }
  }
}
