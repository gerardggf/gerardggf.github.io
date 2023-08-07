import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/domain/enums.dart';
import 'package:gerardggf_cv/presentation/modules/home/home_controller.dart';
import '../../../modules/widgets/footer_widget.dart';
import '../../const.dart';
import '../certifications_view.dart';
import '../education_view.dart';
import '../experience_view.dart';
import '../info_view.dart';
import '../projects_view.dart';
import '../widgets/app_bar_text_button.dart';
import '../widgets/sidebar_widget.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  bool _languageDisplayed = false;

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(homeControllerProvider);
    final notifier = ref.watch(homeControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: const Text(
            "Currículum Vitae",
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            notifier.updateSection(Sections.home.name);
          },
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: [
          AppBarTextButton(
            iconData: Icons.work,
            label: "Experiencia",
            onPressed: () {
              notifier.updateSection(Sections.experience.name);
            },
          ),
          AppBarTextButton(
            iconData: Icons.book,
            label: "Educación",
            onPressed: () {
              notifier.updateSection(Sections.education.name);
            },
          ),
          AppBarTextButton(
            iconData: Icons.work_history,
            label: "Certificaciones",
            onPressed: () {
              notifier.updateSection(Sections.certifications.name);
            },
          ),
          AppBarTextButton(
            iconData: Icons.computer,
            label: "Proyectos",
            onPressed: () {
              notifier.updateSection(Sections.projects.name);
            },
          ),
          const SizedBox(
            width: 100,
          ),
        ],
      ),
      body: ListView(
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
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          if (_languageDisplayed) _showLanguages(),
          Container(
            margin: const EdgeInsets.all(10),
            child: FloatingActionButton.extended(
              icon: const Icon(Icons.language),
              onPressed: () {
                _languageDisplayed = !_languageDisplayed;
                setState(() {});
              },
              label: const Text("Idioma"),
              backgroundColor: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _showLanguages() {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.end,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10),
          child: FloatingActionButton.extended(
            onPressed: () {},
            label: const Text("Català"),
            backgroundColor: Colors.black87,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: FloatingActionButton.extended(
            onPressed: () {},
            label: const Text("Español"),
            backgroundColor: Colors.black87,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: FloatingActionButton.extended(
            onPressed: () {},
            label: const Text("English"),
            backgroundColor: Colors.black87,
          ),
        ),
      ],
    );
  }
}
