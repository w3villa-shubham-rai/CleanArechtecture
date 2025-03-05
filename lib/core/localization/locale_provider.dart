// import 'package:flutter/material.dart';

// class LocaleProvider extends ChangeNotifier {
//   Locale _locale = const Locale('en'); // Default language is English

//   Locale get locale => _locale;

//   void setLocale(Locale newLocale) {
//     if (!['en', 'es'].contains(newLocale.languageCode)) return;
//     _locale = newLocale;
//     notifyListeners();
//   }

//   void toggleLocale() {
//     _locale = (_locale.languageCode == 'en') ? const Locale('es') : const Locale('en');
//     notifyListeners();
//   }
// }
