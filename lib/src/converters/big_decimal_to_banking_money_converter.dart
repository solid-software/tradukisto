import 'package:decimal/decimal.dart';

import '../big_decimal_to_string_converter.dart';
import '../currency.dart';
import '../integer_to_string_converter.dart';

class BigDecimalToBankingMoneyConverter
    implements BigDecimalToStringConverter {
  static const int maximalDecimalPlacesCount = 2;

  final IntegerToStringConverter converter;
  final Currency currency;

  BigDecimalToBankingMoneyConverter(this.converter, this.currency);

  @override
  String asWords(Decimal value) {
    return asWordsWithCurrency(value, currency.symbol);
  }

  @override
  String asWordsWithCurrency(Decimal value, String currencySymbol) {
    _validate(value);

    int units = value.toBigInt().toInt();
    Decimal fractionalPart = value - Decimal.fromBigInt(BigInt.from(units));
    int subunits = (fractionalPart * Decimal.fromInt(100)).toBigInt().toInt();

    String unitsInWords = converter.asWords(units);
    String currencyName = currency.getCurrencyName(units);
    String subunitName = currency.getSubunitName(subunits);

    return '$unitsInWords $currencyName $subunits $subunitName';
  }

  void _validate(Decimal value) {
    if (value < Decimal.zero) {
      throw ArgumentError("can't transform negative numbers for value $value");
    }

    if (value >= Decimal.fromInt(2147483648)) {
      throw ArgumentError(
          "can't transform numbers greater than Integer.MAX_VALUE for value $value");
    }

    // Check decimal places
    int scale = value.scale;
    if (scale > maximalDecimalPlacesCount) {
      throw ArgumentError(
          "can't transform more than $maximalDecimalPlacesCount decimal places for value $value");
    }
  }
}
