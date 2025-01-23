import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:maulesh_flutter_practice/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login and navigate through app', (WidgetTester tester) async {
    // Launch the app
    app.main();
    await tester.pumpAndSettle();

    // Verify the login screen is displayed
    await Future.delayed(Duration(seconds: 1));

    // expect(find.byKey(Key('loginButton')), findsOneWidget);

    await Future.delayed(Duration(seconds: 1));
    // Enter email and password
    await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
    await tester.enterText(find.byKey(Key('passwordField')), 'password123');
    await Future.delayed(Duration(seconds: 1));

    // Tap login button
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 1));

    // Verify navigation to HomeScreen after login
    expect(find.text('Welcome To Goa Singham'), findsOneWidget);
    await Future.delayed(Duration(seconds: 1));

    // Navigate to the "Settings" screen using the bottom navigation bar
    // await tester.tap(find.byKey(Key('settings')));
    await tester.tap(find.byIcon(CupertinoIcons.settings));
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 1));

    // Verify the "Settings" screen is displayed
    expect(find.text('Settings Screen'), findsOneWidget);
    await Future.delayed(Duration(seconds: 1));

    // Navigate to the "Profile" screen using the bottom navigation bar
    await tester.tap(find.byIcon(CupertinoIcons.profile_circled));
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 1));

    // Verify the "Profile" screen is displayed
    expect(find.text('Profile Screen'), findsOneWidget);
    await Future.delayed(Duration(seconds: 1));

    // Navigate back to the "Home" screen using the bottom navigation bar
    await tester.tap(find.byIcon(CupertinoIcons.home));  // Tapping the Home icon directly
    await tester.pumpAndSettle();
    await Future.delayed(Duration(seconds: 1));

    // Verify the "Home" screen is displayed
    expect(find.text('Welcome To Goa Singham'), findsOneWidget);
    await Future.delayed(Duration(seconds: 1));

  });
}
