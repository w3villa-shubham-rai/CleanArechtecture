import 'package:clean_archtecture/core/utils/app_type_def.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static SharedPreferences? _sharedPreferences;
  static AppPreference preference = AppPreference._();

  AppPreference._();

  AppPreference() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  static FVoid init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    debugPrint('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  static void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  static FVoid setThemeData(String value) {
    return _sharedPreferences!.setString(StorageKey.themeKey, value);
  }

  static String getThemeData() {
    try {
      return _sharedPreferences?.getString(StorageKey.themeKey) ?? "system";
    } catch (e) {
      return 'system';
    }
  }

  static String? getLanguage (){
    return _sharedPreferences?.getString(StorageKey.languageKey);
  }

  static FVoid setLanguage ({required String langCode}) async {
    await _sharedPreferences?.setString(StorageKey.languageKey, langCode);
  }
}

abstract class StorageKey {
  static const String languageKey = 'lang';
  static const String themeKey = 'themeData';
}