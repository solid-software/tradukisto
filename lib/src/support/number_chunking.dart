 import 'dart:collection';

class NumberChunking {

  static final int SPLIT_FACTOR = 1000;

   List<int> chunk(int value) {
    List<int> result = [];

    while (value > 0) {
      result.insert(0, (value % SPLIT_FACTOR));
      value =  value~/SPLIT_FACTOR;
    }

    return result;
  }
}
