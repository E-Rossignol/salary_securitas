import 'package:salary_securitas/auth/auth.dart';
import 'package:salary_securitas/views/main_page.dart';
import 'package:salary_securitas/views/login_register_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainPage()));
            });
            return const MainPage();
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            });
            return const LoginPage();
          }
        });
  }
}
