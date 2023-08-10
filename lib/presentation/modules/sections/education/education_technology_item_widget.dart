import 'package:flutter/material.dart';

class EducationSkillItemWidget extends StatelessWidget {
  const EducationSkillItemWidget({
    super.key,
    required this.technology,
    required this.percentValue,
    this.remark = false,
  });

  final String technology;
  final int percentValue;
  final bool remark;

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
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: remark ? Colors.black : Colors.black54,
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
