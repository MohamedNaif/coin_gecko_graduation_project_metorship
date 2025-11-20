import 'package:intl/intl.dart';

String formatPrice(dynamic value) {
  final number = num.tryParse(value.toString());
  if (number == null) return value.toString();
  final formatter = NumberFormat('#,###');
  return formatter.format(number);
}
