import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../const.dart';
import '../../../../domain/enums.dart';
import '../../../../generated/translations.g.dart';
import '../../../utils/functions/format_datetimes.dart';
import '../../home/home_controller.dart';

class ExperienceContainerWidget extends ConsumerWidget {
  const ExperienceContainerWidget(
      {super.key,
      required this.company,
      required this.position,
      required this.content,
      required this.startDate,
      this.finishDate,
      this.skills});

  final String company, position, content;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            position,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            company,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '${getMonthYearFromDatetime(startDate)} - ${getMonthYearFromDatetime(finishDate) ?? texts.experience.currently}',
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
    );
  }
}
