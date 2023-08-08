import 'package:flutter/material.dart';
import 'package:gerardggf_cv/presentation/const.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({
    super.key,
    required this.label,
    required this.data,
    this.asset,
    this.url,
  });

  final String label, data;
  final String? url;
  final Widget? asset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kPadding),
      child: InkWell(
        onTap: url == null
            ? null
            : () async => _launchUrl(
                  Uri.parse(url!),
                ),
        focusColor: Colors.red,
        child: Container(
          padding: const EdgeInsets.all(kPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              if (asset != null)
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: asset!,
                  ),
                ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        data,
                        style: TextStyle(
                          color: url == null ? Colors.black : Colors.blue,
                        ),
                      ),
                    ),
                  ],
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
