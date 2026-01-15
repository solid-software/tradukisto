import 'package:decimal/decimal.dart';

abstract class BigDecimalToStringConverter {
  String asWords(Decimal value);

  String asWordsWithCurrency(Decimal value, String currencySymbol);
}
