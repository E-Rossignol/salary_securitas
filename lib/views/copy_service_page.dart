import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
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
  final Set<DateTime> _selectedDates = {};
  late DateTime _focusedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.app.start;
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TableCalendar(
              locale: Get.locale?.languageCode,
              firstDay: DateTime(2020),
              lastDay: DateTime(2100),
              startingDayOfWeek: StartingDayOfWeek.monday,
              focusedDay: _focusedDay,
              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextFormatter: (date, locale) {
                  final loc = locale ?? Get.locale?.languageCode ?? 'en';
                  final formatted = DateFormat.yMMMM(loc).format(date);
                  if (formatted.isEmpty) return formatted;
                  return formatted[0].toUpperCase() + formatted.substring(1);
                },
              ),
              availableCalendarFormats: { CalendarFormat.month: 'month'.tr},
              selectedDayPredicate: (day) => _selectedDates.any((d) => isSameDay(d, day)),
              calendarStyle: CalendarStyle(
                isTodayHighlighted: false,
                selectedDecoration: BoxDecoration(
                  color: colors.primary,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  // keep as fallback
                  color: colors.secondary,
                  shape: BoxShape.circle,
                ),
              ),
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  if (isSameDay(day, widget.app.start)) {
                    return Container(
                      decoration: BoxDecoration(
                        color: colors.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: TextStyle(color: colors.onPrimary),
                        ),
                      ),
                    );
                  }
                  return null; // fallback to default rendering
                },
                selectedBuilder: (context, day, focusedDay) {
                  return Container(
                    decoration: BoxDecoration(
                      color: colors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: TextStyle(color: colors.onPrimary),
                      ),
                    ),
                  );
                },
              ),
              onDaySelected: (selectedDay, focusedDay) {
                final currentFocused = _focusedDay;
                setState(() {
                  if (_selectedDates.any((d) => isSameDay(d, selectedDay))) {
                    _selectedDates.removeWhere((d) => isSameDay(d, selectedDay));
                  } else {
                    if (isSameDay(selectedDay, widget.app.start)) {
                      // Prevent selecting the original date
                      return;
                    }
                    _selectedDates.add(selectedDay);
                  }
                  // réaffecte explicitement la focalisation précédente pour éviter tout recentrage
                  _focusedDay = currentFocused;
                });
              },
              onPageChanged: (focusedDay) {
                // Allow user to navigate months without changing focus when selecting days
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _selectedDates.isEmpty
                  ? null
                  : () {
                      for (var date in _selectedDates) {
                        Helper.copyApp(date, widget.app);
                      }
                      var earlierDate = _selectedDates.reduce((a, b) => a.isBefore(b) ? a : b);
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage(initialDate: earlierDate,)),
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
