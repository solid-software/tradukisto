## 0.2.0

- **BREAKING CHANGE**: MoneyConverters now uses `Decimal` type instead of `double` for precise monetary calculations
- Prevents floating-point precision issues in financial calculations
- Added `decimal` package dependency (version ^3.0.0) for arbitrary precision arithmetic
- All money conversion methods now accept `Decimal` parameters
- Updated all tests to use `Decimal.parse()` for creating monetary values
- Added precision tests demonstrating Decimal advantages over double
- Updated README with Decimal usage examples

## 0.1.0

- Added MoneyConverters functionality for converting monetary amounts to words
- Support for banking money format in English and Ukrainian
- Currency plural forms support (dollars/cents with proper grammatical forms)
- Comprehensive test suite for money conversion with edge cases and validation
- New classes: `MoneyConverters`, `BigDecimalToStringConverter`, `BigDecimalToBankingMoneyConverter`, `Currency`
- Extended `BaseValues` interface with `getCurrency()` method
- USD currency support with localized names in both English and Ukrainian

## 0.0.1

- Initial version with 2 languages: English and Ukrainian
