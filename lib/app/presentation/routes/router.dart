import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/app/presentation/modules/app_shell.dart';
import 'package:gerardggf_cv/app/presentation/modules/contact/contact_view.dart';
import 'package:gerardggf_cv/app/presentation/modules/education/education_view.dart';
import 'package:gerardggf_cv/app/presentation/modules/experience/experience_view.dart';
import 'package:gerardggf_cv/app/presentation/modules/home/home_view.dart';
import 'package:gerardggf_cv/app/presentation/modules/projects/projects_view.dart';
import 'package:gerardggf_cv/app/presentation/shared/widgets/error_info_widget.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeView()),
          ),
          GoRoute(
            path: '/projects',
            name: ProjectsView.routeName,
            builder: (context, state) => const ProjectsView(),
          ),
          GoRoute(
            path: '/experience',
            name: ExperienceView.routeName,
            builder: (context, state) => const ExperienceView(),
          ),
          GoRoute(
            path: '/education',
            name: EducationView.routeName,
            builder: (context, state) => const EducationView(),
          ),
          GoRoute(
            path: '/contact',
            name: ContactView.routeName,
            builder: (context, state) => const ContactView(),
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) =>
        const NoTransitionPage(child: Scaffold(body: ErrorInfoWidget())),
  );
});
