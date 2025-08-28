import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../constants/helper.dart';
import '../models/appointment.dart';
import 'main_page.dart';

class CopyServicePage extends StatefulWidget {
  final Appointment app;
  const CopyServicePage({super.key, required this.app});

  @override
  State<CopyServicePage> createState() => _CopyServicePageState();
}

class _CopyServicePageState extends State<CopyServicePage> {
  Set<DateTime> _selectedDates = {};
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Select dates to copy', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            TableCalendar(
              locale: Get.locale?.languageCode,
              firstDay: DateTime(2020),
              lastDay: DateTime(2100),
              focusedDay: widget.app.start,
              selectedDayPredicate: (day) => _selectedDates.any((d) => isSameDay(d, day)),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                  if (_selectedDates.any((d) => isSameDay(d, selectedDay))) {
                    _selectedDates.removeWhere((d) => isSameDay(d, selectedDay));
                  } else {
                    _selectedDates.add(selectedDay);
                  }
                });
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: colors.primary,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: colors.secondary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _selectedDates.isEmpty
                  ? null
                  : () {
                      for (var date in _selectedDates) {
                        Helper.copyApp(date, widget.app);
                      }
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MainPage()),
                      );
                    },
              child: Text('Validate'),
            ),
          ],
        ),
      ),
    );
  }
}
