import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/domain/enums.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';
import 'package:gerardggf_cv/presentation/modules/home/home_controller.dart';
import 'package:gerardggf_cv/presentation/modules/sections/education/education_container_widget.dart';

class EducationView extends ConsumerWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EducationContainerWidget(
            school: 'Universitat Autónoma de Barcelona (UAB)',
            degree: texts.education.bussinesAndTechnology,
            content: texts.education
                .universityDegreeInBusinessAndTechnologyWithAMentionInItInfrastructureManagement,
            startDate: DateTime(2018, 9),
            finishDate: DateTime(2021, 6),
            technologies: const [
              'Excel',
              'VBA',
              'C#',
              'VBA',
              'SQL',
              'HTML',
              'CSS',
              'TypeScript',
              'SAP'
            ],
            assetPath: 'icons/uab.png',
          ),
          const SizedBox(height: 20),
          TextButton.icon(
            icon: const Icon(
              Icons.add,
              size: 40,
            ),
            onPressed: () {
              ref
                  .read(homeControllerProvider.notifier)
                  .updateSection(Sections.certifications.name);
            },
            label: Text(
              texts.education.seeAllCertifications,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
              texts.education.languages,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    children: [
                      Text(
                        texts.global.catalan,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${texts.global.certificate}: C2 (${texts.education.baccalaureate})',
                      ),
                      Text(texts.education.nativeLevel),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    children: [
                      Text(
                        texts.global.spanish,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${texts.global.certificate}: C2 (${texts.education.baccalaureate})',
                      ),
                      Text(texts.education.nativeLevel),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    children: [
                      Text(
                        texts.global.english,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text('${texts.global.certificate}: B2 (FCE Cambridge)'),
                      Text(texts.education.advancedLevel),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
