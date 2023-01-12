import 'package:flutter/material.dart';
import 'package:gerardggf_cv/const.dart';
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
    return Padding(
      padding: const EdgeInsets.only(bottom: kPadding + 10),
      child: InkWell(
        onTap: () async => _launchUrl(
          Uri.parse(onPressedUrl),
        ),
        focusColor: Colors.red,
        child: Container(
          padding: const EdgeInsets.all(kPadding),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    data,
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
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
