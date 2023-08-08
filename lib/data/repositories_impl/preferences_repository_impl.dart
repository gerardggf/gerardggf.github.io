import 'package:gerardggf_cv/domain/enums.dart';
import 'package:gerardggf_cv/domain/repositories/preferences_repository.dart';
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
}
