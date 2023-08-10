import 'package:flutter/material.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';

import 'download_cv_widget.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Gerard Gutiérrez Flotats",
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            texts.info.introText(
              age: getMyAge(),
            ),
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(height: 15),
          Text(
            texts.info.introText2,
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(height: 15),
          Text(
            texts.info.introtext3,
            style: const TextStyle(fontSize: 22),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              DownloadCvWidget(
                title: '${texts.global.download}\nCV ${texts.global.catalan}',
                path: 'assets/cv_english.pdf',
                languageCode: 'CA',
                enabled: false,
              ),
              DownloadCvWidget(
                title: '${texts.global.download}\nCV ${texts.global.spanish}',
                path: 'assets/cv_espanol.pdf',
                languageCode: 'ES',
              ),
              DownloadCvWidget(
                title: '${texts.global.download}\nCV ${texts.global.english}',
                path: 'assets/cv_english.pdf',
                languageCode: 'EN',
              ),
            ],
          ),
        ],
      ),
    );
  }

  int getMyAge() {
    final DateTime now = DateTime.now();
    final DateTime birthDate = DateTime(1999, 9, 13);
    final result = now.difference(birthDate);
    return (result.inDays / 365).floor();
  }
}
