import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

String formatPrice(int price) {
  final format = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  return format.format(price);
}
