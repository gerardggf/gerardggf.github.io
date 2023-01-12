import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Gerard Gutiérrez Flotats",
          style: TextStyle(fontSize: 60, fontWeight: FontWeight.w900),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Tengo ${getMiEdad()} años y me dedico al desarrollo de aplicaciones multiplataforma con Flutter.",
        ),
        const Text(
          "Esta página web ha sido desarrollada en su totalidad con Flutter",
        ),
      ],
    );
  }

  int getMiEdad() {
    final DateTime hoy = DateTime.now();
    final DateTime birthDate = DateTime(1999, 9, 13);
    final result = hoy.difference(birthDate);
    return (result.inDays / 365).round();
  }
}
