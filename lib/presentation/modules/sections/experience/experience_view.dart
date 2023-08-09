import 'package:flutter/material.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';

import 'experience_container_widget.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ExperienceContainerWidget(
            company: 'ForAll Phones',
            position: texts.experience.commercial,
            content: texts.experience.saleOfRefurbishedPhones,
            startDate: DateTime(2019, 3),
            finishDate: DateTime(2019, 9),
          ),
          ExperienceContainerWidget(
            company: 'Solé Diesel',
            position: texts.experience.systemsTechnician,
            content: texts.experience
                .maintenanceOfThePhysicalAndLogicalSecurityOfTheCompanysComputerNetworkInfrastructureParticipationInTheWebProjectAndCreationOfReportsUsingTsql,
            startDate: DateTime(2020, 12),
            finishDate: DateTime(2021, 7),
            technologies: const [
              'Excel',
              'VBA',
              'T-SQL',
              'Hardware',
              'Python',
              'GeInforERP'
            ],
          ),
          ExperienceContainerWidget(
            content: texts.experience
                .informationSystemsAuditorAndParticipationInTheAuditTransformationAndDigitizationTeam,
            company: 'PwC',
            position: 'Digital Assurance Associate',
            startDate: DateTime(2021, 9),
            finishDate: DateTime(2022, 10),
            technologies: const [
              'ACL Analytics',
              'Excel',
              'VBA',
              'Python',
              'SAP',
              'Navision',
            ],
          ),
          ExperienceContainerWidget(
            company: 'Shiny Wall',
            content: texts.experience
                .developmentOfAHybridInteractiveClimbingApplicationUsingLedLights,
            position: 'Flutter developer',
            technologies: const [
              'Flutter',
              'Dart',
              'Bluetooth',
              'Hardware',
              'Firebase',
              'SQLite'
            ],
            startDate: DateTime(2023, 2),
          ),
          ExperienceContainerWidget(
            company: 'Appex Factory',
            content: texts.experience
                .developmentOfCrossplatformApplicationsForClientProjectsInFlutter,
            position: 'Flutter developer',
            startDate: DateTime(2022, 10),
            technologies: const [
              'Flutter',
              'Dart',
              'Bluetooth',
              'Hardware',
              'Firebase',
              'Stripe',
              'APIs',
              'Google ML Kit',
              'AWS',
            ],
          ),
        ],
      ),
    );
  }
}
