import 'package:flutter/material.dart';
import 'package:gerardggf_cv/pages/widgets/app_bar_text_button.dart';
import 'package:gerardggf_cv/pages/widgets/contact_info.dart';
import 'package:gerardggf_cv/routes/routes.dart';

import '../const.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _languageDisplayed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currículum Vitae"),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: const [
          AppBarTextButton(
            iconData: Icons.work,
            label: "Experiencia",
            route: Routes.experience,
          ),
          AppBarTextButton(
            iconData: Icons.book,
            label: "Educación",
            route: Routes.education,
          ),
          AppBarTextButton(
            iconData: Icons.work_history,
            label: "Certificaciones",
            route: Routes.certifications,
          ),
          AppBarTextButton(
            iconData: Icons.computer,
            label: "Proyectos",
            route: Routes.projects,
          ),
          SizedBox(
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
                        padding: const EdgeInsets.all(8),
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
                              height: 15,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Gerard Gutiérrez Flotats",
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Tengo ${getMiEdad()} años y me dedico al desarrollo de aplicaciones multiplataforma con Flutter.",
                    ),
                    const Text(
                      "Esta página web ha sido desarrollada en su totalidad con Flutter",
                    ),
                  ],
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
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Descargar CV"),
                  ),
                ),
              ],
            ),
          ),
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

  int getMiEdad() {
    final DateTime hoy = DateTime.now();
    final DateTime birthDate = DateTime(1999, 9, 13);
    final result = hoy.difference(birthDate);
    return (result.inDays / 365).round();
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
