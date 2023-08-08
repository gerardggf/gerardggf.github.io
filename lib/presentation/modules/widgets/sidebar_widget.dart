import 'package:flutter/material.dart';

import '../../../const.dart';
import 'contact_info_widget.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/img/gerardggf_logo.jpg",
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
                const Text(
                  "Información de contacto",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                ContactInfoWidget(
                  label: "LinkedIn",
                  data: "gerardgutierrez",
                  url: "https://www.linkedin.com/in/gerardgutierrez/",
                  asset: Image.asset(
                    'assets/icons/linkedin.png',
                  ),
                ),
                ContactInfoWidget(
                  label: "GitHub",
                  data: "gerardggf",
                  url: "https://github.com/gerardggf",
                  asset: Image.asset(
                    'assets/icons/github.png',
                  ),
                ),
                ContactInfoWidget(
                  label: "Correo electrónico",
                  data: "gerard.ggf@gmail.com",
                  url: sendEmailUrl(),
                  asset: const Icon(Icons.mail),
                ),
                const ContactInfoWidget(
                  label: "Teléfono móvil",
                  data: "+34 622806551",
                  asset: Icon(Icons.phone_iphone),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String sendEmailUrl() {
    return Uri(
      scheme: 'mailto',
      path: 'gerard.ggf@gmail.com',
      //query: 'subject=Default Subject&body=Default body',
    ).toString();
  }
}
