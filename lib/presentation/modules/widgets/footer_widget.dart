import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/const.dart';
import 'package:gerardggf_cv/domain/enums.dart';
import 'package:gerardggf_cv/presentation/modules/home/home_controller.dart';

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
              child: Text('${texts.global.download} CV'),
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
}
