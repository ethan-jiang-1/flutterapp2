// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp2/exam_ut/counter.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });
  test('Counter value should be incremented1', () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 2);
  });
}