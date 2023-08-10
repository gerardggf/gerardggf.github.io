import 'package:flutter/material.dart';
import 'package:gerardggf_cv/const.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';
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
              Text(
                texts.projects.mainPersonalProjects,
                style: const TextStyle(
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
                  text: TextSpan(
                    text: '',
                    style: const TextStyle(
                      fontSize: 16,
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
                            ',${texts.projects.butIHighlightTheShinywallAndZycleApplications}',
                      ),
                      TextSpan(
                        text:
                            '\n\n${texts.projects.currentlyMostOfTheseProjectsAreUnderDevelopmentButTheirCodeIsAccessibleFromMyPersonalGithubAccount} ',
                      ),
                      TextSpan(
                        text: texts.projects.personalGithubAccount,
                        style: const TextStyle(color: Colors.blue),
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
            childAspectRatio: (1 / 1.5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          children: [
            ProjectContainerWidget(
              name: 'Ebntz',
              type: texts.projects.mobileApp,
              date: DateTime(2023),
              content: texts.projects.ebntzText,
              screenshotPaths: const [
                "ebntz_1.jpg",
                "ebntz_2.jpg",
                "ebntz_3.jpg",
                "ebntz_4.jpg"
              ],
            ),
            ProjectContainerWidget(
              name: 'Cubets',
              type: texts.projects.mobileApp,
              content: texts.projects.cubetsText,
              date: DateTime(2022),
              screenshotPaths: const [
                "cubets_1.jpg",
                "cubets_2.jpg",
                "cubets_3.jpg",
                "cubets_4.jpg"
              ],
            ),
            ProjectContainerWidget(
              name: 'Cubetis',
              type: texts.projects.mobileApp,
              content: texts.projects.cubetisText,
              date: DateTime(2023),
              screenshotPaths: const [
                "cubetis_1.jpg",
                "cubetis_2.jpg",
                "cubetis_3.jpg",
                "cubetis_4.jpg"
              ],
            ),
            ProjectContainerWidget(
              name: 'Llocs',
              type: texts.projects.mobileApp,
              date: DateTime(2022),
              content: texts.projects.llocsText,
              screenshotPaths: const [
                "llocs_1.jpg",
                "llocs_2.jpg",
                "llocs_3.jpg",
                "llocs_4.jpg"
              ],
            ),
            ProjectContainerWidget(
              name: 'Con colegas',
              type: texts.projects.mobileApp,
              content: texts.projects.conColegasText,
              date: DateTime(2022),
              screenshotPaths: const [
                "concolegas_1.jpg",
                "concolegas_2.jpg",
                "concolegas_3.jpg",
                "concolegas_4.jpg"
              ],
            ),
          ],
        ),
        SizedBox(
          height: 1200,
          child: Column(
            children: [
              Expanded(
                child: ProjectContainerWidget(
                  name: 'MBoard',
                  type: texts.projects.desktopApplication,
                  content: texts.projects.mboardText,
                  date: DateTime(2020),
                  screenshotPaths: const ["mboard.png"],
                ),
              ),
              Expanded(
                child: ProjectContainerWidget(
                  name: 'Flutter Translations',
                  type: texts.projects.consoleApplication,
                  content: texts.projects.flutterTranslationsText,
                  date: DateTime(2023),
                  screenshotPaths: const ["fluttertranslations.png"],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
