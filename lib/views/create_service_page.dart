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
import 'package:shared_preferences/shared_preferences.dart';

class CreateServicePage extends StatefulWidget {
  final DateTime day;

  const CreateServicePage({super.key, required this.day});

  @override
  State<CreateServicePage> createState() => _CreateServicePageState(day);
}

class _CreateServicePageState extends State<CreateServicePage> {
  late DateTime defaultDay;
  TimeOfDay defaultStartTime = const TimeOfDay(hour: 6, minute: 0);
  TimeOfDay defaultEndTime = const TimeOfDay(hour: 14, minute: 0);
  String dropdownValue = 'no'.tr;
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
    setDefaultTimes();
  }

  Future<void> setDefaultTimes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    TimeOfDay startTime = TimeOfDay(
        hour: prefs.getInt('default_start_hour') ?? 6,
        minute: prefs.getInt('default_start_minute') ?? 0);
    TimeOfDay endTime = TimeOfDay(
        hour: prefs.getInt('default_end_hour') ?? 14,
        minute: prefs.getInt('default_end_minute') ?? 0);
    setState(() {
      defaultStartTime = startTime;
      defaultEndTime = endTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text('create_service'.tr),
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
                              InputDecoration(labelText: 'start_date'.tr),
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
                                startMonth = date.month;
                                startDay = date.day;
                              });
                            }
                            return date;
                          },
                        ),
                      ),
                      Expanded(
                        child: DateTimeField(
                          format: timeFormat,
                          decoration:
                              InputDecoration(labelText: 'start_hour'.tr),
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
                          initialValue: defaultDay,
                          decoration: InputDecoration(labelText: 'end_date'.tr),
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
                            return date;
                          },
                        ),
                      ),
                      Expanded(
                        child: DateTimeField(
                          format: timeFormat,
                          decoration: InputDecoration(labelText: 'end_hour'.tr),
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
                    Text('order_service?'.tr),
                    DropdownButton<String>(
                      value: dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['yes'.tr, 'no'.tr]
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
                      if (DateTime(defaultDay.year, endMonth, endDay, endHour,
                              endMinute)
                          .isBefore(DateTime(defaultDay.year, startMonth,
                              startDay, startHour, startMinute))) {
                        Helper.snackbar(
                            'error'.tr, 'end_date_before_start_date'.tr);
                        return;
                      }
                      if (DateTime(defaultDay.year, endMonth, endDay, endHour,
                                  endMinute)
                              .difference(DateTime(defaultDay.year, startMonth,
                                  startDay, startHour, startMinute))
                              .inHours >=
                          14) {
                        Helper.snackbar('error'.tr, 'date_error'.tr);
                        return;
                      }
                      Appointment app = Appointment(
                          id: 0,
                          start: start,
                          end: end,
                          isOrderService:
                              dropdownValue == 'yes'.tr ? true : false);
                      await ServiceDB().create(app);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()));
                    },
                    child: Text('validate'.tr))
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
