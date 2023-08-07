import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'state/home_state.dart';

final homeControllerProvider = StateNotifierProvider<HomeController, HomeState>(
  (ref) => HomeController(
    HomeState(),
  ),
);

class HomeController extends StateNotifier<HomeState> {
  HomeController(super.state);

  void updateSection(String value) {
    state = state.copyWith(section: value);
  }
}
