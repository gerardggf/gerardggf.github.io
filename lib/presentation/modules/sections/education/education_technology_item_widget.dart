import 'package:flutter/material.dart';

class EducationTechnologyItemWidget extends StatelessWidget {
  const EducationTechnologyItemWidget({
    super.key,
    required this.technology,
    required this.percentValue,
  });

  final String technology;
  final int percentValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              technology,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            flex: 4,
            child: LinearProgressIndicator(
              value: percentValue / 100,
            ),
          ),
          const SizedBox(width: 30),
        ],
      ),
    );
  }
}
