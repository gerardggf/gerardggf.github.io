import 'package:intl/intl.dart';

String? getStringFromDatetime(DateTime? date) {
  if (date == null) return null;
  return DateFormat('dd/MM/yyyy').format(date);
}

String getMonthYearFromDatetime(DateTime date) {
  String? month;
  switch (date.month) {
    case 1:
      month = 'Enero';
      break;
    case 2:
      month = 'Frebrero';
      break;
    case 3:
      month = 'Marzo';
      break;
    case 4:
      month = 'Abril';
      break;
    case 5:
      month = 'Mayo';
      break;
    case 6:
      month = 'Junio';
      break;
    case 7:
      month = 'Julio';
      break;
    case 8:
      month = 'Agosto';
      break;
    case 9:
      month = 'Septiembre';
      break;
    case 10:
      month = 'Octubre';
      break;
    case 11:
      month = 'Noviembre';
      break;
    case 12:
      month = 'Diciembre';
      break;
  }
  return '$month ${date.year}';
}
