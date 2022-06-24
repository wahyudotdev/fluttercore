import 'package:intl/intl.dart';

extension CurrencyFormat on int? {
  /// format price (int) to indonesian rupiah
  String get toIDR {
    final formatCurrency = NumberFormat.currency(
        locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0);
    return formatCurrency.format(this);
  }
}
