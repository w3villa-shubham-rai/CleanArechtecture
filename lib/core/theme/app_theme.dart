import 'package:flutter/material.dart';
import 'theme_defince_cleass/custom_theme.dart';
import 'theme_defince_cleass/dark_theme.dart';
import 'theme_defince_cleass/high_contrast_theme.dart';
import 'theme_defince_cleass/light_theme.dart';

class AppThemes {
  static final ThemeData lightTheme = LightTheme.lightTheme;
  static final ThemeData darkTheme = DarkTheme.darkTheme;
  static final ThemeData customTheme = CustomTheme.customTheme;
  static final ThemeData highContrastTheme = HighContrastTheme.highContrastTheme;
}
