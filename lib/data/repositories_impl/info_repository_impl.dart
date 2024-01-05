import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:gerardggf_cv/data/texts/texts.dart';
import 'package:gerardggf_cv/domain/enums.dart';
import 'package:gerardggf_cv/domain/models/info_model.dart';
import 'package:gerardggf_cv/domain/repositories/info_repository.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';

class InfoRepositoryImpl implements InfoRepository {
  final FirebaseFirestore firestore;

  InfoRepositoryImpl(this.firestore);

  @override
  Future<InfoModel?> getInfo() async {
    try {
      final doc = firestore
          .collection("cv")
          .doc(Sections.info.name)
          .collection("texts")
          .doc(LocaleSettings.currentLocale.name);
      final info = await doc.get();
      if (info.data() == null) return null;
      return InfoModel.fromJson(
        info.data()!,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  @override
  Future<bool> createInfoModel() async {
    try {
      const locale = 'en';
      final data = Texts.infoEn;
      final doc = firestore
          .collection("cv")
          .doc(Sections.info.name)
          .collection("texts")
          .doc(locale);
      await doc.set(data);
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }
}
