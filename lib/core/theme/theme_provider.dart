import 'package:clean_archtecture/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  static final ThemeManager _instance = ThemeManager._internal();
  factory ThemeManager() => _instance;
  ThemeManager._internal();

  static const String _themeKey = 'themeMode';
  late SharedPreferences _prefs;
  final ValueNotifier<ThemeData> themeNotifier = ValueNotifier(AppThemes.lightTheme);

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    String themeMode = _prefs.getString(_themeKey) ?? 'light';
    themeNotifier.value = _getTheme(themeMode);
  }

  ThemeData _getTheme(String themeKey) {
    switch (themeKey) {
      case 'dark':
        return AppThemes.darkTheme;
      case 'custom':
        return AppThemes.customTheme;
      case 'highContrast':
        return AppThemes.highContrastTheme;
      default:
        return AppThemes.lightTheme;
    }
  }

  Future<void> setTheme(String themeKey) async {
    await _prefs.setString(_themeKey, themeKey);
    themeNotifier.value = _getTheme(themeKey); // Update ValueNotifier
  }
}
