import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:salary_securitas/database/database_service.dart';
import 'package:salary_securitas/views/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/locale/locale_string.dart';
import 'constants/theme/theme_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// Application entry point: initialize DB, load preferences and start the app.
/// @return Future<void> completes when initialization is done and app is started.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseService databaseService = DatabaseService();
  await databaseService.database;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // Provide ThemeProvider with persisted initial value.
          create: (context) => ThemeProvider(isDarkMode: isDarkMode),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

/// Root widget using GetMaterialApp, localization and provided theme.
/// @param context BuildContext provided by framework
/// @return Widget the root application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocaleString(),
      locale: const Locale('fr', 'FR'),
      home: const MainPage(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
