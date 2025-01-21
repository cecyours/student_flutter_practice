import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'golden_testing/golden_test_ui.dart';

void main() async{
  setUpAll(() {
    // Initialize the test environment for Flutter widget tests
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  await loadAppFonts();
  testGoldens('Golden test for responsive layout', (tester) async {
    // Test for smaller screen (e.g., phone)
    tester.binding.window.physicalSizeTestValue = Size(411, 890);  // Smaller screen size
    // tester.binding.window.devicePixelRatioTestValue = 2.0;  // Pixel density

    // Pump the widget
    await tester.pumpWidget(
      MaterialApp(home: ResponsiveWidget()),
    );

    // wait for any animations or async tasks to finish
    await tester.pumpAndSettle();

    // Compare the widget rendering for small screens using Golden Toolkit's enhanced matcher
    await screenMatchesGolden(
      tester,
      'responsive_test_small_screen',  // Golden image for small screen
    );

    // Test for larger screen (e.g., tablet)
    tester.binding.window.physicalSizeTestValue = Size(768, 1280);  // Larger screen size (tablet)
    tester.binding.window.devicePixelRatioTestValue = 2.0;  // Pixel density

    // Pump the widget again for the larger screen
    await tester.pumpWidget(
      MaterialApp(home: ResponsiveWidget()),
    );

    // Wait for the UI to settle
    await tester.pumpAndSettle();

    // Compare the widget rendering for large screens using Golden Toolkit's enhanced matcher
    await screenMatchesGolden(
      tester,
      'responsive_test_large_screen',  // Golden image for large screen
    );
  });
}
