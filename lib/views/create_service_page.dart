import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:salary_securitas/database/service_db.dart';
import 'package:salary_securitas/models/appointment.dart';
import 'package:salary_securitas/views/main_page.dart';
import '../constants/helper.dart';
import '../constants/theme/theme_provider.dart';

class CreateServicePage extends StatefulWidget {
  final DateTime day;

  CreateServicePage({super.key, required this.day});

  @override
  State<CreateServicePage> createState() => _CreateServicePageState(day);
}

class _CreateServicePageState extends State<CreateServicePage> {
  late DateTime defaultDay;
  TimeOfDay defaultStartTime = const TimeOfDay(hour: 19, minute: 0);
  TimeOfDay defaultEndTime = const TimeOfDay(hour: 03, minute: 0);
  String dropdownValue = 'Yes';
  final dateFormat = DateFormat("MM/dd");
  final timeFormat = DateFormat("HH:mm");
  DateTime start = DateTime(2000);
  DateTime end = DateTime(2000);
  late int startMonth,
      startDay,
      startHour,
      startMinute,
      endMonth,
      endDay,
      endHour,
      endMinute;

  _CreateServicePageState(DateTime day) {
    defaultDay = DateTime(day.year, day.month, day.day, defaultStartTime.hour,
        defaultStartTime.minute);
    startMonth = defaultDay.month;
    startDay = defaultDay.day;
    startHour = defaultDay.hour;
    startMinute = defaultDay.minute;
    endMonth = defaultDay.add(const Duration(hours: 8)).month;
    endDay = defaultDay.add(const Duration(hours: 8)).day;
    endHour = defaultDay.add(const Duration(hours: 8)).hour;
    endMinute = defaultDay.add(const Duration(hours: 8)).minute;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            backgroundColor: Theme.of(context).colorScheme.background,
            title: const Text('Create Service'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: DateTimeField(
                          format: dateFormat,
                          initialValue: defaultDay,
                          decoration:
                              const InputDecoration(labelText: 'Start Date'),
                          onShowPicker: (context, currentValue) async {
                            final date = await showDatePicker(
                                context: context,
                                initialEntryMode:
                                    DatePickerEntryMode.calendarOnly,
                                firstDate: DateTime(2020),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                            if (date != null) {
                              setState(() {
                                startMonth = date.month;
                                startDay = date.day;
                              });
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: DateTimeField(
                          format: timeFormat,
                          decoration: InputDecoration(labelText: 'Start Hour'),
                          onShowPicker: (context, currentValue) async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                  currentValue ??
                                      DateTime(
                                          defaultDay.year,
                                          defaultDay.month,
                                          defaultDay.day,
                                          defaultStartTime.hour,
                                          defaultStartTime.minute)),
                            );
                            if (time != null) {
                              setState(() {
                                startHour = time.hour;
                                startMinute =
                                    getClosestValidMinute(time.minute);
                              });
                            }
                            return DateTimeField.convert(time);
                          },
                        ),
                      ),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: DateTimeField(
                          format: dateFormat,
                          initialValue: defaultDay.add(const Duration(days: 1)),
                          decoration:
                              const InputDecoration(labelText: 'End Date'),
                          onShowPicker: (context, currentValue) async {
                            final date = await showDatePicker(
                                context: context,
                                initialEntryMode:
                                    DatePickerEntryMode.calendarOnly,
                                firstDate: DateTime(2020),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                            if (date != null) {
                              setState(() {
                                endMonth = date.month;
                                endDay = date.day;
                              });
                            }
                            return null;
                          },
                        ),
                      ),
                      Expanded(
                        child: DateTimeField(
                          format: timeFormat,
                          decoration:
                              const InputDecoration(labelText: 'End Hour'),
                          onShowPicker: (context, currentValue) async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                  currentValue ??
                                      DateTime(
                                          defaultDay.year,
                                          defaultDay.month,
                                          defaultDay.day,
                                          defaultEndTime.hour,
                                          defaultEndTime.minute)),
                            );
                            if (time != null) {
                              setState(() {
                                endHour = time.hour;
                                endMinute = getClosestValidMinute(time.minute);
                              });
                            }
                            return DateTimeField.convert(time);
                          },
                        ),
                      ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Is this an order service?'),
                    DropdownButton<String>(
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['Yes', 'No']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        start = DateTime(defaultDay.year, startMonth, startDay,
                            startHour, startMinute);
                        end = DateTime(defaultDay.year, endMonth, endDay,
                            endHour, endMinute);
                      });
                      if (end.isBefore(start)) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('End date must be after start date'),
                          duration: Duration(seconds: 2),
                        ));
                        return;
                      }
                      if (end.difference(start).inHours >= 24) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('There is a date error'),
                          duration: Duration(seconds: 2),
                        ));
                      }
                      Appointment app = Appointment(
                          id: 0,
                          start: start,
                          end: end,
                          isOrderService: dropdownValue == 'Yes' ? true : false,
                          user: FirebaseAuth.instance.currentUser!.uid);
                      await ServiceDB().create(app);
                      Navigator.of(context)
                          .push(Helper.switchPages(const MainPage()));
                    },
                    child: Text('Validate'))
              ],
            ),
          ),
        );
      },
    );
  }

  int getClosestValidMinute(int minute) {
    if (minute >= 0 && minute < 15) {
      return 0;
    } else if (minute >= 15 && minute < 30) {
      return 15;
    } else if (minute >= 30 && minute < 45) {
      return 30;
    } else {
      return 45;
    }
  }
}
