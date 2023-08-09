import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/domain/enums.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';
import 'package:gerardggf_cv/presentation/modules/home/home_controller.dart';
import 'package:gerardggf_cv/presentation/modules/sections/education/education_container_widget.dart';
import 'package:gerardggf_cv/presentation/modules/sections/education/education_technology_item_widget.dart';

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
          const SizedBox(height: 30),
          const Divider(),
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
              _buildLanguageItem(
                language: texts.global.catalan,
                certificateText: 'C2 (${texts.education.baccalaureate}',
                level: texts.education.nativeLevel,
              ),
              _buildLanguageItem(
                language: texts.global.spanish,
                certificateText: 'C2 (${texts.education.baccalaureate}',
                level: texts.education.nativeLevel,
              ),
              _buildLanguageItem(
                language: texts.global.english,
                certificateText: 'B2 (FCE Cambridge)',
                level: texts.education.advancedLevel,
              ),
            ],
          ),
          const SizedBox(height: 50),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
              texts.education.mostUsedTechnologies,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Column(
            children: [
              EducationTechnologyItemWidget(
                technology: 'Excel',
                percentValue: 98,
              ),
              EducationTechnologyItemWidget(
                technology: 'Flutter',
                percentValue: 97,
              ),
              EducationTechnologyItemWidget(
                technology: 'Dart',
                percentValue: 96,
              ),
              EducationTechnologyItemWidget(
                technology: 'Firebase',
                percentValue: 91,
              ),
              EducationTechnologyItemWidget(
                technology: 'APIs',
                percentValue: 89,
              ),
              EducationTechnologyItemWidget(
                technology: 'Google ML Kit',
                percentValue: 88,
              ),
              EducationTechnologyItemWidget(
                technology: 'Bluetooth',
                percentValue: 85,
              ),
              EducationTechnologyItemWidget(
                technology: 'Stripe',
                percentValue: 84,
              ),
              EducationTechnologyItemWidget(
                technology: 'Hardware',
                percentValue: 79,
              ),
              EducationTechnologyItemWidget(
                technology: 'SQL',
                percentValue: 78,
              ),
              EducationTechnologyItemWidget(
                technology: 'ACL Analytics',
                percentValue: 76,
              ),
              EducationTechnologyItemWidget(
                technology: 'HTML',
                percentValue: 74,
              ),
              EducationTechnologyItemWidget(
                technology: 'VBA',
                percentValue: 73,
              ),
              EducationTechnologyItemWidget(
                technology: 'Python',
                percentValue: 70,
              ),
              EducationTechnologyItemWidget(
                technology: 'TypeScript',
                percentValue: 67,
              ),
              EducationTechnologyItemWidget(
                technology: 'CSS',
                percentValue: 60,
              ),
              EducationTechnologyItemWidget(
                technology: 'C#',
                percentValue: 60,
              ),
              EducationTechnologyItemWidget(
                technology: 'AWS',
                percentValue: 57,
              ),
              EducationTechnologyItemWidget(
                technology: 'SAP',
                percentValue: 55,
              ),
              EducationTechnologyItemWidget(
                technology: 'Navision',
                percentValue: 55,
              ),
              EducationTechnologyItemWidget(
                technology: 'SAP',
                percentValue: 55,
              ),
              EducationTechnologyItemWidget(
                technology: 'GeinforERP',
                percentValue: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageItem({
    required String language,
    required String certificateText,
    required String level,
  }) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          children: [
            Text(
              language,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${texts.global.certificate}: $certificateText)',
            ),
            Text(level),
          ],
        ),
      ),
    );
  }
}
