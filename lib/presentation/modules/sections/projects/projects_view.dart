import 'package:flutter/material.dart';
import 'package:gerardggf_cv/const.dart';
import 'package:gerardggf_cv/presentation/modules/sections/projects/project_container_widget.dart';
import 'package:gerardggf_cv/presentation/utils/url_actions.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Principales proyectos personales',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  await launchSomeUrl(
                    Uri.parse(Urls.github),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    text: '',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text:
                            'Cabe destacar que los proyectos en los que más me he focalizado y dedicado mi tiempo, son los realizados, (la gran mayoría desde cero) para las empresas por las cuales he trabajado y trabajo actualmente,',
                      ),
                      TextSpan(
                        text: ' los cuales no he incluído en este portafolio',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                          text:
                              ', pero destacando las aplicaciones de ShinyWall y Zycle.'),
                      TextSpan(
                          text:
                              '\n\nActualmente, la mayoría de estos proyectos se encuentran en desarrollo u obsoletos y su código está accesible desde la cuenta de '),
                      TextSpan(
                        text: 'Github',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GridView(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 220,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          children: [
            ProjectContainerWidget(
              name: 'MBoard',
              type: 'Aplicación de escritorio',
              content:
                  'Primera aplicación de escritorio que hice. Creada en Python con una base de datos local SQLite para la creación y edición de vías de escalada. No se le ha dado continuidad.',
              date: DateTime(2018),
            ),
            ProjectContainerWidget(
              name: 'Llocs',
              type: 'Aplicación móvil',
              date: DateTime(2022),
              content:
                  'Una de mis primeras aplicaciones en Flutter, en la cual se utiliza Firebase Authentication, Firebase Firestore y Firebase Storage. No se le ha dado continuidad.',
            ),
            ProjectContainerWidget(
              name: 'Cubets',
              type: 'Aplicación móvil',
              content:
                  'Juego de arcade con diferentes niveles en el que debes recoger monedas y esquivarlos enemigos para pasar al siguiente. No se le ha dado continuidad.',
              date: DateTime(2022),
            ),
            ProjectContainerWidget(
              name: 'Ebntz',
              type: 'Aplicación móvil',
              date: DateTime(2023),
              content:
                  'Red social que te permite búsqueda por nombres de festivales y artistas directamente a través del cartel del evento o festival utilizando el aprendizaje automático. En desarrollo.',
            ),
            ProjectContainerWidget(
              name: 'Cubetis',
              type: 'Aplicación móvil',
              content:
                  'Mejora del juego Cubets, aplicando una arquitectura limpia e introduciendo nuevas lógicas. En desarrollo.',
              date: DateTime(2023),
            ),
          ],
        ),
      ],
    );
  }
}
