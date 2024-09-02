import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salary_securitas/auth/auth.dart';
import 'package:salary_securitas/views/login_register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The `LogOutComponent` class represents a widget that allows the user to log out of the application.
///
/// It extends `StatefulWidget`, meaning it can maintain state that might change during the lifetime of the widget.
///
/// The class provides a `build` method that returns a `ListTile` widget. When this `ListTile` is tapped, it shows a dialog asking the user to confirm if they want to leave the app.
class LogOutComponent extends StatefulWidget {
  const LogOutComponent({super.key});

  @override
  LogOutComponentState createState() => LogOutComponentState();
}

/// The `_LogOutComponent` class represents the state of the `LogOutComponent` widget.
///
/// It extends `State<LogOutComponent>`, meaning it holds the mutable state for the `LogOutComponent` widget.
///
/// The class provides a `build` method that returns a `ListTile` widget. When this `ListTile` is tapped, it shows a dialog asking the user to confirm if they want to leave the app.
class LogOutComponentState extends State<LogOutComponent> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.logout, color: Theme.of(context).colorScheme.onPrimary),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  'logOutSure'.tr),
              actions: <Widget>[
                ElevatedButton(
                    onPressed: () async {
                      await Auth().signOut();
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.remove('email');
                      prefs.remove('password');
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage()));
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
    );
  }
}
