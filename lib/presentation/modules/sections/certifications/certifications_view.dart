import 'package:flutter/material.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';
import 'package:gerardggf_cv/presentation/modules/sections/certifications/certifications_container_widget.dart';

class CertificationsView extends StatelessWidget {
  const CertificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20).copyWith(top: 0),
      child: Column(
        children: [
          CertificationContainerWidget(
            school: 'Mulesoft',
            certification: 'Mulesoft Certified Developer - Level 1',
            assetPath: '/icons/mulesoft.png',
            content: texts.certificates
                .certificationAsASystemsIntegrationApplicationsDeveloperAndDataTransformationWithDataweave,
            date: DateTime(2022, 7),
            certificatePath: 'certifications/mcd_level1.png',
            skills: const ['AnyPoint Studio', 'DataWeave', 'APIs'],
          ),
          CertificationContainerWidget(
            school: 'Cambridge University',
            certification: 'First Certificate of English',
            assetPath: '/icons/cambridge.png',
            date: DateTime(2017, 7),
          ),
          CertificationContainerWidget(
            school: 'Udemy',
            certification: 'Flutter desde cero',
            assetPath: '/icons/udemy.png',
            date: DateTime(2023, 5),
            certificatePath: 'certifications/flutter_desde_cero.png',
          ),
          CertificationContainerWidget(
            school: 'Udemy',
            certification: 'Flutter Isolates',
            assetPath: '/icons/udemy.png',
            date: DateTime(2023, 5),
          ),
          const CertificationContainerWidget(
            school: 'Udemy',
            certification: 'Advanced Flutter',
            assetPath: '/icons/udemy.png',
          ),
          CertificationContainerWidget(
            school: 'Datacamp',
            certification: 'Introduction Course to SQL Server',
            assetPath: '/icons/datacamp.png',
            date: DateTime(2019, 10),
            certificatePath: 'certifications/intro_sql_server.png',
          ),
          CertificationContainerWidget(
            school: 'Datacamp',
            certification: 'Introduction Course to SQL Relational Databases',
            assetPath: '/icons/datacamp.png',
            date: DateTime(2019, 10),
            certificatePath: 'certifications/intro_relational_sql.png',
          ),
          CertificationContainerWidget(
            school: 'Datacamp',
            certification: 'Intermediate SQL Server',
            assetPath: '/icons/datacamp.png',
            certificatePath: 'certifications/intermediate_sql.png',
            date: DateTime(2019, 10),
          ),
          CertificationContainerWidget(
            school: 'Datacamp',
            certification: 'Functions for manipulating data in SQL Server',
            assetPath: '/icons/datacamp.png',
            certificatePath: 'certifications/functions_manipulating_sql.png',
            date: DateTime(2019, 10),
          ),
          CertificationContainerWidget(
            school: 'EDX',
            certification: 'Advanced Course in Excel: Data import and Analysis',
            assetPath: '/icons/edx.png',
            date: DateTime(2019, 11),
          ),
          CertificationContainerWidget(
            school: 'Google Actívate',
            certification:
                'Protege tu Negocio: Ciberseguridad en el Teletrabajo',
            assetPath: '/icons/google_activate.png',
            certificatePath: 'certifications/ciber_telecommute.png',
            date: DateTime(2021, 5),
          ),
          CertificationContainerWidget(
            school: 'Google Actívate',
            certification: 'Desarrollo de aplicaciones móvil',
            assetPath: '/icons/google_activate.png',
            date: DateTime(2022, 7),
            certificatePath: 'certifications/mobile_apps_dev.png',
          ),
          CertificationContainerWidget(
            school: 'Sololearn',
            certification: 'HTML',
            assetPath: '/icons/sololearn.png',
            date: DateTime(2018, 9),
          ),
          CertificationContainerWidget(
            school: 'Sololearn',
            certification: 'JavaScript',
            assetPath: '/icons/sololearn.png',
            certificatePath: 'certifications/javascript.jpg',
            date: DateTime(2018, 9),
          ),
          CertificationContainerWidget(
            school: 'Sololearn',
            certification: 'C#',
            assetPath: '/icons/sololearn.png',
            date: DateTime(2019, 6),
            certificatePath: 'certifications/csharp.jpg',
          ),
          CertificationContainerWidget(
            school: 'Sololearn',
            certification: 'Angular + NestJS',
            assetPath: '/icons/sololearn.png',
            date: DateTime(2021, 11),
          ),
          CertificationContainerWidget(
            school: 'Sololearn',
            certification: 'PHP',
            assetPath: '/icons/sololearn.png',
            date: DateTime(2019, 6),
            certificatePath: 'certifications/php.jpg',
          ),
          CertificationContainerWidget(
            school: 'Sololearn',
            certification: 'Kotlin',
            assetPath: '/icons/sololearn.png',
            certificatePath: 'certifications/kotlin.jpg',
            date: DateTime(2022, 8),
          ),
          CertificationContainerWidget(
            school: 'Programming Hub',
            certification: 'Machine Learning',
            assetPath: '/icons/programming_hub.png',
            certificatePath: 'certifications/machine_learning.png',
            date: DateTime(2022, 8),
          ),
          CertificationContainerWidget(
            school: 'Pymes Plataforma Comercial S.L.',
            certification: 'Manipulador de Alimentos',
            certificatePath: 'certifications/manipulador_alimentos.png',
            date: DateTime(2022, 8),
          ),
        ],
      ),
    );
  }
}
