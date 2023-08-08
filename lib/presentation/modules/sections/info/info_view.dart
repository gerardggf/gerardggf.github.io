import 'package:flutter/material.dart';
import 'package:gerardggf_cv/const.dart';
import 'package:gerardggf_cv/presentation/utils/url_actions.dart';

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
            "Tengo ${getMiEdad()} años y me dedico al desarrollo de aplicaciones multiplataforma con Flutter.",
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 15),
          const Text(
            'Esta página web ha sido desarrollada desde cero con dicha tecnología.\n\nA continuación se puede descargar mi Currículum Vitae, o bien navegar por las distintas pestanyas para obtener más información en detalle.',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 30),
          const Row(
            children: [
              DownloadCvWidget(
                title: 'Descargar\nCV Català',
                path: 'assets/cv_english.pdf',
              ),
              DownloadCvWidget(
                title: 'Descargar\nCV Español',
                path: 'assets/cv_english.pdf',
              ),
              DownloadCvWidget(
                title: 'Descargar\nCV English',
                path: 'assets/cv_english.pdf',
              ),
            ],
          ),
        ],
      ),
    );
  }

  int getMiEdad() {
    final DateTime now = DateTime.now();
    final DateTime birthDate = DateTime(1999, 9, 13);
    final result = now.difference(birthDate);
    return (result.inDays / 365).floor();
  }
}

class DownloadCvWidget extends StatelessWidget {
  const DownloadCvWidget({
    super.key,
    required this.title,
    required this.path,
  });

  final String title, path;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                downloadCV(path);
              },
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          Positioned(
            child: Container(
              color: Colors.black,
              child: IconButton(
                onPressed: () {
                  downloadCV(path);
                },
                icon: const Icon(
                  Icons.download,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
