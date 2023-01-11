import 'package:flutter/material.dart';
import 'package:gerardggf_cv/pages/certifications.dart';
import 'package:gerardggf_cv/pages/education.dart';
import 'package:gerardggf_cv/pages/experience.dart';
import 'package:gerardggf_cv/pages/home_page.dart';
import 'package:gerardggf_cv/pages/projects.dart';

import 'routes.dart';

T getArguments<T>(BuildContext context) {
  return ModalRoute.of(context)!.settings.arguments as T;
}

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    // Routes.lloc: (context) {
    //   final idLloc = getArguments<String>(context);
    //   return LlocScreen(idLloc: idLloc);
    // },
    Routes.home: (_) => const HomePage(),
    Routes.experience: (_) => const ExperiencePage(),
    Routes.education: (_) => const EducationPage(),
    Routes.certifications: (_) => const CertificationsPage(),
    Routes.projects: (_) => const ProjectsPage(),
  };
}
