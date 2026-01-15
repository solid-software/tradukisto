import 'package:decimal/decimal.dart';
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
        expect(converter.asWords(Decimal.parse('0.00')), "нуль доларів США 0 центів");
      });

      test('one cent', () {
        expect(converter.asWords(Decimal.parse('0.01')), "нуль доларів США 1 цент");
      });

      test('multiple cents only', () {
        expect(converter.asWords(Decimal.parse('0.99')), "нуль доларів США 99 центів");
      });

      test('whole dollar amount', () {
        expect(converter.asWords(Decimal.parse('1.00')), "один долар США 0 центів");
      });

      test('round hundreds', () {
        expect(converter.asWords(Decimal.parse('100.00')), "сто доларів США 0 центів");
      });

      test('round thousands', () {
        expect(converter.asWords(Decimal.parse('1000.00')), "одна тисяча доларів США 0 центів");
      });
    });

    group('Plural forms for currency', () {
      test('one dollar (singular)', () {
        expect(converter.asWords(Decimal.parse('1.50')), "один долар США 50 центів");
      });

      test('two dollars (2-4 form)', () {
        expect(converter.asWords(Decimal.parse('2.00')), "два долари США 0 центів");
      });

      test('three dollars (2-4 form)', () {
        expect(converter.asWords(Decimal.parse('3.25')), "три долари США 25 центів");
      });

      test('four dollars (2-4 form)', () {
        expect(converter.asWords(Decimal.parse('4.99')), "чотири долари США 99 центів");
      });

      test('five dollars (5+ form)', () {
        expect(converter.asWords(Decimal.parse('5.00')), "п'ять доларів США 0 центів");
      });

      test('eleven dollars (special case)', () {
        expect(converter.asWords(Decimal.parse('11.00')), "одинадцять доларів США 0 центів");
      });

      test('twenty-one dollars (ends in 1)', () {
        expect(converter.asWords(Decimal.parse('21.00')), "двадцять один долар США 0 центів");
      });

      test('twenty-two dollars (ends in 2)', () {
        expect(converter.asWords(Decimal.parse('22.00')), "двадцять два долари США 0 центів");
      });

      test('twenty-five dollars (ends in 5)', () {
        expect(converter.asWords(Decimal.parse('25.00')), "двадцять п'ять доларів США 0 центів");
      });
    });

    group('Plural forms for cents', () {
      test('one cent (singular)', () {
        expect(converter.asWords(Decimal.parse('100.01')), "сто доларів США 1 цент");
      });

      test('two cents (2-4 form)', () {
        expect(converter.asWords(Decimal.parse('100.02')), "сто доларів США 2 центи");
      });

      test('five cents (5+ form)', () {
        expect(converter.asWords(Decimal.parse('100.05')), "сто доларів США 5 центів");
      });

      test('twenty-one cents (ends in 1)', () {
        expect(converter.asWords(Decimal.parse('100.21')), "сто доларів США 21 цент");
      });

      test('twenty-two cents (ends in 2)', () {
        expect(converter.asWords(Decimal.parse('100.22')), "сто доларів США 22 центи");
      });
    });

    group('Real-world amounts', () {

      test('typical small purchase', () {
        expect(converter.asWords(Decimal.parse('15.99')),
            "п'ятнадцять доларів США 99 центів");
      });

      test('typical medium purchase', () {
        expect(converter.asWords(Decimal.parse('249.50')),
            "двісті сорок дев'ять доларів США 50 центів");
      });

      test('large purchase', () {
        expect(converter.asWords(Decimal.parse('9999.99')),
            "дев'ять тисяч дев'ятсот дев'яносто дев'ять доларів США 99 центів");
      });

      test('very large amount', () {
        expect(converter.asWords(Decimal.parse('1000000.00')),
            "один мільйон доларів США 0 центів");
      });
    });

    group('Validation', () {
      test('negative amount throws error', () {
        expect(() => converter.asWords(Decimal.parse('-1.00')), throwsArgumentError);
      });

      test('too many decimal places throws error', () {
        expect(() => converter.asWords(Decimal.parse('1.234')), throwsArgumentError);
      });
    });
  });

  group('English Money Converter Tests', () {
    MoneyConverters converter = MoneyConverters.ENGLISH_BANKING_MONEY_VALUE;

    group('Basic conversions', () {
      test('zero amount', () {
        expect(converter.asWords(Decimal.parse('0.00')), "zero US dollars 0 cents");
      });

      test('one dollar singular', () {
        expect(converter.asWords(Decimal.parse('1.00')), "one US dollar 0 cents");
      });

      test('two dollars plural', () {
        expect(converter.asWords(Decimal.parse('2.00')), "two US dollars 0 cents");
      });

      test('one cent singular', () {
        expect(converter.asWords(Decimal.parse('0.01')), "zero US dollars 1 cent");
      });

      test('two cents plural', () {
        expect(converter.asWords(Decimal.parse('0.02')), "zero US dollars 2 cents");
      });
    });

    group('Real-world amounts', () {
      test('typical amount', () {
        expect(converter.asWords(Decimal.parse('3891.25')),
            "three thousand eight hundred ninety-one US dollars 25 cents");
      });

      test('small purchase', () {
        expect(converter.asWords(Decimal.parse('19.99')), "nineteen US dollars 99 cents");
      });

      test('large amount', () {
        expect(converter.asWords(Decimal.parse('1000000.00')),
            "one million US dollars 0 cents");
      });
    });

    group('Validation', () {
      test('negative amount throws error', () {
        expect(() => converter.asWords(Decimal.parse('-10.00')), throwsArgumentError);
      });
    });
  });

  group('Decimal Precision Tests', () {
    test('Decimal handles precise values that double would struggle with', () {
      // Test a value that would have floating point precision issues with double
      var converter = MoneyConverters.ENGLISH_BANKING_MONEY_VALUE;

      // This precise value is exactly representable with Decimal
      var preciseValue = Decimal.parse('0.10') + Decimal.parse('0.20');
      expect(preciseValue, Decimal.parse('0.30'));

      // Verify it converts correctly
      expect(converter.asWords(preciseValue), "zero US dollars 30 cents");
    });

    test('Decimal preserves exact monetary values', () {
      var converter = MoneyConverters.UKRAINIAN_BANKING_MONEY_VALUE;

      // Values that require exact decimal representation
      expect(converter.asWords(Decimal.parse('123.45')),
          "сто двадцять три долари США 45 центів");

      expect(converter.asWords(Decimal.parse('999.99')),
          "дев'ятсот дев'яносто дев'ять доларів США 99 центів");
    });
  });

  group('README Examples Verification', () {
    test('English README example works correctly', () {
      var converter = MoneyConverters.ENGLISH_BANKING_MONEY_VALUE;
      expect(converter.asWords(Decimal.parse('2567.45')),
          "two thousand five hundred sixty-seven US dollars 45 cents");
    });

    test('Ukrainian README example works correctly', () {
      var converter = MoneyConverters.UKRAINIAN_BANKING_MONEY_VALUE;
      expect(converter.asWords(Decimal.parse('2567.45')),
          "дві тисячі п'ятсот шістдесят сім доларів США 45 центів");
    });
  });
}
