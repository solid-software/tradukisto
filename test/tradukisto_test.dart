import 'package:test/test.dart';
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
}
