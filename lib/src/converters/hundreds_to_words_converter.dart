

 import '../gender_aware_integer_to_string_converter.dart';
import '../languages/gender_forms.dart';
import '../languages/gender_type.dart';
import '../support/range.dart';


class HundredsToWordsConverter implements GenderAwareIntegerToStringConverter {

   final Map<int, GenderForms> baseValues;
   final String twoDigitsNumberSeparator;

   HundredsToWordsConverter(this.baseValues, this. twoDigitsNumberSeparator);

  @override
   String asWords(int value, GenderType genderType) {
    if (baseValues.containsKey(value)) {
      return baseValues[value]!.formFor(genderType);
    }
    if (Range.closed(21, 99).contains(value)) {
      return twoDigitsNumberAsString(value, genderType);
    }
    if (Range.closed(101, 999).contains(value)) {
      return threeDigitsNumberAsString(value, genderType);
    }

    throw "Can't convert $value";
  }

   String twoDigitsNumberAsString(int value, GenderType genderType) {
    int units = value % 10;
    int tens = value - units;
    return "${asWords(tens, genderType)}$twoDigitsNumberSeparator${asWords(units, genderType)}";
  }

   String threeDigitsNumberAsString(int value, GenderType genderType) {
    int tensWithUnits = value % 100;
    int hundreds = value - tensWithUnits;
    return "${asWords(hundreds, genderType)} ${asWords(tensWithUnits, genderType)}";

  }
}