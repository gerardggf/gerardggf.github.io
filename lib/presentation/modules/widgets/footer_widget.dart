import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/const.dart';
import 'package:gerardggf_cv/domain/enums.dart';
import 'package:gerardggf_cv/presentation/modules/home/home_controller.dart';
import 'package:gerardggf_cv/presentation/utils/functions/url_actions.dart';

import '../../../generated/translations.g.dart';

class FooterWidget extends ConsumerWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ref
                    .read(homeControllerProvider.notifier)
                    .updateSection(Sections.info.name);
              },
              child: Text(
                texts.info.home,
                style: const TextStyle(color: AppColors.secondary),
              ),
            ),
            const SizedBox(width: 10),
            const Text('-'),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () {
                final locale = LocaleSettings.currentLocale;
                switch (locale) {
                  case AppLocale.en:
                    downloadCV('assets/cv_english.pdf', 'en');
                    break;
                  case AppLocale.ca:
                    downloadCV('assets/cv_english.pdf', 'ca');
                    break;
                  case AppLocale.es:
                    downloadCV('assets/cv_espanol.pdf', 'es');
                    break;
                }
              },
              child: Text(
                '${texts.global.download} CV',
                style: const TextStyle(color: AppColors.secondary),
              ),
            ),
            const SizedBox(width: 10),
            const Text('-'),
            const SizedBox(width: 20),
            Text(
              "Terrassa, Barcelona (Catalonia, Spain)  ${DateTime.now().year}",
            ),
          ],
        ),
      ),
    );
  }
}
