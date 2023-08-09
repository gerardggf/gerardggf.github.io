import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/domain/enums.dart';
import 'package:gerardggf_cv/domain/repositories/preferences_repository.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';

import 'state/home_state.dart';

final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>(
  (ref) => HomeController(
    HomeState(),
    ref.read(preferencesRepositoryProvider),
  ),
);

class HomeController extends StateNotifier<HomeState> {
  HomeController(
    super.state,
    this.preferencesRepository,
  );

  final PreferencesRepository preferencesRepository;

  void init() {
    updateSection(preferencesRepository.getSection ?? Sections.info.name);
  }

  void updateSection(String value) {
    state = state.copyWith(section: value);
    preferencesRepository.setSection(value);
  }

  void updateLanguagesDisplayed(bool value) {
    state = state.copyWith(languagesDisplayed: value);
  }

  void updateLocale(String value) {
    LocaleSettings.setLocaleRaw(value);
    preferencesRepository.setLocale(value);
    updateLanguagesDisplayed(false);
  }
}
