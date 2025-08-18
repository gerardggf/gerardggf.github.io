import 'package:flutter/material.dart';
import 'package:gerardggf_cv/app/core/constants/assets.dart';
import 'package:gerardggf_cv/app/core/utils/extensions/num_to_sizedbox.dart';
import 'package:gerardggf_cv/app/core/utils/functions/url_launcher.dart';
import 'package:gerardggf_cv/app/presentation/modules/contact/contact_view.dart';
import 'package:go_router/go_router.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  static const routeName = 'education';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Educación',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        _EduCard(
          title: 'UNIVERSITAT OBERTA de CATALUNYA (UOC)',
          content:
              'Máster en Ciberseguridad y Privacidad · Mención en tecnologías',
          location: 'Barcelona, España',
          dates: 'Feb. 2024 – Feb. 2026',
        ),
        _EduCard(
          title: 'UNIVERSITAT AUTÒNOMA de BARCELONA (UAB)',
          content:
              'Empresa y Tecnología · Mención en gestión de la infraestructura IT',
          location: 'Barcelona, España',
          dates: 'Sept. 2017 – Junio 2021',
        ),
        10.h,
        const Divider(),
        10.h,
        Text(
          'Idiomas',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        _EduCard(title: 'Catalán', content: 'Nivel nativo. Certificación C2'),
        _EduCard(title: 'Español', content: 'Nivel nativo.'),
        _EduCard(
          title: 'Inglés',
          content: 'Nivel avanzado. Certificación FCE (B2)',
        ),
        10.h,
        const Divider(),
        10.h,
        Text(
          'Cursos y certificaciones',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        _EduCard(
          title: 'Mulesoft Certified Developer Level 1',
          content: 'Mulesoft',
          dates: '2022',
          onPressed: () async {
            launchNewTabPdf(Assets.mule);
          },
        ),
        _EduCard(
          title: 'Introduction to Model Context Protocol',
          content: 'Anthropic',
          dates: '2025',
          onPressed: () async {
            launchNewTabPdf(Assets.introMcp);
          },
        ),
        _EduCard(
          title: 'Flutter avanzado',
          content: 'Udemy',
          dates: '2023',
          onPressed: () async {
            launchNewTabPdf(Assets.flutterAvanzado);
          },
        ),
        _EduCard(title: 'Flutter Isolates', content: 'Udemy', dates: '2023'),
        _EduCard(
          title: 'Flutter desde cero',
          content: 'Udemy',
          dates: '2022',
          onPressed: () async {
            launchNewTabPdf(Assets.flutterDesdeCero);
          },
        ),
        _EduCard(
          title: 'Desarrollo de Apps Móviles',
          content: 'Google Actívate',
          dates: '2021',
          onPressed: () async {
            launchNewTabPdf(Assets.desarrolloApps);
          },
        ),
        _EduCard(
          title: 'Advanced Course in Excel',
          content: 'edX',
          dates: '2021',
        ),
        _EduCard(
          title: 'Intermeditate SQL Server',
          content: 'Datacamp',
          dates: '2021',
          onPressed: () async {
            launchNewTabPdf(Assets.intermediateSqlServer);
          },
        ),
        _EduCard(
          title: 'Functions for manipulating data in SQL Server',
          content: 'Datacamp',
          dates: '2021',
          onPressed: () async {
            launchNewTabPdf(Assets.functionsManipulSql);
          },
        ),
        _EduCard(
          title: 'Introduction to Relational Databases in SQL',
          content: 'Datacamp',
          dates: '2020',
          onPressed: () async {
            launchNewTabPdf(Assets.introDbSql);
          },
        ),
        _EduCard(
          title: 'Introduction to SQL Server',
          content: 'Datacamp',
          onPressed: () async {
            launchNewTabPdf(Assets.introSqlServer);
          },
          dates: '2020',
        ),

        _EduCard(
          title: 'Protege tu negocio: Ciberseguridad en el Teletrabajo',
          content: 'Google Actívate',
          dates: '2020',
          onPressed: () async {
            launchNewTabPdf(Assets.ciberseguridadTeletrabajo);
          },
        ),
        _EduCard(
          title: 'HTML, JavaScript, C#, Php, Angular & Kotlin',
          content: 'Sololearn',
          dates: '2020/2021',
        ),

        Padding(
          padding: const EdgeInsets.all(30),
          child: TextButton.icon(
            onPressed: () {
              context.goNamed(ContactView.routeName);
            },
            label: Text('Contacto'),
            icon: Icon(Icons.keyboard_arrow_down),
          ),
        ),
      ],
    );
  }
}

class _EduCard extends StatelessWidget {
  final String title, content;
  final String? location, dates;
  final VoidCallback? onPressed;
  const _EduCard({
    required this.title,
    required this.content,
    this.location,
    this.dates,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onPressed,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      6.h,
                      Text(
                        content +
                            (location == null && dates != null
                                ? ' · $dates'
                                : ''),
                      ),
                      4.h,
                      if (location != null)
                        Text(
                          '$location · $dates',
                          style: const TextStyle(fontSize: 13),
                        ),
                    ],
                  ),
                ),
                if (onPressed != null) Icon(Icons.open_in_new),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
