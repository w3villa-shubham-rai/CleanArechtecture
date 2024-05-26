import 'package:clean_archtecture/core/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class AppTheme  {

  // ++++++++++++++++Outlineboreded manage code++++++++++++

  static _border({Color? color}){
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? AppColors.borderColor, width: 3),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    );
  }

// +++++++++++++++++++Theme Managae Starting Here+++++++++++++++

  static final darkThemeMode = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.backgroundColor,
      // ++++++input Decoration part+++++++
      inputDecorationTheme:  InputDecorationTheme(
        contentPadding: const EdgeInsets.all(27),
        enabledBorder: _border(),
        disabledBorder: _border(),
        focusedBorder: _border(color: AppColors.gradient2),
        errorBorder:  _border(color: AppColors.errorColor),
        focusedErrorBorder:  _border(color: AppColors.errorColor),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.backgroundColor
      )
  );


  // ++++++++++++++++++++++++++++ Light  mode handle Here ++++++++++++++++++++++

  static final lightThemeMode = ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColors.whiteColor,
      // ++++++input Decoration part+++++++
      inputDecorationTheme:  InputDecorationTheme(
        contentPadding: const EdgeInsets.all(27),
        enabledBorder: _border(),
        disabledBorder: _border(),
        focusedBorder: _border(color: AppColors.gradient2),
        errorBorder:  _border(color: AppColors.errorColor),
        focusedErrorBorder:  _border(color: AppColors.errorColor),
      ),
      hintColor: AppColors.backgroundColor

  );
}
