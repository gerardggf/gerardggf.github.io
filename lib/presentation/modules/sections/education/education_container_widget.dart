import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../const.dart';
import '../../../../domain/enums.dart';
import '../../../utils/functions/format_datetimes.dart';
import '../../home/home_controller.dart';

class EducationContainerWidget extends ConsumerWidget {
  const EducationContainerWidget({
    super.key,
    required this.school,
    required this.degree,
    this.assetPath,
    required this.content,
    required this.startDate,
    this.finishDate,
    this.skills,
  });

  final String school, degree, content;
  final String? assetPath;
  final DateTime startDate;
  final DateTime? finishDate;
  final List<String>? skills;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          if (assetPath != null)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(assetPath!),
              ),
            ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  degree,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  school,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${getMonthYearFromDatetime(startDate)} - ${getMonthYearFromDatetime(finishDate) ?? 'Cursando'}',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                  ),
                ),
                Text(content),
                if (skills != null)
                  Wrap(
                    children: skills!
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(5).copyWith(
                              top: 15,
                              bottom: 0,
                            ),
                            child: InkWell(
                              onTap: () {
                                ref
                                    .read(homeControllerProvider.notifier)
                                    .updateSection(Sections.education.name);
                              },
                              child: Chip(
                                label: Text(e),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
