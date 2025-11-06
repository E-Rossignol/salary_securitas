import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salary_securitas/components/settings/change_default_time_component.dart';
import 'package:salary_securitas/components/settings/change_language_component.dart';
import 'package:salary_securitas/components/settings/dark_mode_switch_component.dart';
import 'package:salary_securitas/components/settings/fast_services_component.dart';
import 'package:salary_securitas/components/settings/reset_tables_component.dart';
import 'package:salary_securitas/components/settings/theme_selection_widget.dart';
import 'package:salary_securitas/views/humantech_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/settings/update_per_hour_salary_component.dart';
import '../constants/helper.dart';

/// The `SettingsView` class represents the settings view of the application.
///
/// It extends `StatefulWidget` to create a mutable state for this widget.
///
/// The class provides a `build` method which returns a `Scaffold` widget.
/// The `Scaffold` widget has an `AppBar` with a title `Text` widget that displays 'Settings'.
/// The body of the `Scaffold` is a `Padding` widget that contains a `ListView` with `DarkModeSwitchComponent`, `ChangeLanguageComponent`, and `LogOutComponent` components.
class SettingsView extends StatefulWidget {
  final bool isLoginPage;
  final bool isDebug;
  const SettingsView(
      {super.key, required this.isLoginPage, required this.isDebug});

  @override
  SettingsViewState createState() => SettingsViewState();
}

/// The `_SettingsViewState` class represents the mutable state for the `SettingsView` widget.
///
/// It extends `State<SettingsView>` to create a mutable state for the `SettingsView` widget.
///
/// The class provides a `build` method which returns a `Scaffold` widget.
/// The `Scaffold` widget has an `AppBar` with a title `Text` widget that displays 'Settings'.
/// The body of the `Scaffold` is a `Padding` widget that contains a `ListView` with `DarkModeSwitchComponent`, `ChangeLanguageComponent`, and `LogOutComponent` components.
class SettingsViewState extends State<SettingsView> {
  bool isGodMod = false;

  @override
  void initState() {
    super.initState();
    initGodMod();
  }

  Future<void> initGodMod() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isGodMod = prefs.getBool('godMod') ?? false;
    });
  }

  void _showGodModDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();
        return AlertDialog(
          title: Text('God Mod'),
          content: TextField(
            controller: controller,
            obscureText: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter numeric code"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Submit'),
              onPressed: () async {
                if (controller.text == '2563') {
                  setState(() {
                    isGodMod = true;
                  });
                  Helper.snackbar('God Mod', 'God Mod activated, have fun !');
                  SharedPreferences prefs =
                  await SharedPreferences.getInstance();
                  prefs.setBool('godMod', true);
                } else {
                  Helper.snackbar('Error', 'U don\'t deserve it !');
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isLoginPage = widget.isLoginPage;
    bool isDebug = widget.isDebug;
    List<Widget> widgets = [];
    widgets.add(const DarkModeSwitchComponent());
    widgets.add(const UpdateSalaryPerHourComponent());
    widgets.add(const ChangeDefaultTimeComponent());
    widgets.add(const ChangeLanguageComponent());
    widgets.add(const ThemeSelectionComponent());
    if (!isLoginPage) {
      widgets.add(
        ListTile(
          leading: const Icon(Icons.password),
          title: const Text('God Mod'),
          onTap: _showGodModDialog,
        ),
      );
      if (isDebug) {
        widgets.add(const FastServicesComponent());
        widgets.add(const ResetTablesComponent());
        if (isGodMod) {
          setState(() {
            widgets.add(
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HumantechPage()),
                  );
                },
                child: Text('Humantech'),
              ),
            );
          });
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('settings'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: widgets,
        ),
      ),
    );
  }
}
