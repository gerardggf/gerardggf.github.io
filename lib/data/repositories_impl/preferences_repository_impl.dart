import 'package:flutter/material.dart';
import 'package:gerardggf_cv/domain/enums.dart';
import 'package:gerardggf_cv/domain/repositories/preferences_repository.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final SharedPreferences _sharedPreferences;

  PreferencesRepositoryImpl(this._sharedPreferences);

  @override
  String? get getSection =>
      _sharedPreferences.getString(Preferences.section.name);

  @override
  Future<void> setSection(String section) {
    return _sharedPreferences.setString(
      Preferences.section.name,
      section,
    );
  }

  @override
  Locale get getLocale =>
      Locale(_sharedPreferences.getString(Preferences.locale.name) ??
          AppLocale.en.name);

  @override
  Future<void> setLocale(String locale) {
    return _sharedPreferences.setString(
      Preferences.locale.name,
      locale,
    );
  }
}
