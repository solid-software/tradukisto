import '../../support/base_numbers_builder.dart';

import '../../base_values.dart';
import '../gender_forms.dart';
import '../plural_forms.dart';
import 'english_plural_forms.dart';

class EnglishValues implements BaseValues {

  @override
   Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "zero")
        .putString(1, "one")
        .putString(2, "two")
        .putString(3, "three")
        .putString(4, "four")
        .putString(5, "five")
        .putString(6, "six")
        .putString(7, "seven")
        .putString(8, "eight")
        .putString(9, "nine")
        .putString(10, "ten")
        .putString(11, "eleven")
        .putString(12, "twelve")
        .putString(13, "thirteen")
        .putString(14, "fourteen")
        .putString(15, "fifteen")
        .putString(16, "sixteen")
        .putString(17, "seventeen")
        .putString(18, "eighteen")
        .putString(19, "nineteen")
        .putString(20, "twenty")
        .putString(30, "thirty")
        .putString(40, "forty")
        .putString(50, "fifty")
        .putString(60, "sixty")
        .putString(70, "seventy")
        .putString(80, "eighty")
        .putString(90, "ninety")
        .putString(100, "one hundred")
        .putString(200, "two hundred")
        .putString(300, "three hundred")
        .putString(400, "four hundred")
        .putString(500, "five hundred")
        .putString(600, "six hundred")
        .putString(700, "seven hundred")
        .putString(800, "eight hundred")
        .putString(900, "nine hundred")
        .build();
  }

  @override
   List<PluralForms> pluralForms() {
    return [
        EnglishPluralForms(""),
        EnglishPluralForms("thousand"),
        EnglishPluralForms("million"),
        EnglishPluralForms("billion"),
        EnglishPluralForms("trillion"),
        EnglishPluralForms("quadrillion"),
        EnglishPluralForms("quintillion")
    ];
  }

  @override
   String currency() {
    return "£";
  }

  @override
  String twoDigitsNumberSeparator() {
    return '-';
  }
}