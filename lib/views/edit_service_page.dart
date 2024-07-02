import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:salary_securitas/database/service_db.dart';
import 'package:salary_securitas/models/appointment.dart';
import 'package:salary_securitas/views/main_page.dart';
import '../constants/helper.dart';
import '../constants/theme/theme_provider.dart';

class EditServicePage extends StatefulWidget {
  final Appointment app;

  EditServicePage({super.key, required this.app});

  @override
  State<EditServicePage> createState() => _EditServicePageState(app);
}

class _EditServicePageState extends State<EditServicePage> {
  late DateTime defaultDay;
  TimeOfDay startTime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 0, minute: 0);
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

  _EditServicePageState(Appointment app) {
    dropdownValue = app.isOrderService ? 'Yes' : 'No';
    defaultDay = app.start;
    startMonth = app.start.month;
    startDay = app.start.day;
    startHour = app.start.hour;
    startMinute = app.start.minute;
    endMonth = app.end.month;
    endDay = app.end.day;
    endHour = app.end.hour;
    endMinute = app.end.minute;
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
            title: Text('Edit Service'),
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
                          initialValue: widget.app.start,
                          decoration:
                              const InputDecoration(labelText: 'Start Date'),
                          onShowPicker: (context, currentValue) async {
                            final date = await showDatePicker(
                                locale: const Locale('fr', 'FR'),
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
                          initialValue: widget.app.start,
                          decoration: InputDecoration(labelText: 'Start Hour'),
                          onShowPicker: (context, currentValue) async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                  currentValue ?? widget.app.start),
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
                          initialValue: widget.app.end,
                          decoration: InputDecoration(labelText: 'End Date'),
                          onShowPicker: (context, currentValue) async {
                            final date = await showDatePicker(
                                locale: Get.locale,
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
                          initialValue: widget.app.end,
                          decoration:
                              const InputDecoration(labelText: 'End Hour'),
                          onShowPicker: (context, currentValue) async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                  currentValue ?? widget.app.end),
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
                    Text('Is this an order service?'),
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
                      Appointment newApp = Appointment(
                          id: widget.app.id,
                          start: start,
                          end: end,
                          isOrderService: dropdownValue == 'Yes',
                          user: widget.app.user);
                      await ServiceDB().update(newApp.id, newApp);
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
