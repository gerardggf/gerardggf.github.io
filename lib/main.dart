import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/presentation/routes/app_routes.dart';
import 'package:gerardggf_cv/presentation/routes/routes.dart';

void main() {
  runApp(
    const ProviderScope(
      overrides: [],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerard Gutiérrez Flotats',
      initialRoute: Routes.home,
      routes: appRoutes,
    );
  }
}
