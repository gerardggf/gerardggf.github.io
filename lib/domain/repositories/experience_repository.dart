import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/domain/models/experience_model.dart';
import 'package:gerardggf_cv/main.dart';

import '../../data/repositories_impl/experience_repository_impl.dart';

final experienceRepositoryProvider = Provider<ExperienceRepository>(
  (ref) => ExperienceRepositoryImpl(
    ref.watch(firebaseFirestoreProvider),
    ref.watch(firebaseStorageProvider),
  ),
);

abstract class ExperienceRepository {
  Future<List<ExperienceModel>?> getExperience();
  Future<bool> createExperienceModel(String locale);
}
