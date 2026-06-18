import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Component to update the default per-hour salary.
///
/// Opens a dialog to input a new value and persists it to SharedPreferences.
class UpdateSalaryPerHourComponent extends StatefulWidget {
  const UpdateSalaryPerHourComponent({super.key});

  @override
  _UpdateSalaryPerHourComponentState createState() =>
      _UpdateSalaryPerHourComponentState();
}

class _UpdateSalaryPerHourComponentState
    extends State<UpdateSalaryPerHourComponent> {
  double _salaryPerHour = 25.92;

  @override
  void initState() {
    super.initState();
    _getSalaryPerHourPreference();
  }

  /// Retrieve saved salary per hour from SharedPreferences and update state.
  /// @return Future<void>
  _getSalaryPerHourPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double salaryPerHour = (prefs.getDouble('salaryPerHour')) ?? 25.92;
    setState(() {
      _salaryPerHour = salaryPerHour;
    });
  }

  /// Save the salary per hour to SharedPreferences.
  /// @param value the salary per hour to persist
  /// @return Future<void>
  _saveSalaryPerHourPreference(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('salaryPerHour', value);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        Icons.attach_money,
      ),
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

  /// Show dialog to input salary per hour. Input is parsed to double and persisted.
  /// @param context BuildContext used to show the dialog
  /// @return void
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
                    // Simple conversion; caller should ensure valid numeric input.
                    _salaryPerHour = double.parse(value);
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Close dialogs and persist the new value.
                  Navigator.pop(context);
                  Navigator.pop(context);
                  setState(() {
                    _saveSalaryPerHourPreference(_salaryPerHour);
                  });
                  Get.snackbar(
                    "Salary",
                    "Salary updated to $_salaryPerHour.-/h",
                  );
                },
                child: const Text('Save'),
              ),
            ],
          ),
        );
      },
    );
  }
}
