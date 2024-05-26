//
// import 'package:clean_archtecture/core/utils/constants.dart';
// import 'package:flutter/material.dart';
//
// import '../../base/theme_base.dart';
// import '../app_pallet.dart';
//
//
// class AppLightTheme extends AppCustomTheme {
//
//   AppLightTheme() : super(Brightness.light);
//
//   @override
//   final ColorScheme colorScheme = ColorScheme.light(
//       primary: AppColors.whiteColor,
//       onPrimary: AppColors.romanSilver,
//       onSurface: AppColors.greyColor.withOpacity(0.1),
//       surface: AppColors.whiteColor.withOpacity(0.9),
//       secondary: AppColors.blackColor,
//       onSecondary: AppColors.whiteColor,
//       primaryContainer: AppColors.blueColor,
//       onPrimaryContainer: AppColors.whiteColor,
//       errorContainer: AppColors.kuCrimson,
//       onErrorContainer: AppColors.darkBlueColor,
//       inversePrimary: AppColors.darkRedColor,
//       tertiary: AppColors.blackColor,
//       scrim: AppColors.blueColor,
//       surfaceTint: AppColors.blueColor
//   );
//
//   @override
//   ThemeData getTheme() => ThemeData(
//       scaffoldBackgroundColor: colorScheme.surface,
//       appBarTheme: AppBarTheme(
//         backgroundColor: colorScheme.surface,
//         centerTitle: true,
//         titleTextStyle: TextStyle(
//             color: colorScheme.secondary,
//             fontWeight: FontWeight.w500,
//             fontSize: 20),
//         iconTheme: IconThemeData(color: colorScheme.primary),
//       ),
//       brightness: brightness,
//       visualDensity: VisualDensity.standard,
//       colorScheme: colorScheme,
//       dialogBackgroundColor:colorScheme.primary,
//       fontFamily: AppFontsConstants.poppins,
//       textTheme: textTheme(),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: colorScheme.scrim,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(5),
//           ),
//           visualDensity: const VisualDensity(
//             vertical: -4,
//             horizontal: -4,
//           ),
//           padding: EdgeInsets.zero,
//         ),
//       ),
//       outlinedButtonTheme: OutlinedButtonThemeData(
//         style: OutlinedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           side: BorderSide(
//             color: colorScheme.onSurface.withOpacity(0.9),
//             width: 1,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(4),
//           ),
//           visualDensity: const VisualDensity(
//             vertical: -4,
//             horizontal: -4,
//           ),
//           padding: EdgeInsets.zero,
//         ),
//       ),
//       // radioTheme: RadioThemeData(
//       //   fillColor: WidgetStateColor.resolveWith((states) {
//       //     if (states.contains(WidgetState.selected)) {
//       //       return colorScheme.primary;
//       //     }
//       //     return colorScheme.onSurface;
//       //   }),
//       //   visualDensity: const VisualDensity(
//       //     vertical: -4,
//       //     horizontal: -4,
//       //   ),
//       // ),
//       dividerTheme: DividerThemeData(
//         thickness: 23,
//         space: 23,
//         color: AppColors.greyColor.withOpacity(0.5),
//       ),
//       tabBarTheme: TabBarTheme(
//         indicatorColor: colorScheme.secondary,
//         labelPadding: EdgeInsets.zero,
//         labelColor: colorScheme.secondary,
//         unselectedLabelColor: colorScheme.secondary.withOpacity(0.6),
//         unselectedLabelStyle: TextStyle(
//           color: colorScheme.secondary,
//           fontSize: 14,
//           fontFamily: AppFontsConstants.poppins,
//         ),
//         labelStyle: TextStyle(
//           color: colorScheme.secondary,
//           fontSize: 14,
//           fontFamily: AppFontsConstants.poppins,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       // dropdownMenuTheme: DropdownMenuThemeData(
//       //   menuStyle: MenuStyle(
//       //     backgroundColor: WidgetStateColor.resolveWith((states) {
//       //       if (states.contains(WidgetState.selected)) {
//       //         return colorScheme.tertiary;
//       //       }
//       //       return colorScheme.tertiary;
//       //     }),
//       //     surfaceTintColor: WidgetStateColor.resolveWith((states) {
//       //       if (states.contains(WidgetState.selected)) {
//       //         return colorScheme.tertiary;
//       //       }
//       //       return colorScheme.tertiary;
//       //     }),
//       //   ),
//       // )
//   );
//
//   @override
//   TextTheme textTheme() => TextTheme(
//     bodyLarge: TextStyle(
//       color: colorScheme.secondary,
//       fontSize: 18,
//       fontFamily: AppFontsConstants.poppins,
//       fontWeight: FontWeight.w700,
//     ),
//     bodyMedium: TextStyle(
//       color: colorScheme.secondary,
//       fontSize: 14,
//       fontFamily: AppFontsConstants.poppins,
//       fontWeight: FontWeight.w500,
//     ),
//     bodySmall: TextStyle(
//       color: colorScheme.secondary,
//       fontSize: 12,
//       fontFamily: AppFontsConstants.poppins,
//       fontWeight: FontWeight.w400,
//     ),
//     titleLarge: TextStyle(
//       color: colorScheme.secondary,
//       fontSize: 18,
//       fontFamily: AppFontsConstants.poppins,
//       fontWeight: FontWeight.w700,
//     ),
//     titleMedium: TextStyle(
//       color: colorScheme.secondary,
//       fontSize: 16,
//       fontFamily: AppFontsConstants.poppins,
//       fontWeight: FontWeight.w400,
//     ),
//     titleSmall: TextStyle(
//       color: colorScheme.secondary,
//       fontSize: 12,
//       fontFamily: AppFontsConstants.poppins,
//       fontWeight: FontWeight.w700,
//     ),
//     headlineLarge: TextStyle(
//       color: colorScheme.onPrimary,
//       fontSize: 26,
//       fontFamily: AppFontsConstants.poppins,
//       fontWeight: FontWeight.w700,
//     ),
//     headlineMedium: TextStyle(
//       color: colorScheme.onPrimary,
//       fontSize: 18,
//       fontFamily: AppFontsConstants.poppins,
//       fontWeight: FontWeight.w500,
//     ),
//     headlineSmall: TextStyle(
//       color: colorScheme.onPrimary,
//       fontSize: 14,
//       fontFamily: AppFontsConstants.poppins,
//       fontWeight: FontWeight.w300,
//     ),
//     labelLarge: TextStyle(
//       color: colorScheme.secondary,
//       fontSize: 12,
//       fontFamily: AppFontsConstants.poppins,
//       fontWeight: FontWeight.w600,
//     ),
//     labelMedium: TextStyle(
//       color: colorScheme.secondary,
//       fontSize: 14,
//       fontFamily: AppFontsConstants.poppins,
//       fontWeight: FontWeight.w500,
//     ),
//     labelSmall: TextStyle(
//       color: colorScheme.secondary,
//       fontSize: 10,
//       fontFamily: AppFontsConstants.poppins,
//       fontWeight: FontWeight.w600,
//     ),
//     displayLarge: TextStyle(
//       color: colorScheme.errorContainer,
//       fontSize: 18,
//       fontFamily: AppFontsConstants.poppins,
//       fontWeight: FontWeight.w700,
//       overflow: TextOverflow.ellipsis,
//     ),
//     displayMedium: TextStyle(
//       color: colorScheme.errorContainer,
//       fontSize: 16,
//       fontFamily: AppFontsConstants.poppins,
//       fontWeight: FontWeight.w500,
//       overflow: TextOverflow.ellipsis,
//     ),
//     displaySmall: TextStyle(
//         color: colorScheme.errorContainer,
//         fontSize: 14,
//         fontFamily: AppFontsConstants.poppins,
//         fontWeight: FontWeight.w400,
//         overflow: TextOverflow.ellipsis
//     ),
//   );
// }