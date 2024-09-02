import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salary_securitas/models/user_secu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/auth.dart';
import '../database/service_db.dart';
import 'main_page.dart';

class NamePage extends StatefulWidget {
  final String _email;
  final String _password;

  const NamePage({super.key, required String email, required String password})
      : _email = email,
        _password = password;

  @override
  NamePageState createState() => NamePageState();
}

class NamePageState extends State<NamePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('enter_your_name'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: 'first_name'.tr,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: 'last_name'.tr,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: _salaryController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.info_outline),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Information'),
                              content: Text('where_is_salary'.tr),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    labelText: 'salaire horaire'.tr,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setDouble(
                        'salaryPerHour', double.parse(_salaryController.text));
                    storeName(
                        _firstNameController.text, _lastNameController.text);
                  },
                  child: Text('validate'.tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void storeName(String firstName, String lastName) async {
    ServiceDB db = ServiceDB();
    UserSecu user = UserSecu(
        id: 0, email: widget._email, firstName: firstName, lastName: lastName);
    await db.createName(user);
    await Auth().createUserWithEmailAndPassword(
        email: widget._email, password: widget._password);
    if (mounted) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainPage()));
    }
  }
}
