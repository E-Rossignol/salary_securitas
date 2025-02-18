import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
/// The `DarkModeSwitchComponent` class represents a widget that allows the user to switch between dark and light modes.
///
/// It extends `StatefulWidget`, meaning it can maintain state that might change during the lifetime of the widget.
///
/// The class provides a `build` method that returns a `SwitchListTile` widget. When this `SwitchListTile` is toggled, it calls the `_saveThemePreference` function to save the user's preference and updates the `_isDarkMode` state.
class UpdateSalaryPerHourComponent extends StatefulWidget {
  const UpdateSalaryPerHourComponent({super.key});

  @override
  _UpdateSalaryPerHourComponentState createState() =>
      _UpdateSalaryPerHourComponentState();
}

/// The `_DarkModeSwitchComponentState` class represents the state of the `DarkModeSwitchComponent` widget.
///
/// It extends `State<DarkModeSwitchComponent>`, meaning it holds the mutable state for the `DarkModeSwitchComponent` widget.
///
/// The class provides a `build` method that returns a `SwitchListTile` widget. When this `SwitchListTile` is toggled, it calls the `_saveThemePreference` function to save the user's preference and updates the `_isDarkMode` state.
class _UpdateSalaryPerHourComponentState extends State<UpdateSalaryPerHourComponent> {
  double _salaryPerHour = 25.92;

  @override
  void initState() {
    super.initState();
    _getSalaryPerHourPreference();
  }

  _getSalaryPerHourPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double salaryPerHour = (prefs.getDouble('salaryPerHour')) ?? 25.92;
    setState(() {
      _salaryPerHour = salaryPerHour;
    });
  }

  _saveSalaryPerHourPreference(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('salaryPerHour', value);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          Icons.attach_money),
      title: Text(
        'salary_change'.tr,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      onTap: () {
        buildDialog(context);
      },
    );
  }

  void buildDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text(
              'salary_change'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Enter salary per hour',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _salaryPerHour = double.parse(value);
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    setState(() {
                      _saveSalaryPerHourPreference(_salaryPerHour);
                    });
                    Get.snackbar("Salary", "Salary updated to $_salaryPerHour.-/h");
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          );
        });
  }
}