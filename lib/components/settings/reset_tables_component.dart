import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/helper.dart';
import '../../database/service_db.dart';
import '../../views/main_page.dart';

/// Component that resets database tables.
///
/// Shows a confirmation dialog and calls ServiceDB.resetTables(). After reset, navigates to main page.
class ResetTablesComponent extends StatefulWidget {
  const ResetTablesComponent({super.key});

  @override
  ResetTablesComponentState createState() => ResetTablesComponentState();
}

class ResetTablesComponentState extends State<ResetTablesComponent> {
  /// Build the ListTile that triggers a reset dialog.
  /// @param context BuildContext
  /// @return Widget
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        Icons.reset_tv_outlined,
      ),
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
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              content: Text('Are you sure you want to reset the tables?'),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    ServiceDB db = ServiceDB();
                    bool success = await db.resetTables();
                    // Display a snackbar summarizing the result.
                    if (success) {
                      Helper.snackbar('Success', 'Tables reseted');
                    } else {
                      Helper.snackbar('Error', 'Could not reset tables');
                    }
                    // Navigate to main page after resetting.
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  },
                  child: Text('yes'.tr),
                ),
                ElevatedButton(
                  child: Text('no'.tr),
                  onPressed: () {
                    Navigator.of(context).pop();
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
