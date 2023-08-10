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
            school: 'Sagrat Cor de Jesús de Terrassa',
            degree: texts.education.baccalaureate,
            content: texts.education.bachelorOfSocialSciences,
            startDate: DateTime(2015, 9),
            finishDate: DateTime(2017, 6),
          ),
          EducationContainerWidget(
            school: 'Universitat Autónoma de Barcelona (UAB)',
            degree: texts.education.bussinesAndTechnology,
            content: texts.education
                .universityDegreeInBusinessAndTechnologyWithAMentionInItInfrastructureManagement,
            startDate: DateTime(2017, 9),
            finishDate: DateTime(2021, 6),
            skills: const [
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
              texts.education.skills,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Column(
            children: [
              EducationSkillItemWidget(
                technology: 'Excel',
                percentValue: 98,
              ),
              EducationSkillItemWidget(
                technology: 'Flutter',
                percentValue: 97,
              ),
              EducationSkillItemWidget(
                technology: 'Dart',
                percentValue: 96,
              ),
              EducationSkillItemWidget(
                technology: 'Firebase',
                percentValue: 91,
              ),
              EducationSkillItemWidget(
                technology: 'APIs',
                percentValue: 89,
              ),
              EducationSkillItemWidget(
                technology: 'Google ML Kit',
                percentValue: 88,
              ),
              EducationSkillItemWidget(
                technology: 'Bluetooth',
                percentValue: 85,
              ),
              EducationSkillItemWidget(
                technology: 'Stripe',
                percentValue: 84,
              ),
              EducationSkillItemWidget(
                technology: 'SQL',
                percentValue: 79,
              ),
              EducationSkillItemWidget(
                technology: 'ACL Analytics',
                percentValue: 77,
              ),
              EducationSkillItemWidget(
                technology: 'AnyPoint Studio',
                percentValue: 76,
              ),
              EducationSkillItemWidget(
                technology: 'HTML',
                percentValue: 74,
              ),
              EducationSkillItemWidget(
                technology: 'VBA',
                percentValue: 73,
              ),
              EducationSkillItemWidget(
                technology: 'DataWeave',
                percentValue: 72,
              ),
              EducationSkillItemWidget(
                technology: 'Python',
                percentValue: 70,
              ),
              EducationSkillItemWidget(
                technology: 'TypeScript',
                percentValue: 67,
              ),
              EducationSkillItemWidget(
                technology: 'CSS',
                percentValue: 60,
              ),
              EducationSkillItemWidget(
                technology: 'C#',
                percentValue: 60,
              ),
              EducationSkillItemWidget(
                technology: 'AWS',
                percentValue: 57,
              ),
              EducationSkillItemWidget(
                technology: 'SAP',
                percentValue: 55,
              ),
              EducationSkillItemWidget(
                technology: 'Navision',
                percentValue: 55,
              ),
              EducationSkillItemWidget(
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
