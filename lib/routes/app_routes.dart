import 'package:flutter/material.dart';
import 'package:gerardggf_cv/pages/certifications_view.dart';
import 'package:gerardggf_cv/pages/education_view.dart';
import 'package:gerardggf_cv/pages/experience_view.dart';
import 'package:gerardggf_cv/pages/home_page.dart';
import 'package:gerardggf_cv/pages/projects_view.dart';

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
    Routes.experience: (_) => const ExperienceView(),
    Routes.education: (_) => const EducationView(),
    Routes.certifications: (_) => const CertificationsView(),
    Routes.projects: (_) => const ProjectsView(),
  };
}
