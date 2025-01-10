// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:maulesh_flutter_practice/testing/calculator.dart';
import 'package:test/test.dart';

void main() {
  group('Calculator', () {
    // test('should add two numbers', () {
    //   final calculator = Calculator();
    //   final result = calculator.add(2, 3);
    //   expect(result, 5);
    // });

    test('should subtract two numbers', () {
      final calculator = Calculator();
      final result = calculator.subtract(5, 3);
      expect(result, 2);
    });
  });
}
