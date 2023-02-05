import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  String dateFormat(String pattern) {
    if (this == null) {
      return '';
    }
    final format = DateFormat(pattern);
    return format.format(this!);
  }
}
