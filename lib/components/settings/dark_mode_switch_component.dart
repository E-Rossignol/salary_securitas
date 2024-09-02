import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/theme/theme_provider.dart';

/// The `DarkModeSwitchComponent` class represents a widget that allows the user to switch between dark and light modes.
///
/// It extends `StatefulWidget`, meaning it can maintain state that might change during the lifetime of the widget.
///
/// The class provides a `build` method that returns a `SwitchListTile` widget. When this `SwitchListTile` is toggled, it calls the `_saveThemePreference` function to save the user's preference and updates the `_isDarkMode` state.
class DarkModeSwitchComponent extends StatefulWidget {
  const DarkModeSwitchComponent({super.key});

  @override
  _DarkModeSwitchComponentState createState() =>
      _DarkModeSwitchComponentState();
}

/// The `_DarkModeSwitchComponentState` class represents the state of the `DarkModeSwitchComponent` widget.
///
/// It extends `State<DarkModeSwitchComponent>`, meaning it holds the mutable state for the `DarkModeSwitchComponent` widget.
///
/// The class provides a `build` method that returns a `SwitchListTile` widget. When this `SwitchListTile` is toggled, it calls the `_saveThemePreference` function to save the user's preference and updates the `_isDarkMode` state.
class _DarkModeSwitchComponentState extends State<DarkModeSwitchComponent> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _getDarkModePreference();
  }

  /// The `_getDarkModePreference` function retrieves the user's dark mode preference from shared preferences.
  ///
  /// If the shared preferences do not contain a 'isDarkMode' key, it initializes the `_isDarkMode` state with `false`.
  _getDarkModePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = (prefs.getBool('isDarkMode')) ?? false;
    setState(() {
      _isDarkMode = isDarkMode;
    });
  }

  /// The `_saveThemePreference` function saves the user's dark mode preference to shared preferences.
  ///
  /// It takes one parameter: `value`, which is a `bool` representing the user's preference.
  _saveThemePreference(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', value);
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        'darkMode'.tr,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      secondary: Icon(_isDarkMode ? Icons.nightlight : Icons.wb_sunny),
      value: _isDarkMode,
      selected: _isDarkMode,
      onChanged: (bool value) {
        Provider.of<ThemeProvider>(context, listen: false).setDarkMode(value);
        setState(() {
          _isDarkMode = value;
        });
        _saveThemePreference(_isDarkMode);
      },
    );
  }
}
