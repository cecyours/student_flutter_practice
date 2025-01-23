# Integration Test App Documentation

## Overview

This document outlines the integration testing setup for a Flutter application that includes a login screen, a bottom navigation bar with three screens (Home, Settings, Profile), and the corresponding integration tests to verify the navigation flow.

## Necessary Packages

To implement the integration test, ensure you have the following packages in your `pubspec.yaml` file:

```yaml
dev_dependencies:
  integration_test: ^2.0.0
  sdk: flutter
Application Flow

Login Screen: Users enter their email and password.

Bottom Navigation Bar: After logging in, users can navigate to Home, Settings, and Profile screens using the bottom navigation bar.

Screen Verification: Each screen displays specific content that needs to be verified through tests.

Step-by-Step Implementation
1. Create the Login Screen
Create a file named integration_login_screen.dart:

dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_nav_screen.dart';

class IntegrationLoginScreen extends StatefulWidget {
  @override
  _IntegrationLoginScreenState createState() => _IntegrationLoginScreenState();
}

class _IntegrationLoginScreenState extends State<IntegrationLoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter username and password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CupertinoTextField(
              key: Key('emailField'),
              controller: _emailController,
              placeholder: 'Email',
              padding: EdgeInsets.symmetric(vertical: 12.0),
            ),
            SizedBox(height: 16),
            CupertinoTextField(
              key: Key('passwordField'),
              controller: _passwordController,
              placeholder: 'Password',
              obscureText: true,
              padding: EdgeInsets.symmetric(vertical: 12.0),
            ),
            SizedBox(height: 32),
            CupertinoButton.filled(
              key: Key('loginButton'),
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
2. Create the Bottom Navigation Screen
Create a file named bottom_nav_screen.dart:

dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'setting_screen.dart';
import 'homescreen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To Goa Singham'),
        actions: [
          IconButton(
            key: Key('SettingButton'),
            onPressed: () {
              _onItemTapped(1);
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        activeColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            key: Key('settings'),
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            key: Key('profileButton'),
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
3. Create Home, Profile, and Settings Screens
Create files for each screen (homescreen.dart, profile_screen.dart, and setting_screen.dart):

Home Screen (homescreen.dart):

dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.home, size: 100, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            'Welcome to Home Screen!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
Profile Screen (profile_screen.dart):

dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.profile_circled, size: 100, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            'Profile Screen',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
Settings Screen (setting_screen.dart):

dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.settings, size: 100, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            'Settings Screen',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
4. Create Integration Test
Create a file named integration_test_app_test.dart:

dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart'; // Add this if needed for file access.
import 'package:path/path.dart'; // Add this if needed for path manipulation.
import '../lib/main.dart' as app; // Adjust according to your project structure.

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login and navigate through app', (WidgetTester tester) async {
    // Launch the app
    app.main();
    await tester.pumpAndSettle();

    // Verify the login screen is displayed
    expect(find.text('Login'), findsOneWidget);

    // Enter email and password
    await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
    await tester.enterText(find.byKey(Key('passwordField')), 'password123');

    // Tap login button
    await tester.tap(find.byKey(Key('loginButton')));
    await tester.pumpAndSettle();

    // Verify navigation to HomeScreen after login
    expect(find.text('Welcome To Goa Singham'), findsOneWidget);

    // Navigate to the "Settings" screen using the bottom navigation bar
    await tester.tap(find.byIcon(CupertinoIcons.settings));
    await tester.pumpAndSettle();

    // Verify the "Settings" screen is displayed
    expect(find.text('Settings Screen'), findsOneWidget);

    // Navigate to the "Profile" screen using the bottom navigation bar
    await tester.tap(find.byIcon(CupertinoIcons.profile_circled));
    await tester.pumpAndSettle();

    // Verify the "Profile" screen is displayed
    expect(find.text('Profile Screen'), findsOneWidget);

    // Navigate back to the "Home" screen using the bottom navigation bar
    await tester.tap(find.byIcon(CupertinoIcons.home));
    await tester.pumpAndSettle();

    // Verify the "Home" screen is displayed
    expect(find.text('Welcome to Home Screen!'), findsOneWidget);
  });
}
Conclusion
This document provides a comprehensive guide for setting up an integration test for a Flutter application with a login flow and bottom navigation. By following these steps and utilizing the provided code snippets, you can effectively test your application's navigation and UI interactions.