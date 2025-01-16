import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maulesh_flutter_practice/testing/widget_testing/widget_test_1.dart';

void main() {
  testWidgets('Counter increments when tapped', (WidgetTester tester) async {

    // to build the widget
    await tester.pumpWidget(const WidgetTest1());

    // to find a text
    // final found = find.text('0');
    final found = find.text('0');
   // expect the output
    expect(found, findsOneWidget);

    // // find the widget using this line
    final finder = find.byType(FloatingActionButton);
    await tester.tap(finder);
    //
    // // rebuild the widget (setstate())
    await tester.pump();
    //
    // // to find a text
    final incrementFound = find.text('1');
    //
    // // expect the output
    expect(incrementFound, findsOneWidget);


  });

  // testWidgets('Counter decrements when tapped', (WidgetTester tester) async {
  //
  // });

}
