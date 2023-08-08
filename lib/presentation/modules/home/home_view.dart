import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/presentation/modules/home/home_controller.dart';
import '../../const.dart';
import '../sections/certifications_view.dart';
import '../sections/education_view.dart';
import '../sections/experience_view.dart';
import '../sections/info_view.dart';
import '../sections/projects_view.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/footer_widget.dart';
import '../widgets/languages_dropdown_widget.dart';
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
    final notifier = ref.watch(homeControllerProvider.notifier);
    final controller = ref.watch(homeControllerProvider);
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: AppBarWidget(),
          ),
          Expanded(
            flex: 15,
            child: ListView(
              padding: const EdgeInsets.all(kPadding),
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: SidebarWidget(),
                    ),
                    const SizedBox(
                      width: 20,
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
          ),
        ],
      ),
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          if (controller.languagesDisplayed) const LanguagesDropdownWidget(),
          Container(
            margin: const EdgeInsets.all(10),
            child: FloatingActionButton.extended(
              icon: const Icon(Icons.language),
              onPressed: () {
                notifier
                    .updateLanguagesDisplayed(!controller.languagesDisplayed);
              },
              label: const Text("Idiomas"),
            ),
          ),
        ],
      ),
    );
  }
}
