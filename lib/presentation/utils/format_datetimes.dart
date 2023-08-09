import 'package:gerardggf_cv/generated/translations.g.dart';
import 'package:intl/intl.dart';

String? getStringFromDatetime(DateTime? date) {
  if (date == null) return null;
  return DateFormat('dd/MM/yyyy').format(date);
}

String? getMonthYearFromDatetime(DateTime? date) {
  String? month;
  if (date == null) return null;
  switch (date.month) {
    case 1:
      month = texts.global.january;
      break;
    case 2:
      month = texts.global.february;
      break;
    case 3:
      month = texts.global.march;
      break;
    case 4:
      month = texts.global.april;
      break;
    case 5:
      month = texts.global.may;
      break;
    case 6:
      month = texts.global.june;
      break;
    case 7:
      month = texts.global.july;
      break;
    case 8:
      month = texts.global.august;
      break;
    case 9:
      month = texts.global.september;
      break;
    case 10:
      month = texts.global.october;
      break;
    case 11:
      month = texts.global.november;
      break;
    case 12:
      month = texts.global.december;
      break;
  }
  return '$month ${date.year}';
}
