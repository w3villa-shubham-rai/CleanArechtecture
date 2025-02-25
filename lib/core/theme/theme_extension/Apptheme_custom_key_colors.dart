import 'package:flutter/material.dart';

@immutable
class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color gradient1;
  final Color gradient2;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color firstCardBackGroundColor;
  final Color secondCardBackGroundColor;

  const AppThemeColors({
    required this.gradient1,
    required this.gradient2,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.firstCardBackGroundColor,
    required this.secondCardBackGroundColor,
  });

  @override
  AppThemeColors copyWith({
    Color? gradient1,
    Color? gradient2,
    Color? backgroundColor,
    Color? borderColor,
    Color? textColor,
    Color? firstCardBackGroundColor,
    Color? secondCardBackGroundColor,
  }) {
    return AppThemeColors(
      gradient1: gradient1 ?? this.gradient1,
      gradient2: gradient2 ?? this.gradient2,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      textColor: textColor ?? this.textColor,
      firstCardBackGroundColor: firstCardBackGroundColor ?? this.firstCardBackGroundColor,
      secondCardBackGroundColor: secondCardBackGroundColor?? this.secondCardBackGroundColor
    );
  }

  @override
  AppThemeColors lerp(AppThemeColors? other, double t) {
    if (other == null) return this;
    return AppThemeColors(
        gradient1: Color.lerp(gradient1, other.gradient1, t)!,
        gradient2: Color.lerp(gradient2, other.gradient2, t)!,
        backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
        borderColor: Color.lerp(borderColor, other.borderColor, t)!,
        textColor: Color.lerp(textColor, other.textColor, t)!,
        firstCardBackGroundColor: Color.lerp(firstCardBackGroundColor, other.firstCardBackGroundColor, t)!,
        secondCardBackGroundColor:Color.lerp(secondCardBackGroundColor, other.secondCardBackGroundColor, t)!
    );
  }
}
