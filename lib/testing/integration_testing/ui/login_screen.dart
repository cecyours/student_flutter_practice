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
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavScreen()),
      );
    } else {
      // Show an error message if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter username and password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Login'),
      ),
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