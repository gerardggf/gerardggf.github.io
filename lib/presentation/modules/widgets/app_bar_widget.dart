import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/enums.dart';
import '../home/home_controller.dart';

class AppBarWidget extends ConsumerWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(homeControllerProvider.notifier);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black87,
            Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      height: kToolbarHeight + 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  ),
                  color: Colors.black87,
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          "CV",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'Gerard Gutiérrez ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                'Flotats',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                notifier.updateSection(Sections.info.name);
              },
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomAppBarTextButton(
                  iconData: Icons.work,
                  label: "Experiencia",
                  onPressed: () {
                    notifier.updateSection(Sections.experience.name);
                  },
                ),
                CustomAppBarTextButton(
                  iconData: Icons.book,
                  label: "Educación",
                  onPressed: () {
                    notifier.updateSection(Sections.education.name);
                  },
                ),
                CustomAppBarTextButton(
                  iconData: CupertinoIcons.doc,
                  label: "Certificaciones",
                  onPressed: () {
                    notifier.updateSection(Sections.certifications.name);
                  },
                ),
                CustomAppBarTextButton(
                  iconData: Icons.computer,
                  label: "Proyectos",
                  onPressed: () {
                    notifier.updateSection(Sections.projects.name);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBarTextButton extends StatelessWidget {
  const CustomAppBarTextButton({
    super.key,
    required this.iconData,
    required this.label,
    required this.onPressed,
  });

  final IconData iconData;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: Colors.white,
      ),
      label: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
