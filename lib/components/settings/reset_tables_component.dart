import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/helper.dart';
import '../../database/service_db.dart';
import '../../views/main_page.dart';

/// The `LogOutComponent` class represents a widget that allows the user to log out of the application.
///
/// It extends `StatefulWidget`, meaning it can maintain state that might change during the lifetime of the widget.
///
/// The class provides a `build` method that returns a `ListTile` widget. When this `ListTile` is tapped, it shows a dialog asking the user to confirm if they want to leave the app.
class ResetTablesComponent extends StatefulWidget {
  const ResetTablesComponent({super.key});

  @override
  ResetTablesComponentState createState() => ResetTablesComponentState();
}

/// The `_LogOutComponent` class represents the state of the `LogOutComponent` widget.
///
/// It extends `State<LogOutComponent>`, meaning it holds the mutable state for the `LogOutComponent` widget.
///
/// The class provides a `build` method that returns a `ListTile` widget. When this `ListTile` is tapped, it shows a dialog asking the user to confirm if they want to leave the app.
class ResetTablesComponentState extends State<ResetTablesComponent> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}
