import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';
import 'package:gerardggf_cv/presentation/modules/home/home_controller.dart';
import 'package:gerardggf_cv/presentation/routes/app_routes.dart';
import 'package:gerardggf_cv/presentation/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);

void main() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    TranslationProvider(
      child: ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreferences)
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeController = ref.watch(homeControllerProvider);
    return GestureDetector(
      onTap: homeController.languagesDisplayed
          ? () {
              ref
                  .read(homeControllerProvider.notifier)
                  .updateLanguagesDisplayed(false);
            }
          : null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gerard Gutiérrez Flotats',
        initialRoute: Routes.home,
        routes: appRoutes,
      ),
    );
  }
}
