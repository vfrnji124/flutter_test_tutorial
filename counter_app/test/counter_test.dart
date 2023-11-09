import 'package:counter_app/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Counter counter;

  setUp(() {
    counter = Counter();
  });
  //testing
  group('Counter Class - ', () {
    test(
        'given counter class when it is instantiated then value of count should be zero',
        () {
      // Arrange
      // Act
      final val = counter.count;
      // Assert
      expect(val, 0);
    });

    test(
        'given counter class when it is incremented then value of count should be one',
        () {
      // Arange
      // Act
      counter.incrementCounter();
      final val = counter.count;
      // Assert
      expect(val, 1);
    });

    test(
        'given counter class when it is decremented then the value of count should be -1',
        () {
      // Arange
      // Act
      counter.decrementCounter();
      final val = counter.count;
      // Assert
      expect(val, -1);
    });

    test(
        'given counter class when it is reset then the value of count should be zero',
        () {
      counter.reset();
      expect(counter.count, 0);
    });
  });
}
