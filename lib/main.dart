import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/domain/enums.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';
import 'package:gerardggf_cv/presentation/modules/home/home_controller.dart';
import 'package:gerardggf_cv/presentation/routes/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'firebase_options.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);

final firebaseFirestoreProvider = Provider<FirebaseFirestore>(
  (ref) => FirebaseFirestore.instance,
);

final firebaseStorageProvider = Provider<FirebaseStorage>(
  (ref) => FirebaseStorage.instance,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  LocaleSettings.setLocaleRaw(
    sharedPreferences.getString(Preferences.locale.name) ?? AppLocale.en.name,
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

// final localeStreamController = StreamProvider(
//   (ref) => LocaleSettings.getLocaleStream(),
// );

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with RouterMixin {
  @override
  Widget build(BuildContext context) {
    final homeController = ref.watch(homeControllerProvider);
    return GestureDetector(
      onTap: homeController.languagesDisplayed
          ? () {
              ref
                  .read(homeControllerProvider.notifier)
                  .updateLanguagesDisplayed(false);
            }
          : null,
      child: MaterialApp.router(
        theme: ThemeData.dark(),
        supportedLocales: AppLocaleUtils.supportedLocales,
        locale: Locale(LocaleSettings.currentLocale.name),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: 'Gerard Gutiérrez Flotats',
        routerConfig: router,
      ),
    );
  }
}
