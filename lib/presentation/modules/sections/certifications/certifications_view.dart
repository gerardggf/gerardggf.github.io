import 'package:flutter/material.dart';
import 'package:gerardggf_cv/presentation/modules/sections/certifications/certifications_container_widget.dart';

class CertificationsView extends StatelessWidget {
  const CertificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          CertificationContainerWidget(
            school: 'Mulesoft',
            certification: 'Mulesoft Certified Developer - Level 1',
            assetPath: '/icons/mulesoft.png',
            content:
                'Certificación como desarrollador de aplicaciones para la integración de sistemas',
            date: DateTime(2022),
          ),
        ],
      ),
    );
  }
}
