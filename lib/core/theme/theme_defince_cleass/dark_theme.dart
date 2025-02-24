import 'package:flutter/material.dart';

class DarkTheme{
  static final  ThemeData darkTheme=ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.grey[900],
      textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
      ),
  );
}