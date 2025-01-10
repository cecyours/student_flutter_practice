import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maulesh_flutter_practice/testing/widget_testing/widget_test_1.dart';

void main() {
  testWidgets('Counter increments when tapped', (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(WidgetTest1());

    // Verify that the initial value is 0
    expect(find.text('0'), findsOneWidget);

    // Tap the widget
    await tester.tap(find.byType(GestureDetector));
    await tester.pump(); // Rebuild the widget after the tap

    // Verify that the value has incremented
    expect(find.text('1'), findsOneWidget);
  });
}
