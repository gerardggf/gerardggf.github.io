import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';

import '../../../domain/enums.dart';
import '../home/home_controller.dart';

class AppBarWidget extends ConsumerWidget {
  const AppBarWidget({
    super.key,
    required this.isSmallWidth,
  });

  final bool isSmallWidth;

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
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  ),
                  color: Colors.black87,
                ),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              "CV",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                        if (!isSmallWidth)
                          const Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      'Gerard Gutiérrez',
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
                    if (ref.watch(homeControllerProvider).section ==
                        Sections.info.name)
                      Positioned(
                        left: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          width: 12,
                          height: 12,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: CustomAppBarTextButton(
                      isSmallWidth: isSmallWidth,
                      iconData: Icons.computer,
                      label: texts.global.projects,
                      onPressed: () {
                        notifier.updateSection(Sections.projects.name);
                      },
                      section: Sections.projects.name,
                    ),
                  ),
                  Expanded(
                    child: CustomAppBarTextButton(
                      isSmallWidth: isSmallWidth,
                      iconData: Icons.work,
                      label: texts.global.experience,
                      onPressed: () {
                        notifier.updateSection(Sections.experience.name);
                      },
                      section: Sections.experience.name,
                    ),
                  ),
                  Expanded(
                    child: CustomAppBarTextButton(
                      isSmallWidth: isSmallWidth,
                      iconData: Icons.school,
                      label: texts.global.education,
                      onPressed: () {
                        notifier.updateSection(Sections.education.name);
                      },
                      section: Sections.education.name,
                    ),
                  ),
                  Expanded(
                    child: CustomAppBarTextButton(
                      isSmallWidth: isSmallWidth,
                      iconData: Icons.book,
                      label: texts.global.certificates,
                      onPressed: () {
                        notifier.updateSection(Sections.certifications.name);
                      },
                      section: Sections.certifications.name,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBarTextButton extends ConsumerWidget {
  const CustomAppBarTextButton({
    super.key,
    required this.iconData,
    required this.label,
    required this.onPressed,
    required this.section,
    required this.isSmallWidth,
  });

  final IconData iconData;
  final String label;
  final VoidCallback onPressed;
  final String section;
  final bool isSmallWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isSelected =
        ref.watch(homeControllerProvider).section == section;
    return isSmallWidth
        ? IconButton(
            onPressed: onPressed,
            icon: Icon(
              iconData,
              color: isSelected ? Colors.blue : Colors.white,
              size: 25,
            ),
          )
        : Stack(
            children: [
              AnimatedContainer(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(isSelected ? 0 : 15),
                duration: const Duration(milliseconds: 500),
                child: TextButton.icon(
                  onPressed: onPressed,
                  icon: Icon(
                    iconData,
                    color: Colors.white,
                    size: 30,
                  ),
                  label: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      label,
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              if (isSelected)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    width: 12,
                    height: 12,
                  ),
                ),
            ],
          );
  }
}
