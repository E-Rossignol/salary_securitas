import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The `ChangeLanguageComponent` class represents a widget that allows the user to change the language of the application.
///
/// It extends `StatefulWidget`, meaning it can maintain state that might change during the lifetime of the widget.
///
/// The class provides a `build` method that returns a `ListTile` widget. When this `ListTile` is tapped, it calls the `buildDialog` function to show a dialog with a list of available languages.
class ChangeLanguageComponent extends StatefulWidget {
  const ChangeLanguageComponent({super.key});

  @override
  _ChangeLanguageComponent createState() => _ChangeLanguageComponent();
}

/// The `_ChangeLanguageComponent` class represents the state of the `ChangeLanguageComponent` widget.
///
/// It extends `State<ChangeLanguageComponent>`, meaning it holds the mutable state for the `ChangeLanguageComponent` widget.
///
/// The class provides a `build` method that returns a `ListTile` widget. When this `ListTile` is tapped, it calls the `buildDialog` function to show a dialog with a list of available languages.
class _ChangeLanguageComponent extends State<ChangeLanguageComponent> {
  final List locale = [
    {'name': 'Français', 'locale': const Locale('fr')},
    {'name': 'English', 'locale': const Locale('en')},
    {'name': 'Italiano', 'locale': const Locale('it')},
    {'name': 'Deutsch', 'locale': const Locale('de')},
    {'name': 'Español', 'locale': const Locale('es')},
  ];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          Icons.language),
      title: Text(
        'languageChange'.tr,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      onTap: () {
        buildDialog(context, locale);
      },
    );
  }
}

/// The `buildDialog` function shows a dialog with a list of available languages.
///
/// It takes two parameters: `context` and `locale`. `context` is the `BuildContext` object representing the location in the widget tree. `locale` is a list of available languages.
///
/// When a language is selected, it calls the `_updateLanguage` function to update the language of the application.
void buildDialog(BuildContext context, List locale) {
  showDialog(
      context: context,
      builder: (builder) {
        return AlertDialog(
          title: Text(
            'languageChange'.tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          content: SizedBox(
              width: double.minPositive,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () {
                            _updateLanguage(locale[index]['locale']);
                          },
                          child: Text(
                            locale[index]['name'],
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                            textAlign: TextAlign.center,
                          )),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: locale.length)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'close'.tr,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ],
          actionsAlignment: MainAxisAlignment.end,
        );
      });
}

/// The `_updateLanguage` function updates the language of the application.
///
/// It takes one parameter: `locale`, which is the `Locale` object representing the selected language.
///
/// It uses the `Get` package to update the locale of the application.
void _updateLanguage(Locale locale) {
  Get.back();
  Get.updateLocale(locale);
}
