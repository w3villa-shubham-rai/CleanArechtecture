import 'package:flutter/material.dart';
import '../theme_extension/Apptheme_custom_key_colors.dart';
import 'package:clean_archtecture/core/theme/app_pallet.dart';

class DarkTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
    ),



    inputDecorationTheme: const InputDecorationTheme(
      filled: true, // Background color for TextField
      fillColor:AppColors.blackColor, // Light mode background
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)), // Rounded corners
        borderSide: BorderSide(color: AppColors.whiteColor, width: 2), // Border color
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(color: AppColors.whiteColor, width: 1.5),
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
        gradient1: Color.fromRGBO(100, 50, 150, 1), // Darker gradients
        gradient2: Color.fromRGBO(150, 80, 120, 1),
        backgroundColor: Colors.black,
        borderColor: Colors.white,
        textColor: AppColors.lightBrown,
        firstCardBackGroundColor: AppColors.lightGunMetal,
        secondCardBackGroundColor: AppColors.borderColor,
        chipColor: AppColors.romanSilver,
        deleteIconColor: AppColors.antiFlashWhite,
        darkGardienTone:AppColors.darkGunMetal,
        darkGardienTTwo:AppColors.lightGunMetal,

      ),
    ],
  );
}
