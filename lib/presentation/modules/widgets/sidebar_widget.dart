import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/domain/enums.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';
import 'package:gerardggf_cv/presentation/modules/home/home_controller.dart';

import '../../../const.dart';
import '../../utils/url_actions.dart';
import 'contact_info_widget.dart';

class SidebarWidget extends ConsumerWidget {
  const SidebarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5000),
          topRight: Radius.circular(5000),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: InkWell(
              onTap: () {
                ref
                    .read(homeControllerProvider.notifier)
                    .updateSection(Sections.info.name);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(500),
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
                  asset: const Icon(
                    Icons.mail,
                    size: 40,
                  ),
                ),
                ContactInfoWidget(
                  label: texts.global.phoneNumber,
                  data: "+34 622806551",
                  asset: const Icon(
                    Icons.phone_iphone,
                    size: 40,
                  ),
                  url: 'copy',
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () async => launchSomeUrl(
              Uri.parse(Urls.buymeACoffee),
            ),
            child: Container(
              margin: const EdgeInsets.all(25),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.coffee,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Buy me a coffee',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
