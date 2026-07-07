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

/// Settings view page containing application settings widgets.
///
/// @param isLoginPage boolean indicating whether this settings view is opened from login
/// @param isDebug boolean enabling debug-only features in the UI
class SettingsView extends StatefulWidget {
  final bool isLoginPage;
  final bool isDebug;
  const SettingsView({
    super.key,
    required this.isLoginPage,
    required this.isDebug,
  });

  @override
  SettingsViewState createState() => SettingsViewState();
}

/// State for SettingsView handling god mode initialization and dialogs.
class SettingsViewState extends State<SettingsView> {
  bool isGodMod = false;

  @override
  void initState() {
    super.initState();
    initGodMod();
  }

  /// Initialize the 'godMod' flag from SharedPreferences.
  /// @return Future<void>
  Future<void> initGodMod() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isGodMod = prefs.getBool('godMod') ?? false;
    });
  }

  /// Show a dialog to enable God Mod with a numeric code.
  /// On success the flag is stored in SharedPreferences.
  /// @return void
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
                  bool? godMod = await SharedPreferences.getInstance().then(
                    (prefs) => prefs.getBool('godMod'),
                  );
                  if (godMod == null || !godMod) {
                    Helper.snackbar('God Mod', 'God Mod activated, have fun !');
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('godMod', true);
                  } else {
                    Helper.snackbar('God Mod', 'God Mod deactivated !');
                    await SharedPreferences.getInstance().then(
                      (prefs) => prefs.setBool('godMod', false),
                    );
                    setState(() {
                      isGodMod = false;
                    });
                  }
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

  /// Build the settings page containing multiple setting components.
  /// @param context BuildContext
  /// @return Widget
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
                      builder: (context) => const HumantechPage(),
                    ),
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
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text('settings'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: widgets),
      ),
    );
  }
}
