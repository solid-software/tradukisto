Convert numbers to text with Tradukisto. This library is a quick port of Tradukisto in Java (https://github.com/allegro/tradukisto).

Quick port means that it was done very quickly and not all features / dart language niceties are used.
Folder structure and class names are preserved to help with future porting.
## Features

Supports:
- Ukrainian
- English

Features:
- Convert integers to words
- Convert monetary amounts to words (with precise decimal arithmetic)

It's pretty easy to add a new language - as it just requires to port one file a do some small plumbing. See files to port here: https://github.com/allegro/tradukisto/tree/master/src/main/java/pl/allegro/finance/tradukisto/internal/languages

## Usage

### Integer to Words

```dart
ValueConverters converter = ValueConverters.ENGLISH_INTEGER;

print(converter.asWords(221));   //prints: two hundred twenty-one
```

### Money to Words

```dart
import 'package:decimal/decimal.dart';
import 'package:tradukisto/tradukisto.dart';

// English money converter
MoneyConverters converter = MoneyConverters.ENGLISH_BANKING_MONEY_VALUE;
print(converter.asWords(Decimal.parse('2567.45')));
// prints: two thousand five hundred sixty-seven US dollars 45 cents

// Ukrainian money converter
MoneyConverters ukrainianConverter = MoneyConverters.UKRAINIAN_BANKING_MONEY_VALUE;
print(ukrainianConverter.asWords(Decimal.parse('2567.45')));
// prints: дві тисячі п'ятсот шістдесят сім доларів США 45 центів
```

**Note:** MoneyConverters uses the `Decimal` type from the `decimal` package instead of `double` to ensure precise monetary calculations without floating-point precision issues.
