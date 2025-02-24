import 'package:flutter/material.dart';

class CustomTheme {
  static final ThemeData customTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.teal.shade50,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.green),
    ),
  );
}
