import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/domain/enums.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';
import 'package:gerardggf_cv/presentation/modules/home/home_controller.dart';

import '../../../const.dart';
import 'contact_info_widget.dart';

class SidebarWidget extends ConsumerWidget {
  const SidebarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                ref
                    .read(homeControllerProvider.notifier)
                    .updateSection(Sections.info.name);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/img/gerardggf_logo.jpg",
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: kPadding),
            child: Column(
              children: [
                Text(
                  texts.global.contactInformation,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ContactInfoWidget(
                  label: "LinkedIn",
                  data: "gerardgutierrez",
                  url: Urls.linkedIn,
                  asset: Image.asset(
                    'assets/icons/linkedin.png',
                  ),
                ),
                ContactInfoWidget(
                  label: "GitHub",
                  data: "gerardggf",
                  url: Urls.github,
                  asset: Image.asset(
                    'assets/icons/github.png',
                  ),
                ),
                ContactInfoWidget(
                  label: texts.global.email,
                  data: "gerard.ggf@gmail.com",
                  url: Urls.sendEmailUrl(),
                  asset: const Icon(Icons.mail),
                ),
                ContactInfoWidget(
                  label: texts.global.phoneNumber,
                  data: "+34 622806551",
                  asset: const Icon(Icons.phone_iphone),
                  url: 'copy',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
