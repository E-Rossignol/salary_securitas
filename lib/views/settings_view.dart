import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salary_securitas/components/settings/change_language_component.dart';
import 'package:salary_securitas/components/settings/dark_mode_switch_component.dart';
import 'package:salary_securitas/components/settings/fast_services_component.dart';
import 'package:salary_securitas/components/settings/theme_selection_widget.dart';

import '../constants/helper.dart';
import '../database/service_db.dart';
import 'main_page.dart';

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
  const SettingsView({super.key, required this.isLoginPage, required this.isDebug});

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoginPage = widget.isLoginPage;
    bool isDebug = widget.isDebug;
    List<Widget> widgets = (!isLoginPage && isDebug) ?
    [
        DarkModeSwitchComponent(),
        ChangeLanguageComponent(),
        ThemeSelectionComponent(),
        FastServicesComponent(),
        ListTile(
          leading: Icon(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              Icons.reset_tv_outlined),
          title: Text(
            'Reset tables',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'Reset tables',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .onPrimaryContainer,
                    ),
                  ),
                  content: Text('Are you sure you want to reset the tables?'),
                  actions: <Widget>[
                    ElevatedButton(
                        onPressed: () async {
                          ServiceDB db = ServiceDB();
                          bool success = await db.resetTables();
                          if (success) {
                            Helper.snackbar('Success', 'Tables reseted');
                          } else {
                            Helper.snackbar('Error', 'Could not reset tables');
                          }
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const MainPage()));
                        },
                        child: Text('yes'.tr)),
                    ElevatedButton(
                      child: Text('no'.tr),
                      onPressed: () {
                        Navigator.of(context).pop(); // Dismiss the dialog
                      },
                    ),
                  ],
                  actionsAlignment: MainAxisAlignment.spaceEvenly,
                );
              },
            );
          },
        )
    ] : [
      DarkModeSwitchComponent(),
      ChangeLanguageComponent(),
      ThemeSelectionComponent(),
    ];
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
