import 'gender_type.dart';

abstract class PluralForms {
  String formFor(int value);

  GenderType genderType();
}
