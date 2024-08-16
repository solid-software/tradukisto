
import 'languages/gender_type.dart';

abstract class GenderAwareIntegerToStringConverter {
String asWords(int value, GenderType genderType);
}