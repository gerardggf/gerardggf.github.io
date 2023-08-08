import 'package:flutter/material.dart';
import '../../../../const.dart';

class ProjectContainerWidget extends StatelessWidget {
  const ProjectContainerWidget({
    super.key,
    required this.name,
    required this.type,
    required this.content,
    required this.date,
    this.assetPath,
  });

  final String name, type, content;
  final String? assetPath;
  final DateTime date;

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
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '$type - ${date.year}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  content,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
