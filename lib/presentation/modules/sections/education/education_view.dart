import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/domain/enums.dart';
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
            degree: 'Empresa y tecnología',
            content:
                'Grado universitario de Empresa y Tecnología con mención en gestión de la infraestructura informática',
            startDate: DateTime(2020),
            finishDate: DateTime(2021),
            technologies: const [
              'Excel',
              'VBA',
              'C#',
              'VBA',
              'SQL',
              'HTML',
              'CSS',
              'TypeScript',
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
            label: const Text(
              'Ver todas las certificaciones',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}