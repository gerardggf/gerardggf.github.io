import 'package:flutter/material.dart';

import '../../../../const.dart';
import '../../../utils/format_datetimes.dart';

class EducationContainerWidget extends StatelessWidget {
  const EducationContainerWidget({
    super.key,
    required this.school,
    required this.degree,
    required this.assetPath,
    required this.content,
    required this.startDate,
    this.finishDate,
    this.technologies,
  });

  final String school, degree, content, assetPath;
  final DateTime startDate;
  final DateTime? finishDate;
  final List<String>? technologies;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(assetPath),
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
                if (technologies != null)
                  Wrap(
                    children: technologies!
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(5).copyWith(
                              top: 15,
                              bottom: 0,
                            ),
                            child: Chip(
                              label: Text(e),
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
