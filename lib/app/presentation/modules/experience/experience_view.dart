import 'package:flutter/material.dart';
import 'package:gerardggf_cv/app/core/utils/extensions/num_to_sizedbox.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  static const String routeName = 'experience';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Text(
          'Experiencia',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        ),
        _JobCard(
          company: 'Maha Data Center',
          role: 'Ingeniero de software · Responsable de desarrollo Front-End',
          location: 'Terrassa, España',
          dates: 'Sept. 2025 – Presente',
          bullets: [
            'Lidero el desarrollo de la aplicación móvil para tacógrafos, asegurando una experiencia de usuario fluida y funcional.',
            'Dirijo el desarrollo y mantenimiento de la página web corporativa de Maha Data Center, optimizando el rendimiento y la escalabilidad del frontend.',
          ],
        ),
        _JobCard(
          company: 'Shiny Wall (Proyecto paralelo)',
          role: 'Ingeniero de software',
          location: 'Rubí, España',
          dates: 'Feb. 2023 – Presente',
          bullets: [
            'Dirijo y realizo el desarrollo de la aplicación de Shiny Wall para Android e iOS en Flutter, y el backend en Firebase, en colaboración con otro desarrollador.',
            'Responsable de la aplicación móvil de paredes de escalada interactiva con LEDs Shiny Wall, con más de 1000 descargas alrededor de varios países de Europa donde se encuentran instalados sistemas Shiny Wall.',
          ],
        ),
        _JobCard(
          company: 'Appex Factory',
          role: 'Ingeniero de software',
          location: 'Sabadell, España',
          dates: 'Oct. 2022 – Sept. 2025',
          bullets: [
            'Lideré varios proyectos de desarrollo de aplicaciones móvil IoT con Flutter, gestionando el ciclo de vida completo de las aplicaciones.',
            'Implementé pipelines de CI/CD con Codemagic, reduciendo los tiempos de despliegue hasta un 80% y mejorando la calidad del software entregado.',
            'Desarrollé un protocolo de comunicación vía Bluetooth para cargar interfaces de usuario desde microcontroladores en C directamente en dispositivos móviles.',
            'Extendí este protocolo al entorno web mediante WebSockets, facilitando su integración en páginas web externas.',
          ],
        ),
        _JobCard(
          company: 'PwC',
          role: 'Digital Assurance · Auditor de los sistemas de la información',
          location: 'Barcelona, España',
          dates: 'Sept. 2021 – Oct. 2022',
          bullets: [
            'Realicé auditorías IT de sistemas críticos, asegurando el cumplimiento normativo y la integridad de los procesos.',
            'Desarrollé herramientas internas para automatizar la recopilación de evidencias de auditoría.',
            'Optimicé procesos mediante la implementación de soluciones RPA, mejorando la eficiencia operativa.',
          ],
        ),
        _JobCard(
          company: 'Solé',
          role: 'Técnico de sistemas en prácticas',
          location: 'Martorell, España',
          dates: 'Dic. 2020 – Sept. 2021',
          bullets: [
            'Participé en la migración del sistema ERP y colaboré en el desarrollo de la nueva web corporativa.',
            'Implementé mejoras en la automatización de procesos internos, incrementando la eficiencia operativa.',
          ],
        ),
      ],
    );
  }
}

class _JobCard extends StatelessWidget {
  final String company, role, location, dates;
  final List<String> bullets;
  const _JobCard({
    required this.company,
    required this.role,
    required this.location,
    required this.dates,
    required this.bullets,
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
              company,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            4.h,
            Text(
              role,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            4.h,
            Text('$location · $dates', style: const TextStyle(fontSize: 13)),
            10.h,
            ...bullets.map(
              (b) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('•  '),
                    Expanded(child: Text(b)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
