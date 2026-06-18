import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/theme/theme_provider.dart';

/// Switch component to toggle dark mode.
///
/// The selection is persisted to SharedPreferences and applied via ThemeProvider.
class DarkModeSwitchComponent extends StatefulWidget {
  const DarkModeSwitchComponent({super.key});

  @override
  _DarkModeSwitchComponentState createState() =>
      _DarkModeSwitchComponentState();
}

class _DarkModeSwitchComponentState extends State<DarkModeSwitchComponent> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _getDarkModePreference();
  }

  /// Retrieve 'isDarkMode' from SharedPreferences and update state.
  /// @return Future<void> completes when preference read and state set
  _getDarkModePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDarkMode = (prefs.getBool('isDarkMode')) ?? false;
    setState(() {
      _isDarkMode = isDarkMode;
    });
  }

  /// Save theme preference to SharedPreferences.
  /// @param value boolean to save
  /// @return Future<void>
  _saveThemePreference(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', value);
  }

  /// Build the SwitchListTile controlling dark mode.
  /// @param context BuildContext
  /// @return Widget
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
        // Apply theme immediately through provider and persist the choice.
        Provider.of<ThemeProvider>(context, listen: false).setDarkMode(value);
        setState(() {
          _isDarkMode = value;
        });
        _saveThemePreference(_isDarkMode);
      },
    );
  }
}
