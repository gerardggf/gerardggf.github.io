import 'package:flutter/material.dart';
import '../modules/certifications_view.dart';
import '../modules/education_view.dart';
import '../modules/experience_view.dart';
import '../modules/home/home_view.dart';
import '../modules/projects_view.dart';
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
    Routes.home: (_) => const HomeView(),
    Routes.experience: (_) => const ExperienceView(),
    Routes.education: (_) => const EducationView(),
    Routes.certifications: (_) => const CertificationsView(),
    Routes.projects: (_) => const ProjectsView(),
  };
}
