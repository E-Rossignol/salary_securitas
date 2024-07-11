import 'package:flutter/material.dart';
import '../../views/update_name_page.dart';

/// The `LogOutComponent` class represents a widget that allows the user to log out of the application.
///
/// It extends `StatefulWidget`, meaning it can maintain state that might change during the lifetime of the widget.
///
/// The class provides a `build` method that returns a `ListTile` widget. When this `ListTile` is tapped, it shows a dialog asking the user to confirm if they want to leave the app.
class EditUserComponent extends StatefulWidget {
  final String email;
  const EditUserComponent({super.key, required this.email});

  @override
  EditUserComponentState createState() => EditUserComponentState();
}

/// The `_LogOutComponent` class represents the state of the `LogOutComponent` widget.
///
/// It extends `State<LogOutComponent>`, meaning it holds the mutable state for the `LogOutComponent` widget.
///
/// The class provides a `build` method that returns a `ListTile` widget. When this `ListTile` is tapped, it shows a dialog asking the user to confirm if they want to leave the app.
class EditUserComponentState extends State<EditUserComponent> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            Icons.people_outline_rounded),
        title: Text(
          'Edit profile',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UpdateNamePage(email: widget.email)));
        }
    );
  }
}
