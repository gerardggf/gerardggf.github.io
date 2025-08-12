import 'package:flutter/material.dart';
import 'package:gerardggf_cv/app/presentation/modules/contact/contact_view.dart';
import 'package:gerardggf_cv/app/presentation/modules/education/education_view.dart';
import 'package:gerardggf_cv/app/presentation/modules/experience/experience_view.dart';
import 'package:gerardggf_cv/app/presentation/modules/home/home_view.dart';
import 'package:gerardggf_cv/app/presentation/modules/projects/projects_view.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      body: Row(
        children: [
          if (isWide)
            NavigationRail(
              selectedIndex: _selectedIndex(context),
              onDestinationSelected: (i) {
                switch (i) {
                  case 0:
                    context.goNamed(HomeView.routeName);
                  case 1:
                    context.goNamed(ExperienceView.routeName);
                  case 2:
                    context.goNamed(EducationView.routeName);
                  case 3:
                    context.goNamed(ContactView.routeName);
                  case 4:
                    context.goNamed(ProjectsView.routeName);
                }
              },
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),

                NavigationRailDestination(
                  icon: Icon(Icons.work_outline),
                  label: Text('Experience'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.school_outlined),
                  label: Text('Education'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.mail_outline),
                  label: Text('Contact'),
                ),
                // NavigationRailDestination(
                //   icon: Icon(Icons.work_outline),
                //   label: Text('Projects'),
                // ),
              ],
            ),
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ).copyWith(top: 24),
                  child: child,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: isWide
          ? null
          : NavigationBar(
              selectedIndex: _selectedIndex(context),
              onDestinationSelected: (i) {
                switch (i) {
                  case 0:
                    context.goNamed(HomeView.routeName);
                  case 1:
                    context.goNamed(ExperienceView.routeName);
                  case 2:
                    context.goNamed(EducationView.routeName);
                  case 3:
                    context.goNamed(ContactView.routeName);
                  case 4:
                    context.goNamed(ProjectsView.routeName);
                }
              },
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),

                NavigationDestination(
                  icon: Icon(Icons.work_outline),
                  label: 'Exp',
                ),
                NavigationDestination(icon: Icon(Icons.school), label: 'Edu'),
                NavigationDestination(icon: Icon(Icons.mail), label: 'Contact'),
              ],
            ),
    );
  }

  int _selectedIndex(BuildContext context) {
    final loc = GoRouterState.of(context).uri.toString();

    if (loc.startsWith('/experience')) return 1;
    if (loc.startsWith('/education')) return 2;
    if (loc.startsWith('/contact')) return 3;
    if (loc.startsWith('/projects')) return 4;
    return 0;
  }
}
