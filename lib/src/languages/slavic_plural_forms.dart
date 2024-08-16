import 'gender_type.dart';
import 'plural_forms.dart';
import '../support/range.dart';

class SlavicPluralForms implements PluralForms {
  final String singularForm;
  final String pluralForm;
  final String genitivePluralForm;

  final GenderType _genderType;

  SlavicPluralForms(this.singularForm, this.pluralForm, this.genitivePluralForm,
      this._genderType);

  @override
  String formFor(int value) {
    if (useSingular(value)) {
      return singularForm;
    }
    if (usePluralForm(value)) {
      return pluralForm;
    }
    return genitivePluralForm;
  }

  bool useSingular(int value) {
    return value == 1 || (value % 100 != 11 && value % 10 == 1);
  }

  bool usePluralForm(int value) {
    return Range.closed(2, 4).contains(value % 10) &&
        !Range.closed(12, 14).contains(value % 100);
  }

  @override
  GenderType genderType() {
    return _genderType;
  }
}
