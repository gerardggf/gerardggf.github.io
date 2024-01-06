import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:gerardggf_cv/data/texts/texts.dart';
import 'package:gerardggf_cv/domain/enums.dart';
import 'package:gerardggf_cv/domain/models/info_model.dart';
import 'package:gerardggf_cv/domain/repositories/info_repository.dart';
import 'package:gerardggf_cv/generated/translations.g.dart';

import '../../const.dart';

class InfoRepositoryImpl implements InfoRepository {
  final FirebaseFirestore firestore;

  InfoRepositoryImpl(this.firestore);

  @override
  Future<InfoModel?> getInfo() async {
    try {
      final doc = firestore
          .collection(FirebasePaths.cv)
          .doc(Sections.info.name)
          .collection(FirebasePaths.texts)
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
  Future<bool> createInfoModel(String locale) async {
    try {
      final data = () {
        switch (locale) {
          case 'ca':
            return Texts.infoCa;
          case 'es':
            return Texts.infoEs;
          default:
            return Texts.infoEn;
        }
      }();

      final doc = firestore
          .collection(FirebasePaths.cv)
          .doc(Sections.info.name)
          .collection(FirebasePaths.texts)
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
