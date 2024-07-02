import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/helper.dart';
import '../models/appointment.dart';
import 'main_page.dart';

class CopyServicePage extends StatefulWidget {
  final Appointment _app;
  const CopyServicePage({super.key, required Appointment app}) : _app = app;

  @override
  _CopyServicePageState createState() => _CopyServicePageState(_app);
}

class _CopyServicePageState extends State<CopyServicePage> {
  late DateTime _selectedDate;

  _CopyServicePageState(app) {
    _selectedDate = app.start;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        locale: Get.locale,
        initialDate: widget._app.start, // Initially selected date
        firstDate: DateTime(2020), // Earliest date the user can pick
        lastDate: DateTime(2100), // Latest date the user can pick
      );
      if (picked != null) {
        setState(() => _selectedDate = picked);
        Helper.copyApp(_selectedDate, widget._app);
      }
      Navigator.of(context).push(Helper.switchPages(const MainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
