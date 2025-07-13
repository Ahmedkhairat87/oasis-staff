import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors_manager.dart';

class AppStyle {
  static bool isDark = false;

  /// LIGHT THEME
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: ColorsManager.lightBackGround,
    cardColor: ColorsManager.cardColor,

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: ColorsManager.lightPrimaryColor,
      onPrimary: ColorsManager.lightOnPrimaryColor,
      secondary: ColorsManager.lightSecondaryColor,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: ColorsManager.cardColor,
      onSurface: ColorsManager.lightGrey,
      tertiary: ColorsManager.lightTertiaryColor,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      foregroundColor: ColorsManager.lightOnPrimaryColor,
    ),

    iconTheme: const IconThemeData(
      color: ColorsManager.lightPrimaryColor,
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.lightOnPrimaryColor,
      ),
      labelMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.lightOnPrimaryColor,
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.lightGrey,
      ),
      displaySmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.lightPrimaryColor,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.lightPrimaryColor,
        foregroundColor: ColorsManager.lightWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    ),
  );

  /// DARK THEME
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: ColorsManager.darkBackGround,
    cardColor: ColorsManager.darkCardColor,

    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: ColorsManager.darkPrimaryColor,
      onPrimary: ColorsManager.darkOnPrimaryColor,
      secondary: ColorsManager.darkSecondaryColor,
      onSecondary: Colors.black,
      error: Colors.red,
      onError: Colors.black,
      surface: ColorsManager.darkCardColor,
      onSurface: ColorsManager.darkGrey,
      tertiary: ColorsManager.darkTertiaryColor,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      foregroundColor: ColorsManager.darkOnPrimaryColor,
    ),

    iconTheme: const IconThemeData(
      color: ColorsManager.darkPrimaryColor,
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.darkOnPrimaryColor,
      ),
      labelMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: ColorsManager.darkOnPrimaryColor,
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.darkGrey,
      ),
      displaySmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.darkPrimaryColor,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.darkPrimaryColor,
        foregroundColor: ColorsManager.darkWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    ),
  );
}