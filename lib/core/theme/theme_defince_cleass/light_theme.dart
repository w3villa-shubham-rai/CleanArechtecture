

import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:flutter/material.dart';
import '../theme_extension/Apptheme_custom_key_colors.dart';

class LightTheme{
  static final ThemeData lightTheme=ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
    ),

      inputDecorationTheme: const InputDecorationTheme(
        filled: true, // Background color for TextField
        fillColor: Colors.white, // Light mode background
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)), // Rounded corners
          borderSide: BorderSide(color: Colors.blue, width: 2), // Border color
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.blue, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.redAccent, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),

      ),

    extensions: const <ThemeExtension<dynamic>>[
      AppThemeColors(
        gradient1: Color.fromRGBO(187, 63, 221, 1),
        gradient2: Color.fromRGBO(251, 109, 169, 1),
        backgroundColor: Colors.white,
        borderColor: Colors.black,
        textColor:AppColors.whiteColor,
        firstCardBackGroundColor: AppColors.cobaltBlue,
        secondCardBackGroundColor: AppColors.lightBlue,
        chipColor:AppColors.lightBrown,
        deleteIconColor:AppColors.vividYellow
      ),
    ]
  );
}


// Theme.of(context).extension<AppThemeColors>();