import 'package:flutter/material.dart';
import 'package:gerardggf_cv/presentation/const.dart';
import 'package:gerardggf_cv/presentation/utils/format_datetimes.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ExperienceContainerWidget(
            company: 'ForAll Phones',
            position: 'Comercial',
            content: 'Venta de teléfonos reacondicionados',
            startDate: DateTime(2019),
            finishDate: DateTime(2019),
          ),
          ExperienceContainerWidget(
            company: 'Solé Diesel',
            position: 'Técnico de sistemas',
            content:
                'Mantenimiento de la seguridad física y lógica de la infraestructura de redes de la empresa, participación en el proyecto web y creación de reportings mediante T-SQL',
            startDate: DateTime(2020),
            finishDate: DateTime(2021),
            technologies: const [
              'Excel',
              'VBA',
              'T-SQL',
              'Python',
              'GeInforERP'
            ],
          ),
          ExperienceContainerWidget(
            content:
                'Auditor de los sistemas informáticos y participación en el equipo de transformación y digitalización de la auditoría',
            company: 'PwC',
            position: 'Digital Assurance Associate',
            startDate: DateTime(2020),
            technologies: const [
              'ACL Analytics',
              'Excel',
              'VBA',
              'Python',
              'SAP',
              'Navision',
            ],
          ),
          ExperienceContainerWidget(
            company: 'Shiny Wall',
            content:
                'Desarrollo de una aplicación híbrida de escalada interactiva mediante luces LED',
            position: 'Flutter developer',
            technologies: const ['Flutter', 'Dart', 'Bluetooth', 'Firebase'],
            startDate: DateTime(2020),
          ),
          ExperienceContainerWidget(
            company: 'Appex factory',
            content:
                'Desarrollador de aplicaciones multiplataforma para proyectos de clientes en Flutter',
            position: 'Flutter developer',
            startDate: DateTime(2020),
            technologies: const [
              'Flutter',
              'Dart',
              'Bluetooth',
              'Firebase',
              'Stripe',
              'APIs',
              'Machine Learning'
            ],
          ),
        ],
      ),
    );
  }
}

class ExperienceContainerWidget extends StatelessWidget {
  const ExperienceContainerWidget(
      {super.key,
      required this.company,
      required this.position,
      required this.content,
      required this.startDate,
      this.finishDate,
      this.technologies});

  final String company, position, content;
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
            '${getStringFromDatetime(startDate)} - ${getStringFromDatetime(finishDate) ?? 'Actualmente'}',
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.grey,
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
    );
  }
}
