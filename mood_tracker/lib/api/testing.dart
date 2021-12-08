// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:mood_tracker/login.dart';
import 'package:mood_tracker/home.dart';

void main() {
  test('login should return', () {
    final counter = loadData();

    counter.increment();

    expect(counter.value, 1);
  });

  // test('Entries should be found', () {
  //   final counter = Counter();

  //   counter.increment();

  //   expect(counter.value, 1);
  // });
}
