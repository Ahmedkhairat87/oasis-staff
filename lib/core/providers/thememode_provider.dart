import 'package:flutter/material.dart';
import 'package:oasisstaff/core/reusable_components/prefsHelper.dart';

class ThemeModeProvider extends ChangeNotifier{
  ThemeMode currentTheme = ThemeMode.light;

  initTheme(){
   bool startupDarkMode = PrefsHelper.getThemeMode();
   if(startupDarkMode == true){
     currentTheme = ThemeMode.dark;
   } else {
     currentTheme = ThemeMode.light;
   }
  }

  changeTheme(ThemeMode newThemeMode){
    currentTheme = newThemeMode;
    if(currentTheme == ThemeMode.dark){
      PrefsHelper.setThemeMode(true);
    } else {
      PrefsHelper.setThemeMode(false);
    }
    notifyListeners();
  }
}