
import 'package:flutter/material.dart';

import '../app_pallet.dart';

class AppLightTheme {
  ThemeData getTheme() {
    return ThemeData.light().copyWith(
      colorScheme: lightColorScheme,
      scaffoldBackgroundColor: AppColors.whiteColor,
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.all(27),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.gradient2, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      hintColor: AppColors.backgroundColor,
      primaryColor: AppColors.borderColor,
      primaryColorLight: AppColors.whiteColor,
      primaryColorDark: AppColors.lightGunMetal,
      drawerTheme: DrawerThemeData(
         backgroundColor: AppColors.cobaltBlue,
         shape: Border.all(
         color: AppColors.pigmentRed,
       )
      ),
      textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'robotoBold',color:lightColorScheme.secondaryContainer,fontSize: 25),
          bodySmall: TextStyle(fontFamily: 'robotoBold',color:lightColorScheme.onSurface,fontSize: 12),
          bodyMedium: TextStyle(fontFamily: 'robotoBold',color:lightColorScheme.secondary,fontSize: 15)
      ),
    );
  }
}


const ColorScheme lightColorScheme = ColorScheme(
  primary: AppColors.gradient1,
  primaryContainer: AppColors.gradient2,
  secondary: AppColors.cobaltBlue,
  secondaryContainer: AppColors.gradient3,
  background: AppColors.backgroundColor,
  surface: AppColors.culturedColor,
  error: AppColors.errorColor,
  onPrimary: AppColors.whiteColor,
  onSecondary: AppColors.whiteColor,
  onBackground: AppColors.whiteColor,
  onSurface: AppColors.blackColor,
  onError: AppColors.whiteColor,
  brightness: Brightness.light,
  inversePrimary:  AppColors.cobaltBlue,
);

