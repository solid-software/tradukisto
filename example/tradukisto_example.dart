
import 'package:tradukisto/value_converters.dart';

void main() {
  ValueConverters converter = ValueConverters.ENGLISH_INTEGER;
  print(converter.asWords(221));
}
