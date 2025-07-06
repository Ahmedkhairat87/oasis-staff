import 'package:flutter/material.dart';
import 'colors_manager.dart';

class AppStyle {
  //LIGHT THEME STARTS HERE
  static ThemeData lightTheme = ThemeData(

    ////COLORS STARTS HERE
    scaffoldBackgroundColor: ColorsManager.lightBackGround,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      primary: ColorsManager.lightPrimaryColor,
      onPrimary: ColorsManager.lightOnPrimaryColor,
      secondary: ColorsManager.lightSecondaryColor,
      tertiary: ColorsManager.lightTertiaryColor,
      onSurface: ColorsManager.lightGrey,
    ),
    ////COLORS ENDS HERE

    useMaterial3: true,
    appBarTheme:AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),

    ////TEXT THEME STARTS HERE
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    ////TEXT THEME ENDS HERE

  );
  //LIGHT THEME ENDS HERE

  ///////////////////////

  //DARK THEME STARTS HERE
  static ThemeData darkTheme = ThemeData(

    ////COLORS STARTS HERE
    scaffoldBackgroundColor: ColorsManager.darkBackGround,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue,
      primary: ColorsManager.darkPrimaryColor,
      onPrimary: ColorsManager.darkOnPrimaryColor,
      secondary: ColorsManager.darkSecondaryColor,
      tertiary: ColorsManager.darkTertiaryColor,
      onSurface: ColorsManager.darkGrey,
    ),
    ////COLORS ENDS HERE

    useMaterial3: true,
    appBarTheme:AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
    ),

    ////TEXT THEME STARTS HERE
    textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    ////TEXT THEME ENDS HERE

  );
//LIGHT THEME ENDS HERE
}