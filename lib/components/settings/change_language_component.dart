import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Component that shows a language change option.
///
/// Tapping opens a dialog with available languages. Selected locale is applied globally.
class ChangeLanguageComponent extends StatefulWidget {
  const ChangeLanguageComponent({super.key});

  @override
  _ChangeLanguageComponent createState() => _ChangeLanguageComponent();
}

/// État associé au composant de changement de langue.
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
        Icons.language,
      ),
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

/// Show the language selection dialog.
/// @param context BuildContext used to show the dialog
/// @param locale list of maps with keys 'name' and 'locale'
/// @return void
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
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: locale.length,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'close'.tr,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
        actionsAlignment: MainAxisAlignment.end,
      );
    },
  );
}

/// Update application locale using Get.
/// @param locale Locale to apply globally
/// @return void
void _updateLanguage(Locale locale) {
  // Close dialog then update global locale.
  Get.back();
  Get.updateLocale(locale);
}
