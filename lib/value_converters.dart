import 'src/container.dart';

enum ValueConverters {
  ENGLISH_INTEGER,
  UKRAINIAN_INTEGER;

  // const ValueConverters(this._languageCodes);

  // static
  // ValueConverters(IntegerToStringConverter converter,
  //     List<String> languageCodes) {
  //   this.converter = converter;
  //   this.languageCodes = languageCodes;
  // }
  //
  // static ValueConverters getByLocaleOrDefault(Locale locale,
  //     ValueConverters defaultConverter) {
  //   Objects.requireNonNull(locale);
  //
  //   String languageCode = hasSpecifiedScript(locale)
  //       ? getLanguageCodeFor(locale.getLanguage(), locale.getScript())
  //       : locale.getLanguage();
  //
  //   return getByLanguageCodeOrDefault(languageCode, defaultConverter);
  // }
  //
  // static ValueConverters getByLanguageCodeOrDefault(String languageCode,
  //     ValueConverters defaultConverter) {
  //   Objects.requireNonNull(languageCode);
  //   Assert.isFalse(languageCode.isEmpty());
  //
  //   return Arrays.stream(values())
  //       .filter(it -> it.languageCodes.contains(languageCode))
  //       .findFirst()
  //       .orElse(defaultConverter);
  // }
  //
  // static
  //
  // boolean hasSpecifiedScript(Locale locale) {
  //   return !locale.getScript().isEmpty();
  // }
  //
  // static
  //
  // String getLanguageCodeFor(String language, String script) {
  //   return new Locale.Builder()
  //       .setLanguage(language)
  //       .setScript(script)
  //       .build()
  //       .toString();
  // }

  String asWords(int value) {
    Container container;
    switch (this) {
      case ENGLISH_INTEGER:
        container = Container.englishContainer();
        break;
      case ValueConverters.UKRAINIAN_INTEGER:
        container = Container.ukrainianContainer();
        break;
    }
    return container.getIntegerConverter().asWords(value);
  }
}
