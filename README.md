Convert numbers to text with Tradukisto. This library is a quick port of Tradukisto in Java (https://github.com/allegro/tradukisto).

Quick port means that it was done very quickly and not all features / dart language niceties are used.
Folder structure and class names are preserved to help with future porting.
## Features

Supports:
- Ukrainian
- English

It's pretty easy to add a new language - as it just requires to port one file a do some small plumbing. See files to port here: https://github.com/allegro/tradukisto/tree/master/src/main/java/pl/allegro/finance/tradukisto/internal/languages

## Usage

```dart
ValueConverters converter = ValueConverters.ENGLISH_INTEGER;

print(converter.asWords(221));   //prints: two hundred twenty-one
```
