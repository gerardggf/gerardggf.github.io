import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/const.dart';
import 'package:gerardggf_cv/domain/models/info_model.dart';
import 'package:gerardggf_cv/domain/repositories/info_repository.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';
import 'package:gerardggf_cv/presentation/modules/sections/info/widgets/canvas_message_widget.dart';
import 'package:gerardggf_cv/presentation/modules/widgets/error_widget.dart';
import 'package:gerardggf_cv/presentation/modules/widgets/loading_widget.dart';

import 'widgets/download_cv_widget.dart';

final infoFutureProvider = FutureProvider<InfoModel?>(
  (ref) => ref.watch(infoRepositoryProvider).getInfo(),
);

class InfoView extends ConsumerWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final infoFuture = ref.watch(infoFutureProvider);
    return infoFuture.when(
      data: (data) {
        if (data == null) {
          return const ErrorLoadingWidget(
              error: 'No se ha podido cargar la información');
        }
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
                  Text(
                    data.title,
                    style: const TextStyle(
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
                data.infoText,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              Text(
                data.infoText2,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              Text(
                data.infoText3,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  DownloadCvWidget(
                    title:
                        '${texts.global.download}\nCV ${texts.global.catalan}',
                    path: 'assets/cv_english.pdf',
                    languageCode: 'ca',
                    enabled: false,
                  ),
                  DownloadCvWidget(
                    title:
                        '${texts.global.download}\nCV ${texts.global.spanish}',
                    path: 'assets/cv_espanol.pdf',
                    languageCode: 'es',
                  ),
                  DownloadCvWidget(
                    title:
                        '${texts.global.download}\nCV ${texts.global.english}',
                    path: 'assets/cv_english.pdf',
                    languageCode: 'en',
                  ),
                ],
              ),
              const CanvasMessageWidget(),
            ],
          ),
        );
      },
      error: (e, __) => ErrorLoadingWidget(
        error: e.toString(),
      ),
      loading: () => const LoadingWidget(),
    );
  }

  // int getMyAge() {
  //   final DateTime now = DateTime.now();
  //   final DateTime birthDate = DateTime(1999, 9, 13);
  //   final result = now.difference(birthDate);
  //   return (result.inDays / 365).floor();
  // }
}

class RectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = AppColors.secondary
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
