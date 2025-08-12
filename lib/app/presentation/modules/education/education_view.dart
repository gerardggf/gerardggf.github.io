import 'package:flutter/material.dart';
import 'package:gerardggf_cv/app/core/utils/extensions/num_to_sizedbox.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  static const routeName = 'education';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Text(
          'Educación',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        _EduCard(
          school: 'UNIVERSITAT OBERTA de CATALUNYA (UOC)',
          degree:
              'Máster en Ciberseguridad y Privacidad · Mención en tecnologías',
          location: 'Barcelona, España',
          dates: 'Feb. 2024 – Feb. 2026',
        ),
        _EduCard(
          school: 'UNIVERSITAT AUTÒNOMA de BARCELONA (UAB)',
          degree:
              'Empresa y Tecnología · Mención en gestión de la infraestructura IT',
          location: 'Barcelona, España',
          dates: 'Sept. 2017 – Junio 2021',
        ),
      ],
    );
  }
}

class _EduCard extends StatelessWidget {
  final String school, degree, location, dates;
  const _EduCard({
    required this.school,
    required this.degree,
    required this.location,
    required this.dates,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              school,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            6.h,
            Text(degree),
            4.h,
            Text('$location · $dates', style: const TextStyle(fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
