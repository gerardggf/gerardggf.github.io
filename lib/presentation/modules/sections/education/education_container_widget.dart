import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../const.dart';
import '../../../../domain/enums.dart';
import '../../../../generated/translations.g.dart';
import '../../../utils/functions/format_datetimes.dart';
import '../../home/home_controller.dart';

class EducationContainerWidget extends ConsumerWidget {
  const EducationContainerWidget({
    super.key,
    required this.school,
    required this.degree,
    this.img,
    required this.content,
    required this.startDate,
    this.finishDate,
    this.skills,
  });

  final String school, degree, content;
  final Image? img;
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
          if (img != null)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: img,
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
                const SizedBox(height: 5),
                Text(
                  school,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${getMonthYearFromDatetime(startDate)} - ${getMonthYearFromDatetime(finishDate) ?? texts.certificates.attending}',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 5),
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
