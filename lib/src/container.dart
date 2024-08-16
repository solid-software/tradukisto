import 'base_values.dart';
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

  static _fromBaseValues(BaseValues baseValues) {
    HundredsToWordsConverter hundredsToStringConverter =
        HundredsToWordsConverter(
            baseValues.baseNumbers(), baseValues.twoDigitsNumberSeparator());

    NumberToWordsConverter numberToWordsConverter = NumberToWordsConverter(
        hundredsToStringConverter, baseValues.pluralForms());
    return Container._(numberToWordsConverter);
  }

  Container._(this.integerConverter);

  IntegerToStringConverter getIntegerConverter() {
    return integerConverter;
  }
}
