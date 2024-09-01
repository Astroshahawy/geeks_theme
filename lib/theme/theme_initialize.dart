import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String themeKey = 'theme';

class ThemeInitialize {
  ThemeInitialize._();
  static late SharedPreferences sharedPreferences;
  static ThemeInitialize? _instance;

  static Future<ThemeInitialize> get instance async {
    if (_instance == null) {
      sharedPreferences = await SharedPreferences.getInstance();
      _instance = ThemeInitialize._();
    }
    return _instance!;
  }

 static Future<void> saveTheme(ThemeMode themeMode) async {
    await sharedPreferences.setString(themeKey, '$themeMode');
  }

  static ThemeMode? getCurrentTheme() {
    String? themeName = sharedPreferences.getString(themeKey);
    if (themeName == null) {
      return WidgetsBinding.instance.window.platformBrightness ==
              Brightness.light
          ? ThemeMode.light
          : ThemeMode.dark;
    }
    switch (themeName) {
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.system':
        return ThemeMode.system;
      default:
        return null;
    }
  }
}
