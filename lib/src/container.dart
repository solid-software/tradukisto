import 'base_values.dart';
import 'big_decimal_to_string_converter.dart';
import 'converters/big_decimal_to_banking_money_converter.dart';
import 'converters/hundreds_to_words_converter.dart';
import 'converters/number_to_words_converter.dart';
import 'integer_to_string_converter.dart';
import 'languages/english/english_values.dart';
import 'languages/ukrainian/ukrainian_values.dart';

class Container {
  static Container ukrainianContainer() {
    return _fromBaseValues(UkrainianValues());
  }

  static Container englishContainer() {
    return _fromBaseValues(EnglishValues());
  }

  final IntegerToStringConverter integerConverter;
  final BigDecimalToStringConverter bankingMoneyConverter;

  static _fromBaseValues(BaseValues baseValues) {
    HundredsToWordsConverter hundredsToStringConverter =
        HundredsToWordsConverter(
            baseValues.baseNumbers(), baseValues.twoDigitsNumberSeparator());

    NumberToWordsConverter numberToWordsConverter = NumberToWordsConverter(
        hundredsToStringConverter, baseValues.pluralForms());

    BigDecimalToStringConverter bigDecimalConverter =
        BigDecimalToBankingMoneyConverter(
            numberToWordsConverter, baseValues.getCurrency());

    return Container._(numberToWordsConverter, bigDecimalConverter);
  }

  Container._(this.integerConverter, this.bankingMoneyConverter);

  IntegerToStringConverter getIntegerConverter() {
    return integerConverter;
  }

  BigDecimalToStringConverter getBankingMoneyConverter() {
    return bankingMoneyConverter;
  }
}
