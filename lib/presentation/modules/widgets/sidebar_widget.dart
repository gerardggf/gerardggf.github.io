import 'package:flutter/material.dart';

import '../../const.dart';
import 'contact_info_widget.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.black12),
      child: Column(
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
            child: const Column(
              children: [
                Text(
                  "Información de contacto",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                ContactInfoWidget(
                  label: "LinkedIn",
                  data: "gerardgutierrez",
                  url: "https://www.linkedin.com/in/gerardgutierrez/",
                  assetImage: 'assets/icons/linkedin_icon.png',
                ),
                ContactInfoWidget(
                  label: "GitHub",
                  data: "gerardggf",
                  url: "https://github.com/gerardggf",
                  assetImage: 'assets/icons/github_icon.png',
                ),
                ContactInfoWidget(
                  label: "Correo electrónico",
                  data: "ggutiflo@gmail.com",
                ),
                ContactInfoWidget(
                  label: "Teléfono móvil",
                  data: "+34 622806551",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
