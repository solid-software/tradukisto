import 'gender_type.dart';

class GenderForms {
  final Map<GenderType, String> _forms;

  static GenderForms genderForms(
      String masculineForm, String feminineForm, String neuterForm) {
    return GenderForms(masculineForm, feminineForm, neuterForm);
  }

  static GenderForms genderFormsWithNa(String masculineForm,
      String feminineForm, String neuterForm, String nonApplicableForm) {
    return GenderForms.withNA(
        masculineForm, feminineForm, neuterForm, nonApplicableForm);
  }

  static GenderForms genderForm(String nonApplicableForm) {
    return GenderForms.naForm(nonApplicableForm);
  }

  GenderForms(String masculineForm, String feminineForm, String neuterForm)
      : _forms = {
          GenderType.MASCULINE: masculineForm,
          GenderType.FEMININE: feminineForm,
          GenderType.NEUTER: neuterForm
        };

  GenderForms.withNA(String masculineForm, String feminineForm,
      String neuterForm, String nonApplicableForm)
      : _forms = {
          GenderType.MASCULINE: masculineForm,
          GenderType.FEMININE: feminineForm,
          GenderType.NEUTER: neuterForm,
          GenderType.NON_APPLICABLE: nonApplicableForm
        };

  GenderForms.naForm(String nonApplicableForm)
      : _forms = {
          GenderType.MASCULINE: nonApplicableForm,
          GenderType.FEMININE: nonApplicableForm,
          GenderType.NEUTER: nonApplicableForm,
          GenderType.NON_APPLICABLE: nonApplicableForm
        };

  String formFor(GenderType gender) {
    validate(gender);
    return _forms[gender]!;
  }

  void validate(GenderType gender) {
    if (!_forms.containsKey(gender)) {
      throw "No form found for $gender. Available forms: $_forms";
    }
  }
}
