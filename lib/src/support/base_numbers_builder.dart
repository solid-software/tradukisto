import 'dart:collection';
import 'dart:core';

import '../languages/gender_forms.dart';


class BaseNumbersBuilder {
  final Map<int, GenderForms> _result = HashMap<int, GenderForms>();

  static BaseNumbersBuilder baseNumbersBuilder() {
    return new BaseNumbersBuilder();
  }

  BaseNumbersBuilder put(int number, GenderForms forms) {
    if (_result.containsKey(number)) {
      throw "NumberAlreadyMappedException = $number";
    }
    _result[number] = forms;
    return this;
  }

  BaseNumbersBuilder putString(int number, String form) {
    if (_result.containsKey(number)) {
      throw "NumberAlreadyMappedException = $number";
    }
    _result[number] = GenderForms.genderForm(form);
    return this;
  }

  Map<int, GenderForms> build() {
    return _result;
  }
}
