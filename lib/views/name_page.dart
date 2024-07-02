import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:salary_securitas/models/user_secu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/auth.dart';
import '../database/service_db.dart';

class NamePage extends StatefulWidget {
  final String _email;
  final String _password;
  NamePage({super.key, required String email, required String password})
      : _email = email,
        _password = password;

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  int yearsWorked = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('enter_your_name'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'first_name'.tr,
              ),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'last_name'.tr,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('I\'ve been working for Securitas for '),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black26),
                    ),
                    child: NumberPicker(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.onBackground,
                            width: 2),
                      ),
                      minValue: 0,
                      maxValue: 50,
                      value: yearsWorked,
                      onChanged: (int value) {
                        setState(() => yearsWorked = value);
                      },
                    ),
                  ),
                  Text(' years'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                double salaryPerHours = 0;
                switch (yearsWorked) {
                  case 0:
                    salaryPerHours = 23;
                    break;
                  case 1:
                    salaryPerHours = 23.5;
                    break;
                  case 2:
                    salaryPerHours = 24;
                    break;
                  case 3:
                    salaryPerHours = 24.5;
                    break;
                  case 4:
                    salaryPerHours = 25;
                    break;
                  case 5:
                    salaryPerHours = 25.5;
                    break;
                }
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setDouble('salaryPerHour', salaryPerHours);
                storeName(_firstNameController.text, _lastNameController.text);
              },
              child: Text('validate'.tr),
            ),
          ],
        ),
      ),
    );
  }

  void storeName(String firstName, String lastName) async {
    await Auth().createUserWithEmailAndPassword(
        email: widget._email, password: widget._password);
    UserSecu user = UserSecu(
      id: 0,
      userID: FirebaseAuth.instance.currentUser!.uid,
      firstName: firstName,
      lastName: lastName,
    );
    ServiceDB db = ServiceDB();
    db.createName(user);
    Navigator.of(context).pop();
  }
}
