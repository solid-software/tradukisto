import '../gender_type.dart';
import '../plural_forms.dart';

class EnglishPluralForms implements PluralForms {
  final String _form;

  EnglishPluralForms(this._form);

  @override
  String formFor(int value) {
    return _form;
  }

  @override
  GenderType genderType() {
    return GenderType.NON_APPLICABLE;
  }
}
