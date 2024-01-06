import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/data/repositories_impl/projects_repository_impl.dart';
import 'package:gerardggf_cv/main.dart';

import '../models/project_model.dart';

final projectsRepositoryProvider = Provider<ProjectsRepository>(
  (ref) => ProjectsRepositoryImpl(
    ref.watch(firebaseFirestoreProvider),
    ref.watch(firebaseStorageProvider),
  ),
);

abstract class ProjectsRepository {
  Future<List<ProjectModel>?> getProjects();
  Future<bool> createProjectModel(String locale);
}
