import 'package:intl/intl.dart';

extension CurrencyFormat on num {
  String currencyFormat() {
    return NumberFormat("#,##0.00", "en_US").format(this);
  }
}
