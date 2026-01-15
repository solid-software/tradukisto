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
  String asWords(double value) {
    return asWordsWithCurrency(value, currency.symbol);
  }

  @override
  String asWordsWithCurrency(double value, String currencySymbol) {
    _validate(value);

    int units = value.floor();
    int subunits = ((value - units) * 100).round();

    String unitsInWords = converter.asWords(units);
    String currencyName = currency.getCurrencyName(units);
    String subunitName = currency.getSubunitName(subunits);

    return '$unitsInWords $currencyName $subunits $subunitName';
  }

  void _validate(double value) {
    if (value < 0) {
      throw ArgumentError("can't transform negative numbers for value $value");
    }

    if (value >= 2147483648) {
      throw ArgumentError(
          "can't transform numbers greater than Integer.MAX_VALUE for value $value");
    }

    String valueStr = value.toStringAsFixed(10);
    int decimalIndex = valueStr.indexOf('.');
    if (decimalIndex != -1) {
      int decimalPlaces = valueStr.substring(decimalIndex + 1).length;
      while (decimalPlaces > 0 && valueStr[valueStr.length - 1] == '0') {
        valueStr = valueStr.substring(0, valueStr.length - 1);
        decimalPlaces--;
      }

      if (decimalPlaces > maximalDecimalPlacesCount) {
        throw ArgumentError(
            "can't transform more than $maximalDecimalPlacesCount decimal places for value $value");
      }
    }
  }
}
