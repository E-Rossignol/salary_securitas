import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/theme/theme_provider.dart';

class ThemeSelectionComponent extends StatelessWidget {
  const ThemeSelectionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final values = ['blue', 'green', 'orange', 'purple', 'red'];
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red
    ];
    return ListTile(
        leading: Icon(Icons.palette,
            color: Theme.of(context).colorScheme.onPrimaryContainer),
        title: const Text('Select Theme'),
        onTap: () {
          showDialog(
              context: context,
              builder: (builder) {
                return AlertDialog(
                    title: const Text('Select Theme'),
                    content: SizedBox(
                        width: double.minPositive,
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: GestureDetector(
                                    onTap: () async {
                                      await themeProvider
                                          .changeTheme(values[index]);
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.setString(
                                          'theme', values[index]);
                                      Navigator.of(context).pop();
                                    },
                                    child: IconButton(
                                        icon: const Icon(Icons.palette),
                                        color: colors.elementAt(index),
                                        onPressed: () async {
                                          await themeProvider
                                              .changeTheme(values[index]);
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          await prefs.setString(
                                              'theme', values[index]);
                                          Navigator.of(context).pop();
                                        })),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider();
                            },
                            itemCount: values.length)));
              });
        });
  }
}
