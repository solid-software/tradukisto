import 'package:decimal/decimal.dart';

import 'src/container.dart';

enum MoneyConverters {
  ENGLISH_BANKING_MONEY_VALUE,
  UKRAINIAN_BANKING_MONEY_VALUE;

  String asWords(Decimal value) {
    Container container;
    switch (this) {
      case ENGLISH_BANKING_MONEY_VALUE:
        container = Container.englishContainer();
        break;
      case UKRAINIAN_BANKING_MONEY_VALUE:
        container = Container.ukrainianContainer();
        break;
    }
    return container.getBankingMoneyConverter().asWords(value);
  }

  String asWordsWithCurrency(Decimal value, String currencySymbol) {
    Container container;
    switch (this) {
      case ENGLISH_BANKING_MONEY_VALUE:
        container = Container.englishContainer();
        break;
      case UKRAINIAN_BANKING_MONEY_VALUE:
        container = Container.ukrainianContainer();
        break;
    }
    return container
        .getBankingMoneyConverter()
        .asWordsWithCurrency(value, currencySymbol);
  }
}
