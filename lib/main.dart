import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/core/generated/translations.g.dart';
import 'app/core/providers.dart';
import 'app/my_app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) setUrlStrategy(PathUrlStrategy());
  LocaleSettings.useDeviceLocale();
  runApp(
    ProviderScope(child: TranslationProvider(child: const AppStartupWidget())),
  );
}

final appStartupProvider = FutureProvider<void>((ref) async {
  ref.onDispose(() {
    ref.invalidate(sharedPreferencesProvider);
    ref.invalidate(packageInfoProvider);
  });
  await ref.watch(sharedPreferencesProvider.future);
  await ref.watch(packageInfoProvider.future);
});
