import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'themes/theme.dart';

/// The `ThemeProvider` class provides a way to manage the application's theme.
///
/// It extends `ChangeNotifier`, meaning it can notify its listeners when the theme changes.
///
/// The class provides a `themeData` getter to get the current theme, and a `setDarkMode` method to change the theme.
///
/// The `setDarkMode` method takes a boolean `darkMode` as a parameter. If `darkMode` is true, it sets the theme to dark, otherwise it sets the theme to light. After changing the theme, it notifies its listeners.
class ThemeProvider with ChangeNotifier {
  MaterialTheme materialTheme = MaterialTheme(ThemeData.light().textTheme);
  ThemeData dark = MaterialTheme(ThemeData.light().textTheme).blue();
  ThemeData light = MaterialTheme(ThemeData.light().textTheme).blueDark();
  ThemeData _themeData = MaterialTheme(ThemeData.light().textTheme).blue();

  /// Creates an instance of `ThemeProvider`.
  ///
  /// It takes an optional boolean `isDarkMode` as a parameter which defaults to false. If `isDarkMode` is true, it initializes the theme to dark, otherwise it initializes the theme to light.
  ThemeProvider({bool isDarkMode = false}) {
    _themeData = isDarkMode ? dark : light;
    SharedPreferences.getInstance().then((prefs) {
      final themeName = prefs.getString('theme');
      if (themeName != null) {
        changeTheme(themeName);
      } else {
        changeTheme('');
      }
    });
  }

  /// Returns the current theme.
  ThemeData get themeData => _themeData;

  /// Changes the theme.
  ///
  /// It takes a boolean `darkMode` as a parameter. If `darkMode` is true, it sets the theme to dark, otherwise it sets the theme to light. After changing the theme, it notifies its listeners.
  Future<void> setDarkMode(bool darkMode) async {
    if (darkMode) {
      _themeData = dark;
    } else {
      _themeData = light;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', darkMode);
    notifyListeners();
  }

  Future<void> changeTheme(String themeName) async {
    switch (themeName) {
      case 'blue':
        light = MaterialTheme(ThemeData.light().textTheme).blue();
        dark = MaterialTheme(ThemeData.light().textTheme).blueDark();
        _themeData = MaterialTheme(ThemeData.light().textTheme).blue();
        break;
      case 'green':
        light = MaterialTheme(ThemeData.light().textTheme).green();
        dark = MaterialTheme(ThemeData.light().textTheme).greenDark();
        _themeData = MaterialTheme(ThemeData.light().textTheme).green();
        break;
      case 'orange':
        light = MaterialTheme(ThemeData.light().textTheme).orange();
        dark = MaterialTheme(ThemeData.light().textTheme).orangeDark();
        _themeData = MaterialTheme(ThemeData.light().textTheme).orange();
        break;
      case 'purple':
        light = MaterialTheme(ThemeData.light().textTheme).purple();
        dark = MaterialTheme(ThemeData.light().textTheme).purpleDark();
        _themeData = MaterialTheme(ThemeData.light().textTheme).purple();
        break;
      case 'red':
        light = MaterialTheme(ThemeData.light().textTheme).red();
        dark = MaterialTheme(ThemeData.light().textTheme).redDark();
        _themeData = MaterialTheme(ThemeData.light().textTheme).red();
        break;
      default:
        light = MaterialTheme(ThemeData.light().textTheme).blue();
        dark = MaterialTheme(ThemeData.light().textTheme).blueDark();
        _themeData = MaterialTheme(ThemeData.light().textTheme).blue();
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', themeName);
    setDarkMode(prefs.getBool('darkMode') ?? false);
    notifyListeners();
  }
}
