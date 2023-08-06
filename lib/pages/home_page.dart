import 'package:flutter/material.dart';
import 'package:gerardggf_cv/pages/certifications_view.dart';
import 'package:gerardggf_cv/pages/education_view.dart';
import 'package:gerardggf_cv/pages/experience_view.dart';
import 'package:gerardggf_cv/pages/info_view.dart';
import 'package:gerardggf_cv/pages/projects_view.dart';
import 'package:gerardggf_cv/pages/widgets/app_bar_text_button.dart';
import 'package:gerardggf_cv/pages/widgets/contact_info.dart';
import 'package:gerardggf_cv/pages/widgets/footer.dart';

import '../const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _languageDisplayed = false;

  List<String> sections = [
    'info',
    'experience',
    'education',
    'certifications',
    'projects',
  ];
  String _selectedSection = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: const Text("Currículum Vitae"),
          onTap: () {
            _selectedSection = sections[0];
            setState(() {});
          },
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: [
          AppBarTextButton(
            iconData: Icons.work,
            label: "Experiencia",
            onPressed: () {
              _selectedSection = sections[1];
              setState(() {});
            },
          ),
          AppBarTextButton(
            iconData: Icons.book,
            label: "Educación",
            onPressed: () {
              _selectedSection = sections[2];
              setState(() {});
            },
          ),
          AppBarTextButton(
            iconData: Icons.work_history,
            label: "Certificaciones",
            onPressed: () {
              _selectedSection = sections[3];
              setState(() {});
            },
          ),
          AppBarTextButton(
            iconData: Icons.computer,
            label: "Proyectos",
            onPressed: () {
              _selectedSection = sections[4];
              setState(() {});
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
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/img/gerardggf_logo.jpg",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: kPadding),
                        child: Column(
                          children: const [
                            Text(
                              "Información de contacto",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ContactInfo(
                              label: "Correo electrónico",
                              data: "ggutiflo@gmail.com",
                              onPressedUrl: '',
                            ),
                            ContactInfo(
                              label: "Teléfono móvil",
                              data: "+34 622806551",
                              onPressedUrl: '',
                            ),
                            ContactInfo(
                              label: "LinkedIn",
                              data: "gerardgutierrez",
                              onPressedUrl:
                                  "https://www.linkedin.com/in/gerardgutierrez/",
                            ),
                            ContactInfo(
                              label: "GitHub",
                              data: "gerardggf",
                              onPressedUrl: "https://github.com/gerardggf",
                            ),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Flexible(
                flex: 3,
                child: Builder(
                  builder: (context) {
                    switch (_selectedSection) {
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
          const Footer(),
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
