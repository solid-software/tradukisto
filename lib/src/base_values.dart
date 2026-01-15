import 'currency.dart';
import 'languages/gender_forms.dart';
import 'languages/plural_forms.dart';

abstract class BaseValues {
  Map<int, GenderForms> baseNumbers();

  List<PluralForms> pluralForms();

  String currency();

  Currency getCurrency();

  String twoDigitsNumberSeparator();
}
