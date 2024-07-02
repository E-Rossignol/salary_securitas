import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:salary_securitas/database/service_db.dart';
import 'package:salary_securitas/models/appointment.dart';
import 'package:salary_securitas/models/user_secu.dart';
import 'package:salary_securitas/views/settings_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/auth.dart';
import '../constants/theme/theme_provider.dart';
import 'name_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage;
  bool isLogin = true;
  bool _isPasswordHidden = true;
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void initState() {
    setPreferences();
    super.initState();
  }

  void setPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _controllerEmail.text = prefs.getString('email') ?? '';
    _controllerPassword.text = prefs.getString('password') ?? '';
  }

  Future<bool> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _controllerEmail.text, password: _controllerPassword.text);
      return true;
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
      return false;
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NamePage(
                email: _controllerEmail.text,
                password: _controllerPassword.text)));
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  Widget _entryField(String title, TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? _isPasswordHidden : false,
      decoration: InputDecoration(
        labelText: title,
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(_isPasswordHidden
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: _togglePasswordVisibility,
              )
            : null,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(
      errorMessage ?? '',
    );
  }

  Future<Widget> _submitButton() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return ElevatedButton(
      onPressed: () async {
        bool isAlreadyIn = await signInWithEmailAndPassword();
        if (!isLogin && isAlreadyIn) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Email already registered'),
            duration: Duration(seconds: 1),
          ));
          return;
        } else {
          prefs.setString('email', _controllerEmail.text);
          prefs.setString('password', _controllerPassword.text);
          isLogin
              ? signInWithEmailAndPassword()
              : createUserWithEmailAndPassword();
        }
      },
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(isLogin ? 'Register' : 'Login',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface)));
  }

  Future<Widget> _showTables() async {
    return ElevatedButton(
        child: const Text('Show tables'),
        onPressed: () async {
          List<dynamic> tables = await getTables();
          List<Appointment> apps = tables.first;
          List<UserSecu> names = tables.last;
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Tables'),
                  content: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SingleChildScrollView(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Appointments:'),
                            for (var app in apps)
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                          'User: ${app.user.substring(0, 4)}'),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                          'Start: ${app.start.toString()}'),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text('End: ${app.end.toString()}'),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        )),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Names:'),
                              for (var name in names)
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                            'UserID: ${name.userID.substring(0, 4)}'),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                            'NAME: ${name.firstName} ${name.lastName}'),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Close'))
                  ],
                );
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: AppBar(backgroundColor: colors.primary, actions: [
            Builder(
                builder: (context) => IconButton(
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      icon: Icon(
                        color: colors.onPrimary,
                        Icons.settings,
                      ),
                    )),
          ]),
          endDrawer: Drawer(
            backgroundColor: colors.background,
            child: const SettingsView(),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    // Adjust the radius as needed
                    child: Image.asset(
                      themeProvider.themeData.brightness == Brightness.dark
                          ? 'lib/images/black_dollar_dark.png'
                          : 'lib/images/black_dollar.png',
                      height: 150,
                      width: 150,
                    ),
                  ),
                  FutureBuilder<Widget>(
                    future: _showTables(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return snapshot.data!;
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                  _entryField('Email', _controllerEmail),
                  _entryField('Password', _controllerPassword,
                      isPassword: true),
                  _errorMessage(),
                  FutureBuilder(
                      future: _submitButton(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!;
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
                  _loginOrRegisterButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<List> getTables() async {
    ServiceDB db = ServiceDB();
    return await db.getTables();
  }
}
