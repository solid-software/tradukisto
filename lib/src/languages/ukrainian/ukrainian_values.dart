import '../../support/base_numbers_builder.dart';

import '../../base_values.dart';
import '../gender_forms.dart';
import '../gender_type.dart';
import '../plural_forms.dart';
import '../slavic_plural_forms.dart';

class UkrainianValues implements BaseValues {
  @override
  Map<int, GenderForms> baseNumbers() {
    return BaseNumbersBuilder.baseNumbersBuilder()
        .putString(0, "нуль")
        .put(1, GenderForms.genderForms("один", "одна", "одну"))
        .put(2, GenderForms.genderForms("два", "дві", "дві"))
        .putString(3, "три")
        .putString(4, "чотири")
        .putString(5, "п'ять")
        .putString(6, "шість")
        .putString(7, "сім")
        .putString(8, "вісім")
        .putString(9, "дев'ять")
        .putString(10, "десять")
        .putString(11, "одинадцять")
        .putString(12, "дванадцять")
        .putString(13, "тринадцять")
        .putString(14, "чотирнадцять")
        .putString(15, "п'ятнадцять")
        .putString(16, "шістнадцять")
        .putString(17, "сімнадцять")
        .putString(18, "вісімнадцять")
        .putString(19, "дев'ятнадцять")
        .putString(20, "двадцять")
        .putString(30, "тридцять")
        .putString(40, "сорок")
        .putString(50, "п'ятдесят")
        .putString(60, "шістдесят")
        .putString(70, "сімдесят")
        .putString(80, "вісімдесят")
        .putString(90, "дев'яносто")
        .putString(100, "сто")
        .putString(200, "двісті")
        .putString(300, "триста")
        .putString(400, "чотириста")
        .putString(500, "п'ятсот")
        .putString(600, "шістсот")
        .putString(700, "сімсот")
        .putString(800, "вісімсот")
        .putString(900, "дев'ятсот")
        .build();
  }

  @override
  List<PluralForms> pluralForms() {
    return [
      new SlavicPluralForms("", "", "", GenderType.MASCULINE),
      new SlavicPluralForms("тисяча", "тисячі", "тисяч", GenderType.FEMININE),
      new SlavicPluralForms(
          "мільйон", "мільйони", "мільйонів", GenderType.MASCULINE),
      new SlavicPluralForms(
          "мільярд", "мільярди", "мільярдів", GenderType.MASCULINE)
    ];
  }

  @override
  String currency() {
    return "₴";
  }

  @override
  String twoDigitsNumberSeparator() {
    return ' ';
  }
}
