import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/app/core/providers.dart';
import 'package:gerardggf_cv/app/data/repositories_impl/prefs_repository_impl.dart';

final prefsRepoProvider = Provider<PrefsRepository>(
  (ref) =>
      PrefsRepositoryImpl(ref.watch(sharedPreferencesProvider).requireValue),
);

abstract class PrefsRepository {
  bool get isDarkMode;
  Future<bool> setThemeMode(bool isDarkMode);
}
