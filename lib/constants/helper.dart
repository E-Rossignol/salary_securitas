import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../database/service_db.dart';
import '../models/service.dart';
import '../models/appointment.dart';

class Helper {
  static String toNiceString(DateTime date) {
    String minuteStr = date.minute < 10 ? '0${date.minute}' : '${date.minute}';
    String hourStr = date.hour < 10 ? '0${date.hour}' : '${date.hour}';
    return '$hourStr:$minuteStr';
  }

  static String niceDateStr(DateTime date) {
    String dayStr = date.day < 10 ? '0${date.day}' : '${date.day}';
    String monthStr = month(date.month);
    return '$dayStr $monthStr ';
  }

  static String niceYearDateStr(DateTime date) {
    String yearStr = date.year.toString();
    String monthStr = month(date.month);
    return '$monthStr $yearStr';
  }

  static Future<double> getBrutSalary(List<Appointment> apps) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double salaryPerHour = prefs.getDouble('salaryPerHour') ?? 25;
    double salary = 0;
    for (Appointment app in apps) {
      double minutes = 0;
      minutes += app.end.difference(app.start).inMinutes;
      minutes += nightMinutes(app.start, app.end) / 10;
      minutes += sundayMinutes(app.start, app.end) / 10;
      salary += minutes * salaryPerHour / 60;
    }
    return salary;
  }

  static double getHours(List<Appointment> app) {
    double hours = 0;
    for (Appointment a in app) {
      hours += a.end.difference(a.start).inMinutes / 60;
    }
    return hours;
  }

  static Future<List<double>> getNetSalary(List<Appointment> apps) async {
    double brut = await getBrutSalary(apps);
    double hours = getHours(apps);
    return [brut * 0.91333, hours];
  }

  static int nightMinutes(DateTime start, DateTime end) {
    int counter = 0;
    for (int i = 0; i <= end.difference(start).inMinutes; i++) {
      final DateTime current = start.add(Duration(minutes: i));
      if ((current.hour >= 23 && current.hour < 24) ||
          (current.hour >= 0 && current.hour < 5)) {
        counter++;
      }
    }
    return counter;
  }

  static int sundayMinutes(DateTime start, DateTime end) {
    int counter = 0;
    for (int i = 0; i <= end.difference(start).inMinutes; i++) {
      final DateTime current = start.add(Duration(minutes: i));
      if (current.weekday == DateTime.sunday) {
        counter++;
      }
    }
    return counter;
  }

  static String month(int month) {
    switch (month) {
      case 1:
        return 'january'.tr;
      case 2:
        return 'february'.tr;
      case 3:
        return 'march'.tr;
      case 4:
        return 'april'.tr;
      case 5:
        return 'may'.tr;
      case 6:
        return 'june'.tr;
      case 7:
        return 'july'.tr;
      case 8:
        return 'august'.tr;
      case 9:
        return 'september'.tr;
      case 10:
        return 'october'.tr;
      case 11:
        return 'november'.tr;
      case 12:
        return 'december'.tr;
      default:
        return 'Unknown';
    }
  }

  static Map<DateTime, List<Appointment>> getEventsFromAppointments(
      List<Appointment> appointments) {
    Map<DateTime, List<Appointment>> kEvents = {};
    for (var appointment in appointments) {
      final eventDate = DateTime(appointment.start.year,
          appointment.start.month, appointment.start.day);
      if (kEvents.containsKey(eventDate)) {
        kEvents[eventDate]!.add(appointment);
      } else {
        kEvents[eventDate] = [appointment];
      }
    }
    return kEvents;
  }

  static List<Appointment> toAppointmentList(List<Service> services) {
    List<Appointment> appointments = [];
    for (Service service in services) {
      appointments.add(Appointment(
          id: service.id,
          start: DateTime(DateTime.now().year)
              .add(Duration(minutes: service.start)),
          end:
              DateTime(DateTime.now().year).add(Duration(minutes: service.end)),
          isOrderService: service.isOrderService == 1,
          user: service.user));
    }
    return appointments;
  }

  static List<Service> toServiceList(List<Appointment> appointments) {
    List<Service> services = [];
    for (Appointment appointment in appointments) {
      services.add(Service(
          id: appointment.id,
          start: (appointment.start)
              .difference(DateTime(DateTime.now().year))
              .inMinutes,
          end: (appointment.end)
              .difference(DateTime(DateTime.now().year))
              .inMinutes,
          isOrderService: appointment.isOrderService ? 1 : 0,
          user: appointment.user));
    }
    return services;
  }

  static Future<void> copyApp(DateTime copyDate, Appointment app) async {
    final newStartDate = DateTime(copyDate.year, copyDate.month, copyDate.day,
        app.start.hour, app.start.minute);
    final newEndDate = newStartDate.add(app.end.difference(app.start));
    final newApp = Appointment(
      id: 0,
      start: newStartDate,
      end: newEndDate,
      isOrderService: app.isOrderService,
      user: app.user,
    );
    ServiceDB db = ServiceDB();
    db.create(newApp);
  }

  static PageRouteBuilder switchPages(Widget newPage) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => newPage,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: animation.drive(tween),
            child: child,
          ),
        );
      },
    );
  }
}
