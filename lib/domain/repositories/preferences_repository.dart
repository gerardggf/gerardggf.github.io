import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/data/repositories_impl/preferences_repository_impl.dart';

import '../../main.dart';

final preferencesRepositoryProvider = Provider(
  (ref) => PreferencesRepositoryImpl(
    ref.read(sharedPreferencesProvider),
  ),
);

abstract class PreferencesRepository {
  Future<void> setSection(String section);
  Future<void> setLocale(String locale);
  String? get getSection;
  Locale? get getLocale;
}
