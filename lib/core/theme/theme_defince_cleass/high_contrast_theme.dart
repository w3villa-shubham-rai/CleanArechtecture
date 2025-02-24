import 'package:flutter/material.dart';

class HighContrastTheme {
  static final ThemeData highContrastTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.yellow,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
    ),
  );
}
