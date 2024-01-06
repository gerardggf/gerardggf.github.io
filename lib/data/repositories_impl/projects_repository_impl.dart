import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:gerardggf_cv/const.dart';
import 'package:gerardggf_cv/data/texts/texts.dart';
import 'package:gerardggf_cv/domain/enums.dart';
import 'package:gerardggf_cv/domain/models/project_model.dart';
import 'package:gerardggf_cv/domain/repositories/projects_repository.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  ProjectsRepositoryImpl(
    this.firestore,
    this.storage,
  );

  @override
  Future<List<ProjectModel>?> getProjects() async {
    try {
      final collection = firestore
          .collection(FirebasePaths.cv)
          .doc(Sections.projects.name)
          .collection(LocaleSettings.currentLocale.name);
      final result = await collection.get();
      if (result.docs.isEmpty) return [];
      final noAssetsProjects = result.docs
          .map(
            (e) => ProjectModel.fromJson(
              e.data(),
            ),
          )
          .toList();

      final List<ProjectModel> projects = [];
      for (var project in noAssetsProjects) {
        project = project.copyWith(
          assets: await _getAssets(project.assets),
        );
        projects.add(project);
      }
      return projects;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  @override
  Future<bool> createProjectModel(String locale) async {
    final data = () {
      switch (locale) {
        case 'ca':
          return Texts.projectsCa;
        case 'es':
          return Texts.projectsEs;
        default:
          return Texts.projectsEn;
      }
    }();

    try {
      final collection = firestore
          .collection(FirebasePaths.cv)
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

  Future<List<String>> _getAssets(List<String> assetsPath) async {
    try {
      final List<String> assetsUrls = [];
      for (var path in assetsPath) {
        final assetUrl = await storage
            .ref('${FirebasePaths.projectsStorage}/$path')
            .getDownloadURL();
        assetsUrls.add(assetUrl);
      }
      return assetsUrls;
    } catch (e) {
      if (kDebugMode) {
        print(
          e.toString(),
        );
      }
      return [];
    }
  }
}