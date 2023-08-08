import 'package:flutter/material.dart';
import '../modules/home/home_view.dart';
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
  };
}
