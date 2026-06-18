import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../database/service_db.dart';
import '../models/service.dart';
import '../models/appointment.dart';

/// Utility helper with formatting, salary calculation and conversion helpers.
///
/// Contains functions to format dates, compute gross/net salary, convert between
/// Service and Appointment models and interact with ServiceDB for copying and notifications.
class Helper {
  /// Return a HH:MM string for [date].
  /// @param date DateTime to format
  /// @return String formatted as HH:MM
  static String toNiceString(DateTime date) {
    String minuteStr = date.minute < 10 ? '0${date.minute}' : '${date.minute}';
    String hourStr = date.hour < 10 ? '0${date.hour}' : '${date.hour}';
    return '$hourStr:$minuteStr';
  }

  /// Return a "DD Month" string for [date], month localized via Get.
  /// @param date DateTime to format
  /// @return String formatted as "DD Month"
  static String niceDateStr(DateTime date) {
    String dayStr = date.day < 10 ? '0${date.day}' : '${date.day}';
    String monthStr = month(date.month);
    return '$dayStr $monthStr ';
  }

  /// Return a "Month Year" string for [date], month localized via Get.
  /// @param date DateTime to format
  /// @return String formatted as "Month Year"
  static String niceYearDateStr(DateTime date) {
    String yearStr = date.year.toString();
    String monthStr = month(date.month);
    return '$monthStr $yearStr';
  }

  /// Compute gross salary for given [apps] based on stored hourly rate and modifiers.
  ///
  /// If no salary is saved in SharedPreferences, a default of 25.92 is stored and used.
  /// @param apps list of Appointment to compute salary for
  /// @return Future<double> gross salary amount
  static Future<double> getBrutSalary(List<Appointment> apps) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double salaryPerHour;
    if (prefs.getDouble('salaryPerHour') == null) {
      prefs.setDouble('salaryPerHour', 25.92);
      salaryPerHour = 25.92;
    } else {
      salaryPerHour = prefs.getDouble('salaryPerHour') ?? 25.92;
    }
    double salary = 0;
    for (Appointment app in apps) {
      double isOrderSalary = app.isOrderService ? 1 : 0.9502;
      double minutes = 0;
      minutes += app.end.difference(app.start).inMinutes;
      // Add night and sunday minutes with business multiplier (here divided by 10 per original logic).
      minutes += nightMinutes(app.start, app.end) / 10;
      minutes += sundayMinutes(app.start, app.end) / 10;
      salary += minutes * salaryPerHour * isOrderSalary / 60;
    }
    return salary;
  }

  /// Sum total hours for [app] list.
  /// @param app list of Appointment
  /// @return double total hours
  static double getHours(List<Appointment> app) {
    double hours = 0;
    for (Appointment a in app) {
      hours += a.end.difference(a.start).inMinutes / 60;
    }
    return hours;
  }

  /// Return net salary and total hours as [gross * 0.91333, hours].
  /// @param apps list of Appointment to compute
  /// @return Future<List<double>> [netSalary, totalHours]
  static Future<List<double>> getNetSalary(List<Appointment> apps) async {
    double brut = await getBrutSalary(apps);
    double hours = getHours(apps);
    return [brut * 0.91333, hours];
  }

  /// Count minutes between [start] and [end] that fall into night window (23:00-05:00).
  ///
  /// This iterates minute by minute to match original business logic.
  /// @param start start DateTime
  /// @param end end DateTime
  /// @return int number of minutes in night window
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

  /// Count minutes between [start] and [end] that fall on Sundays.
  /// @param start start DateTime
  /// @param end end DateTime
  /// @return int minutes falling on Sundays
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

  /// Return localized month name for given [month] number using Get translations.
  /// @param month month number (1-12)
  /// @return String localized month name
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

  /// Group [appointments] by day into a Map<DateTime, List<Appointment>>.
  /// @param appointments list of appointments to group
  /// @return Map<DateTime, List<Appointment>> grouped by day
  static Map<DateTime, List<Appointment>> getEventsFromAppointments(
    List<Appointment> appointments,
  ) {
    Map<DateTime, List<Appointment>> kEvents = {};
    for (var appointment in appointments) {
      final eventDate = DateTime(
        appointment.start.year,
        appointment.start.month,
        appointment.start.day,
      );
      if (kEvents.containsKey(eventDate)) {
        kEvents[eventDate]!.add(appointment);
      } else {
        kEvents[eventDate] = [appointment];
      }
    }
    return kEvents;
  }

  /// Convert list of [Service] to list of [Appointment].
  ///
  /// Service stores start/end as minutes offset from start of the current year.
  /// @param services list of Service objects
  /// @return List<Appointment> converted appointments
  static List<Appointment> toAppointmentList(List<Service> services) {
    List<Appointment> appointments = [];
    for (Service service in services) {
      appointments.add(
        Appointment(
          id: service.id,
          start: DateTime(
            DateTime.now().year,
          ).add(Duration(minutes: service.start)),
          end: DateTime(
            DateTime.now().year,
          ).add(Duration(minutes: service.end)),
          isOrderService: service.isOrderService == 1,
        ),
      );
    }
    return appointments;
  }

  /// Convert list of [Appointment] to list of [Service].
  ///
  /// Service represents times as minutes offset from start of current year.
  /// @param appointments list of Appointment objects
  /// @return List<Service> converted services
  static List<Service> toServiceList(List<Appointment> appointments) {
    List<Service> services = [];
    for (Appointment appointment in appointments) {
      services.add(
        Service(
          id: appointment.id,
          start: (appointment.start)
              .difference(DateTime(DateTime.now().year))
              .inMinutes,
          end: (appointment.end)
              .difference(DateTime(DateTime.now().year))
              .inMinutes,
          isOrderService: appointment.isOrderService ? 1 : 0,
        ),
      );
    }
    return services;
  }

  /// Copy [app] onto [copyDate] (preserving duration) and persist via ServiceDB.
  /// @param copyDate target date to copy to (date component used)
  /// @param app Appointment to copy
  /// @return Future<void>
  static Future<void> copyApp(DateTime copyDate, Appointment app) async {
    final newStartDate = DateTime(
      copyDate.year,
      copyDate.month,
      copyDate.day,
      app.start.hour,
      app.start.minute,
    );
    final newEndDate = newStartDate.add(app.end.difference(app.start));
    final newApp = Appointment(
      id: 0,
      start: newStartDate,
      end: newEndDate,
      isOrderService: app.isOrderService,
    );
    ServiceDB db = ServiceDB();
    db.create(newApp);
  }

  /// Show a Get snackbar with [title] and [message].
  /// @param title snackbar title
  /// @param message snackbar message body
  /// @return void
  static void snackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      duration: Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
    );
  }
}
