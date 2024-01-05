import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:gerardggf_cv/data/texts/texts.dart';
import 'package:gerardggf_cv/domain/enums.dart';
import 'package:gerardggf_cv/domain/models/project_model.dart';
import 'package:gerardggf_cv/domain/repositories/projects_repository.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  final FirebaseFirestore firestore;

  ProjectsRepositoryImpl(this.firestore);

  @override
  Future<List<ProjectModel>?> getProjects() async {
    try {
      final collection = firestore
          .collection("cv")
          .doc(Sections.projects.name)
          .collection(LocaleSettings.currentLocale.name);
      final projects = await collection.get();
      if (projects.docs.isEmpty) return [];
      return projects.docs
          .map(
            (e) => ProjectModel.fromJson(
              e.data(),
            ),
          )
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  @override
  Future<bool> createProjectModel() async {
    const locale = 'ca';
    final data = Texts.projectsEn;

    try {
      final collection = firestore
          .collection("cv")
          .doc(Sections.projects.name)
          .collection(locale);
      for (var project in data) {
        await collection.doc(project["title"] as String).set(project);
      }
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}
