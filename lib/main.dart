import 'package:flutter/material.dart';
import 'package:gerardggf_cv/routes/app_routes.dart';
import 'package:gerardggf_cv/routes/routes.dart';

void main() {
  runApp(const MyApp());
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
