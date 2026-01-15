import 'package:test/test.dart';
import 'package:tradukisto/money_converters.dart';
import 'package:tradukisto/value_converters.dart';

void main() {
  group('A group of tests', () {
    ValueConverters converter = ValueConverters.UKRAINIAN_INTEGER;

    setUp(() {});

    test('hundreds test', () {
      // add bracket around the number to make it clear
      expect(converter.asWords(221), "двісті двадцять один");
      expect(converter.asWords(195), "сто дев'яносто п'ять");
    });
    test('thousands test', () {
      expect(converter.asWords(2345), "дві тисячі триста сорок п'ять");
      expect(
          converter.asWords(25345), "двадцять п'ять тисяч триста сорок п'ять");
      expect(
          converter.asWords(21345), "двадцять одна тисяча триста сорок п'ять");
    });
  });

  group('Ukrainian Money Converter Tests', () {
    MoneyConverters converter = MoneyConverters.UKRAINIAN_BANKING_MONEY_VALUE;

    group('Edge cases', () {
      test('zero amount', () {
        expect(converter.asWords(0.00), "нуль доларів США 0 центів");
      });

      test('one cent', () {
        expect(converter.asWords(0.01), "нуль доларів США 1 цент");
      });

      test('multiple cents only', () {
        expect(converter.asWords(0.99), "нуль доларів США 99 центів");
      });

      test('whole dollar amount', () {
        expect(converter.asWords(1.00), "один долар США 0 центів");
      });

      test('round hundreds', () {
        expect(converter.asWords(100.00), "сто доларів США 0 центів");
      });

      test('round thousands', () {
        expect(converter.asWords(1000.00), "одна тисяча доларів США 0 центів");
      });
    });

    group('Plural forms for currency', () {
      test('one dollar (singular)', () {
        expect(converter.asWords(1.50), "один долар США 50 центів");
      });

      test('two dollars (2-4 form)', () {
        expect(converter.asWords(2.00), "два долари США 0 центів");
      });

      test('three dollars (2-4 form)', () {
        expect(converter.asWords(3.25), "три долари США 25 центів");
      });

      test('four dollars (2-4 form)', () {
        expect(converter.asWords(4.99), "чотири долари США 99 центів");
      });

      test('five dollars (5+ form)', () {
        expect(converter.asWords(5.00), "п'ять доларів США 0 центів");
      });

      test('eleven dollars (special case)', () {
        expect(converter.asWords(11.00), "одинадцять доларів США 0 центів");
      });

      test('twenty-one dollars (ends in 1)', () {
        expect(converter.asWords(21.00), "двадцять один долар США 0 центів");
      });

      test('twenty-two dollars (ends in 2)', () {
        expect(converter.asWords(22.00), "двадцять два долари США 0 центів");
      });

      test('twenty-five dollars (ends in 5)', () {
        expect(converter.asWords(25.00), "двадцять п'ять доларів США 0 центів");
      });
    });

    group('Plural forms for cents', () {
      test('one cent (singular)', () {
        expect(converter.asWords(100.01), "сто доларів США 1 цент");
      });

      test('two cents (2-4 form)', () {
        expect(converter.asWords(100.02), "сто доларів США 2 центи");
      });

      test('five cents (5+ form)', () {
        expect(converter.asWords(100.05), "сто доларів США 5 центів");
      });

      test('twenty-one cents (ends in 1)', () {
        expect(converter.asWords(100.21), "сто доларів США 21 цент");
      });

      test('twenty-two cents (ends in 2)', () {
        expect(converter.asWords(100.22), "сто доларів США 22 центи");
      });
    });

    group('Real-world amounts', () {

      test('typical small purchase', () {
        expect(converter.asWords(15.99),
            "п'ятнадцять доларів США 99 центів");
      });

      test('typical medium purchase', () {
        expect(converter.asWords(249.50),
            "двісті сорок дев'ять доларів США 50 центів");
      });

      test('large purchase', () {
        expect(converter.asWords(9999.99),
            "дев'ять тисяч дев'ятсот дев'яносто дев'ять доларів США 99 центів");
      });

      test('very large amount', () {
        expect(converter.asWords(1000000.00),
            "один мільйон доларів США 0 центів");
      });
    });

    group('Validation', () {
      test('negative amount throws error', () {
        expect(() => converter.asWords(-1.00), throwsArgumentError);
      });

      test('too many decimal places throws error', () {
        expect(() => converter.asWords(1.234), throwsArgumentError);
      });
    });
  });

  group('English Money Converter Tests', () {
    MoneyConverters converter = MoneyConverters.ENGLISH_BANKING_MONEY_VALUE;

    group('Basic conversions', () {
      test('zero amount', () {
        expect(converter.asWords(0.00), "zero US dollars 0 cents");
      });

      test('one dollar singular', () {
        expect(converter.asWords(1.00), "one US dollar 0 cents");
      });

      test('two dollars plural', () {
        expect(converter.asWords(2.00), "two US dollars 0 cents");
      });

      test('one cent singular', () {
        expect(converter.asWords(0.01), "zero US dollars 1 cent");
      });

      test('two cents plural', () {
        expect(converter.asWords(0.02), "zero US dollars 2 cents");
      });
    });

    group('Real-world amounts', () {
      test('typical amount', () {
        expect(converter.asWords(4112.80),
            "four thousand one hundred twelve US dollars 80 cents");
      });

      test('small purchase', () {
        expect(converter.asWords(19.99), "nineteen US dollars 99 cents");
      });

      test('large amount', () {
        expect(converter.asWords(1000000.00),
            "one million US dollars 0 cents");
      });
    });

    group('Validation', () {
      test('negative amount throws error', () {
        expect(() => converter.asWords(-10.00), throwsArgumentError);
      });
    });
  });
}
