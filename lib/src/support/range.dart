class Range<N extends num> {
  final N _start;
  final N _end;

  Range._(this._start, this._end);

  bool contains(N value) {
    return _start.compareTo(value) <= 0 && value.compareTo(_end) <= 0;
  }

  static Range<num> closed(num start, num end) {
    return Range._(start, end);
  }
}
