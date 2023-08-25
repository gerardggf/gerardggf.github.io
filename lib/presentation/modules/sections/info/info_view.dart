import 'package:flutter/material.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';
import 'package:gerardggf_cv/presentation/modules/sections/info/canvas_message_widget.dart';

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
          Stack(
            children: [
              Positioned(
                  child: CustomPaint(
                painter: RectPainter(),
              )),
              const Text(
                "Gerard Gutiérrez Flotats",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            texts.info.introText(
              age: getMyAge(),
            ),
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 25),
          Text(
            texts.info.introText2,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 25),
          Text(
            texts.info.introtext3,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 40),
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
          const CanvasMessageWidget(),
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

class RectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      const Offset(25, 50) & const Size(600, 25),
      paint1,
    );
  }

  @override
  bool shouldRepaint(RectPainter oldDelegate) {
    return false;
  }
}
