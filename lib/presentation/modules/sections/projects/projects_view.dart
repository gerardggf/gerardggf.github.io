import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/const.dart';
import 'package:gerardggf_cv/domain/models/project_model.dart';
import 'package:gerardggf_cv/domain/repositories/projects_repository.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';
import 'package:gerardggf_cv/presentation/modules/sections/projects/project_container_widget.dart';

import '../../../utils/functions/url_actions.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/loading_widget.dart';

final projectsFutureProvider = FutureProvider<List<ProjectModel>?>(
  (ref) => ref.watch(projectsRepositoryProvider).getProjects(),
);

class ProjectsView extends ConsumerWidget {
  const ProjectsView({
    super.key,
    required this.isSmallWidth,
  });

  final bool isSmallWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsFuture = ref.watch(projectsFutureProvider);
    return projectsFuture.when(
      data: (data) {
        if (data == null) {
          return const ErrorLoadingWidget(
              error: 'No se ha podido cargar la información');
        }
        final mobileProjects = data.where((e) => e.fullWidth != true).toList()
          ..sort((a, b) => a.position?.compareTo(b.position ?? 0) ?? 1);
        final desktopProjects = data.where((e) => e.fullWidth == true).toList()
          ..sort((a, b) => a.position?.compareTo(b.position ?? 0) ?? 1);
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
                  Text(
                    texts.projects.mainPersonalProjects,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
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
                      text: TextSpan(
                        text: '',
                        style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.text,
                        ),
                        children: [
                          TextSpan(
                            text: texts.projects
                                .itShouldBeNotedThatTheProjectsInWhichIHaveFocusedAndDedicatedMyTimeTheMostAreThoseCarriedOuttheVastMajorityFromScratchForTheCompaniesForWhichICurrentlyWorkedOrIHaveWorked,
                          ),
                          TextSpan(
                            text:
                                ' ${texts.projects.whichIHaveNotIncludedInThisPortfolio} ',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                '\n\n${texts.projects.currentlyMostOfTheseProjectsAreUnderDevelopmentButTheirCodeIsAccessibleFromMyPersonalGithubAccount} ',
                          ),
                          TextSpan(
                            text: texts.projects.personalGithubAccount,
                            style: const TextStyle(color: AppColors.secondary),
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
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (1 / 1.5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 5),
              children: [
                for (var project in mobileProjects)
                  ProjectContainerWidget(
                    isSmallWidth: isSmallWidth,
                    name: project.title,
                    type: project.appType,
                    content: project.description,
                    date: DateTime(project.year),
                    screenshotPaths: project.assets,
                  ),
                // ProjectContainerWidget(
                //   isSmallWidth: isSmallWidth,
                //   name: 'Cubetis',
                //   type: texts.projects.mobileApp,
                //   content: texts.projects.cubetisText,
                //   date: DateTime(2023),
                //   screenshotPaths: const [
                //     "cubetis_1.jpg",
                //     "cubetis_2.jpg",
                //     "cubetis_3.jpg",
                //     "cubetis_4.jpg"
                //   ],
                // ),
                // ProjectContainerWidget(
                //   isSmallWidth: isSmallWidth,
                //   name: 'Ebntz',
                //   type: texts.projects.mobileApp,
                //   date: DateTime(2023),
                //   content: texts.projects.ebntzText,
                //   screenshotPaths: const [
                //     "ebntz_1.jpg",
                //     "ebntz_2.jpg",
                //     "ebntz_3.jpg",
                //     "ebntz_4.jpg"
                //   ],
                // ),
                // ProjectContainerWidget(
                //   isSmallWidth: isSmallWidth,
                //   name: 'Cubets',
                //   type: texts.projects.mobileApp,
                //   content: texts.projects.cubetsText,
                //   date: DateTime(2022),
                //   screenshotPaths: const [
                //     "cubets_1.jpg",
                //     "cubets_2.jpg",
                //     "cubets_3.jpg",
                //     "cubets_4.jpg"
                //   ],
                // ),
                // ProjectContainerWidget(
                //   isSmallWidth: isSmallWidth,
                //   name: 'Llocs',
                //   type: texts.projects.mobileApp,
                //   date: DateTime(2022),
                //   content: texts.projects.llocsText,
                //   screenshotPaths: const [
                //     "llocs_1.jpg",
                //     "llocs_2.jpg",
                //     "llocs_3.jpg",
                //     "llocs_4.jpg"
                //   ],
                // ),
                // ProjectContainerWidget(
                //   isSmallWidth: isSmallWidth,
                //   name: 'Con colegas',
                //   type: texts.projects.mobileApp,
                //   content: texts.projects.conColegasText,
                //   date: DateTime(2022),
                //   screenshotPaths: const [
                //     "concolegas_1.jpg",
                //     "concolegas_2.jpg",
                //     "concolegas_3.jpg",
                //     "concolegas_4.jpg"
                //   ],
                // ),
              ],
            ),
            SizedBox(
              height: 1200,
              child: Column(
                children: [
                  for (var project in desktopProjects)
                    Expanded(
                      child: ProjectContainerWidget(
                          isSmallWidth: isSmallWidth,
                          name: project.title,
                          type: project.appType,
                          content: project.description,
                          date: DateTime(project.year),
                          screenshotPaths: project.assets),
                    ),
                  // Expanded(
                  //   child: ProjectContainerWidget(
                  //     isSmallWidth: isSmallWidth,
                  //     name: 'Flutter Translations',
                  //     type: texts.projects.consoleApplication,
                  //     content: texts.projects.flutterTranslationsText,
                  //     date: DateTime(2023),
                  //     screenshotPaths: const ["fluttertranslations.png"],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        );
      },
      error: (e, __) => ErrorLoadingWidget(
        error: e.toString(),
      ),
      loading: () => const LoadingWidget(),
    );
  }
}
