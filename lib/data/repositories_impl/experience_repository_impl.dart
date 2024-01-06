import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:gerardggf_cv/const.dart';
import 'package:gerardggf_cv/data/texts/texts.dart';
import 'package:gerardggf_cv/domain/enums.dart';
import 'package:gerardggf_cv/domain/models/experience_model.dart';
import 'package:gerardggf_cv/domain/repositories/experience_repository.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';

class ExperienceRepositoryImpl implements ExperienceRepository {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;

  ExperienceRepositoryImpl(
    this.firestore,
    this.storage,
  );

  @override
  Future<List<ExperienceModel>?> getExperience() async {
    try {
      final collection = firestore
          .collection(FirebasePaths.cv)
          .doc(Sections.experience.name)
          .collection(LocaleSettings.currentLocale.name);
      final result = await collection.get();
      if (result.docs.isEmpty) return [];
      final experiences = result.docs.map((e) {
        return ExperienceModel.fromJson(
          e.data(),
        );
      }).toList();
      for (var experience in experiences) {
        if (experience.logo != null) {
          final logo = await _getAsset(experience.logo!);
          experience = experience.copyWith(logo: logo);
        }
      }
      return experiences;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  @override
  Future<bool> createExperienceModel(String locale) async {
    final data = () {
      switch (locale) {
        case 'ca':
          return Texts.experienceEn;
        case 'es':
          return Texts.experienceEn;
        default:
          return Texts.experienceEn;
      }
    }();

    try {
      final collection = firestore
          .collection(FirebasePaths.cv)
          .doc(Sections.experience.name)
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

  Future<String?> _getAsset(String path) async {
    try {
      return await storage
          .ref('${FirebasePaths.logosStorage}/$path')
          .getDownloadURL();
    } catch (e) {
      if (kDebugMode) {
        print(
          e.toString(),
        );
      }
      return null;
    }
  }
}
