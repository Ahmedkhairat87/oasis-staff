import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static late final SharedPreferences prefs;


  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void setThemeMode(bool isDarkMode) {
    prefs.setBool("isDark", isDarkMode);
  }

  static bool getThemeMode() {
    return prefs.getBool("isDark") ?? false;
  }
}