import 'languages/plural_forms.dart';

class Currency {
  final String symbol;
  final List<String> names;
  final List<String> subunitNames;

  Currency({
    required this.symbol,
    required this.names,
    required this.subunitNames,
  });

  String getCurrencyName(int amount) {
    if (names.length == 1) {
      return names[0];
    }
    return _getForm(amount, names);
  }

  String getSubunitName(int amount) {
    if (subunitNames.length == 1) {
      return subunitNames[0];
    }
    return _getForm(amount, subunitNames);
  }

  String _getForm(int amount, List<String> forms) {
    if (forms.length == 1) {
      return forms[0];
    }
    if (forms.length == 2) {
      return amount == 1 ? forms[0] : forms[1];
    }
    if (forms.length == 3) {
      int mod10 = amount % 10;
      int mod100 = amount % 100;

      if (mod100 >= 11 && mod100 <= 19) {
        return forms[2];
      }
      if (mod10 == 1) {
        return forms[0];
      }
      if (mod10 >= 2 && mod10 <= 4) {
        return forms[1];
      }
      return forms[2];
    }
    return forms[0];
  }
}
