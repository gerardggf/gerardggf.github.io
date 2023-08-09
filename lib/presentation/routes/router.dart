import 'package:flutter/material.dart';
import 'package:gerardggf_cv/main.dart';
import 'package:gerardggf_cv/presentation/routes/routes.dart';
import 'package:go_router/go_router.dart';

import '../modules/home/home_view.dart';

mixin RouterMixin on State<MyApp> {
  final router = GoRouter(
    initialLocation: Routes.initialRoute,
    routes: [
      GoRoute(
        name: Routes.home,
        path: '/',
        builder: (context, state) {
          final language = state.pathParameters["lang"];
          print(language);
          return const HomeView();
        },
      ),
    ],
  );
}
