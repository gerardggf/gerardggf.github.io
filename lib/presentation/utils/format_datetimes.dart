import 'package:intl/intl.dart';

String? getStringFromDatetime(DateTime? date) {
  if (date == null) return null;
  return DateFormat('dd/MM/yyyy').format(date);
}
