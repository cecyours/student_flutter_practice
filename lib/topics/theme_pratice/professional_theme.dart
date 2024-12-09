import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  useMaterial3: true, primaryColor: Colors.white, textTheme: const TextTheme(displaySmall: TextStyle(
      fontSize: 30,
      color: Colors.black,
    ), bodyLarge: TextStyle(
      fontSize: 15,
      color: Colors.black,
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: Colors.orange,
      textStyle: TextStyle(
        fontSize: 15,
        color: Colors.white,
      ),
    )
  ),
);


ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.black,
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      fontSize: 30,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 15,
      color: Colors.white,
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.white,
        textStyle: TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
      )
  ),
);

