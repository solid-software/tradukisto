import 'dart:core';

import '../gender_aware_integer_to_string_converter.dart';
import '../integer_to_string_converter.dart';
import '../languages/plural_forms.dart';
import '../support/number_chunking.dart';

class NumberToWordsConverter implements IntegerToStringConverter {
  final NumberChunking numberChunking = NumberChunking();

  final GenderAwareIntegerToStringConverter hundredsToWordsConverter;
  final List<PluralForms> pluralForms;

  NumberToWordsConverter(this.hundredsToWordsConverter, this.pluralForms);

  @override
  String asWords(int value) {
    List<int> valueChunks = numberChunking.chunk(value);
    List<PluralForms> formsToUse =
        getRequiredFormsInReversedOrder(valueChunks.length);

    return joinValueChunksWithForms(valueChunks.iterator, formsToUse.iterator);
  }

  List<PluralForms> getRequiredFormsInReversedOrder(int chunks) {
    List<PluralForms> formsToUse =
        pluralForms.sublist(0, chunks).reversed.toList();
    return formsToUse;
  }

  String joinValueChunksWithForms(
      Iterator<int> chunks, Iterator<PluralForms> formsToUse) {
    List<String> result = [];

    while (chunks.moveNext() && formsToUse.moveNext()) {
      int currentChunkValue = chunks.current;
      PluralForms currentForms = formsToUse.current;

      if (currentChunkValue > 0) {
        result.add(hundredsToWordsConverter.asWords(
            currentChunkValue, currentForms.genderType()));
        result.add(currentForms.formFor(currentChunkValue));
      }
    }

    return joinParts(result);
  }

  String joinParts(List<String> result) {
    return result.isEmpty
        ? hundredsToWordsConverter.asWords(0, pluralForms[0].genderType())
        : result.join(" ").trim();
  }
}
