import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:salary_securitas/database/service_db.dart';
import 'package:salary_securitas/views/settings_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/auth.dart';
import '../constants/helper.dart';
import '../constants/theme/theme_provider.dart';
import '../models/user_secu.dart';
import 'main_page.dart';
import 'name_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool godMod = false;
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
    setState(() {
      _controllerEmail.text = prefs.getString('email') ?? '';
      _controllerPassword.text = prefs.getString('password') ?? '';
    });
    await signInWithEmailAndPassword();
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
                  password: _controllerPassword.text,
                )));
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  Widget _entryField(String title, TextEditingController controller, {bool isPassword = false}) {
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

  Widget _space() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
    );
  }

  Widget _title(){
    return Text(
      'SECURITHUNES',
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
        fontSize: 40,
        fontFamily: 'Batman',
      ),
    );
  }

  void goToMainPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  void goToNamePage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NamePage(
                  email: _controllerEmail.text,
                  password: _controllerPassword.text,
                )));
  }

  Future<bool> hasName() async {
    ServiceDB db = ServiceDB();
    UserSecu user = await db.getName(_controllerEmail.text);
    return user.id != -1;
  }

  Future<Widget> _submitButton() async {
    return ElevatedButton(
      onPressed: () async {
        bool registered = await hasName();
        if (isLogin){
          if(registered) {
            signInWithEmailAndPassword();
          } else {
            setState(() {
            errorMessage = 'not_registered'.tr;
          });
            return;
          }
        }
        else {
          if(!registered){
            goToNamePage();
          }
          else {
            setState(() {
              errorMessage = 'email_already_exists'.tr;
            });
          }
        }
      },
      child: Text(isLogin ? 'logIn'.tr : 'register'.tr),
    );
  }

  Widget _justLogIn() {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            _controllerEmail.text = 'erwan@hotmail.ch';
            _controllerPassword.text = 'testtest';
          });
        },
        child: Text('Just fckin log me in',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface)));
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            isLogin = !isLogin;
          });
        },
        child: Text(isLogin ? 'register'.tr : 'logIn'.tr,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface)));
  }

  void _showGodModDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();
        return AlertDialog(
          title: Text('Enter God Mod Code'),
          content: TextField(
            controller: controller,
            obscureText: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter numeric code"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Submit'),
              onPressed: () async {
                if (controller.text == '2563') {
                  setState(() {
                    godMod = true;
                  });
                  Helper.snackbar('OH MY GOD', 'Hello Kratos !');
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setBool('godMod', true);
                } else {
                  Helper.snackbar('Error', 'U SUCK BITCH');
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _godModButton() {
    return ElevatedButton(
      onPressed: _showGodModDialog,
      child: Text('God Mod', style: TextStyle(color: Theme.of(context).colorScheme.secondary),)
    );
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
            child: SettingsView(isLoginPage: true, isDebug: godMod),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _space(),
                  _title(),
                  _space(),
                  if (godMod) {_justLogIn()}.first,
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
                  _space(),
                  _godModButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
