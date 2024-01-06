import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/domain/repositories/experience_repository.dart';

import '../../../domain/repositories/info_repository.dart';
import '../../../domain/repositories/projects_repository.dart';
import '../../utils/custom_snack_bar.dart';

class BuildCreateFirebaseModelWidget extends ConsumerWidget {
  const BuildCreateFirebaseModelWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      left: 0,
      bottom: 0,
      child: Column(
        children: [
          _buildWidget(
            ref,
            context,
            label: 'Info EN',
            function: () =>
                ref.read(infoRepositoryProvider).createInfoModel('en'),
          ),
          const SizedBox(height: 10),
          _buildWidget(
            ref,
            context,
            label: 'Info ES',
            function: () =>
                ref.read(infoRepositoryProvider).createInfoModel('es'),
          ),
          const SizedBox(height: 10),
          _buildWidget(
            ref,
            context,
            label: 'Info CA',
            function: () =>
                ref.read(infoRepositoryProvider).createInfoModel('ca'),
          ),
          const SizedBox(height: 10),
          _buildWidget(
            ref,
            context,
            label: 'Projects EN',
            function: () =>
                ref.read(projectsRepositoryProvider).createProjectModel('en'),
          ),
          const SizedBox(height: 10),
          _buildWidget(
            ref,
            context,
            label: 'Projects ES',
            function: () =>
                ref.read(projectsRepositoryProvider).createProjectModel('es'),
          ),
          const SizedBox(height: 10),
          _buildWidget(
            ref,
            context,
            label: 'Projects CA',
            function: () =>
                ref.read(projectsRepositoryProvider).createProjectModel('ca'),
          ),
          const SizedBox(height: 10),
          _buildWidget(
            ref,
            context,
            label: 'Experience EN',
            function: () => ref
                .read(experienceRepositoryProvider)
                .createExperienceModel('en'),
          ),
          const SizedBox(height: 10),
          _buildWidget(
            ref,
            context,
            label: 'Experience ES',
            function: () => ref
                .read(experienceRepositoryProvider)
                .createExperienceModel('es'),
          ),
          const SizedBox(height: 10),
          _buildWidget(
            ref,
            context,
            label: 'Experience CA',
            function: () => ref
                .read(experienceRepositoryProvider)
                .createExperienceModel('ca'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Education EN'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Certifications EN'),
          ),
        ],
      ),
    );
  }

  Widget _buildWidget(
    WidgetRef ref,
    BuildContext context, {
    required String label,
    required Future<bool> Function() function,
  }) =>
      ElevatedButton(
        onPressed: () async {
          final result = await function();
          if (!context.mounted) return;
          if (result) {
            showCustomSnackBar(
              context: context,
              text: 'Información cargada',
            );
          } else {
            showCustomSnackBar(
              context: context,
              text: 'Se ha producido un error',
              color: Colors.red,
            );
          }
        },
        child: Text(label),
      );
}
