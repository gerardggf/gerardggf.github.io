import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gerardggf_cv/main.dart';

import '../../data/repositories_impl/info_repository_impl.dart';
import '../models/info_model.dart';

final infoRepositoryProvider = Provider<InfoRepository>(
  (ref) => InfoRepositoryImpl(
    ref.watch(firebaseFirestoreProvider),
  ),
);

abstract class InfoRepository {
  Future<InfoModel?> getInfo();
  Future<bool> createInfoModel(String locale);
}
