import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/presentation/modules/home/home_controller.dart';
import '../../../const.dart';
import '../../utils/url_actions.dart';
import '../sections/certifications/certifications_view.dart';
import '../sections/education/education_view.dart';
import '../sections/experience/experience_view.dart';
import '../sections/info/info_view.dart';
import '../sections/projects/projects_view.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/footer_widget.dart';
import '../widgets/languages_floating_action_widget.dart';
import '../widgets/sidebar_widget.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(homeControllerProvider.notifier).init();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(homeControllerProvider);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/bg.jpg'),
            fit: BoxFit.fitHeight,
            opacity: 0.5,
            colorFilter: ColorFilter.mode(
              Colors.white,
              BlendMode.color,
            ),
          ),
        ),
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.all(kPadding),
              children: [
                const SizedBox(
                  height: kToolbarHeight + 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const SidebarWidget(),
                          InkWell(
                            onTap: () async => launchSomeUrl(
                              Uri.parse(Urls.buymeACoffee),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(25),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Row(
                                children: [
                                  Expanded(
                                    child: Icon(
                                      Icons.coffee,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      'Buy me a coffee',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: Builder(
                        builder: (context) {
                          switch (controller.section) {
                            case 'info':
                              return const InfoView();
                            case 'experience':
                              return const ExperienceView();
                            case 'education':
                              return const EducationView();
                            case 'certifications':
                              return const CertificationsView();
                            case 'projects':
                              return const ProjectsView();
                            default:
                              return const InfoView();
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: kPadding,
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: kPadding,
                ),
                const FooterWidget(),
              ],
            ),
            const AppBarWidget(),
          ],
        ),
      ),
      floatingActionButton: const LanguagesFloatingActionButtonWidget(),
    );
  }
}
