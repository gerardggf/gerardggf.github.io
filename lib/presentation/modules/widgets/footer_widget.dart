// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.black12),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                _downloadCV('assets/cv_english.pdf');
              },
              child: const Text('Descargar CV'),
            ),
            const SizedBox(width: 10),
            const Text('-'),
            const SizedBox(width: 20),
            Text(
              "Terrassa, Barcelona  ${DateTime.now().year}",
            ),
          ],
        ),
      ),
    );
  }

  void _downloadCV(String path) {
    AnchorElement(href: path)
      ..download = 'CV English'
      ..click();
  }
}
