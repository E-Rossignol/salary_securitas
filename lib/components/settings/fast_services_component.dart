import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salary_securitas/constants/helper.dart';
import '../../database/service_db.dart';
import '../../models/appointment.dart';
import '../../views/main_page.dart';

/// Component to quickly insert a set of predefined services.
///
/// Useful to populate the DB with example appointments for demo purposes.
class FastServicesComponent extends StatefulWidget {
  const FastServicesComponent({super.key});

  @override
  FastServicesComponentState createState() => FastServicesComponentState();
}

class FastServicesComponentState extends State<FastServicesComponent> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        Icons.fast_forward_outlined,
      ),
      title: Text(
        'Default Services',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                'Display example calendar ?',
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    await _fastServices();
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                    Helper.snackbar(
                      'Default calendar',
                      'Default calendar displayed for may, june and july',
                    );
                  },
                  child: Text('yes'.tr),
                ),
                ElevatedButton(
                  child: Text('no'.tr),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
              actionsAlignment: MainAxisAlignment.spaceEvenly,
            );
          },
        );
      },
    );
  }

  /// Parse strings like 'DD month HHhMM' into DateTime objects.
  /// NOTE: months are expected in French (mai, juin, juillet, aout, septembre).
  /// @param dates list of strings to parse
  /// @return List<DateTime> parsed DateTime objects
  List<DateTime> formatDate(List<String> dates) {
    List<DateTime> formattedDates = [];
    for (String date in dates) {
      DateTime formattedDate = DateTime(2026);
      List<String> words = date.split(' ');
      int days = int.parse(words[0]);
      int month = 0;
      // Map French month names to month numbers.
      switch (words[1]) {
        case "mai":
          month = 5;
          break;
        case "juin":
          month = 6;
          break;
        case "juillet":
          month = 7;
          break;
        case "aout":
          month = 8;
          break;
        case "septembre":
          month = 9;
          break;
        default:
          month = 1;
      }
      // Parse 'HHhMM' pattern.
      int hours = int.parse(words[2].split('h')[0]);
      int minutes = int.parse(words[2].split('h')[1]);
      formattedDate = DateTime(2026, month, days, hours, minutes);
      formattedDates.add(formattedDate);
    }
    return formattedDates;
  }

  /// Insert all predefined appointments into the database.
  /// @return Future<void> completes after all inserts have been performed.
  Future<void> _fastServices() async {
    List<Appointment> mayApp = _fastMayServices();
    List<Appointment> juneApp = _fastJuneServices();
    List<Appointment> julyApp = _fastJulyServices();
    List<Appointment> augustApp = _fastAugustServices();
    List<Appointment> allApp = [];
    allApp.addAll(mayApp);
    allApp.addAll(juneApp);
    allApp.addAll(julyApp);
    allApp.addAll(augustApp);
    ServiceDB db = ServiceDB();
    for (Appointment app in allApp) {
      await db.create(app);
    }
  }

  List<Appointment> _fastMayServices() {
    List<String> startDates = [
      '03 mai 19h00',
      '04 mai 19h00',
      '08 mai 21h00',
      '10 mai 23h00',
      '11 mai 23h00',
      '23 mai 13h00',
      '24 mai 23h00',
      '29 mai 19h00',
      '31 mai 22h30',
    ];
    List<String> endDates = [
      '04 mai 03h00',
      '05 mai 03h00',
      '09 mai 02h30',
      '11 mai 03h30',
      '12 mai 02h30',
      '23 mai 17h00',
      '25 mai 02h30',
      '30 mai 03h00',
      '01 juin 01h30',
    ];
    List<DateTime> startDateTime = formatDate(startDates);
    List<DateTime> endDateTime = formatDate(endDates);
    List<Appointment> apps = [];
    for (int index = 0; index < startDates.length; index++) {
      apps.add(
        Appointment(
          id: 0,
          start: startDateTime[index],
          end: endDateTime[index],
          isOrderService: true,
        ),
      );
    }
    return apps;
  }

  List<Appointment> _fastJuneServices() {
    List<String> startDates = [
      '01 juin 19h00',
      '02 juin 19h00',
      '04 juin 14h00',
      '07 juin 21h00',
      '08 juin 21h00',
      '09 juin 20h00',
      '14 juin 22h30',
      '15 juin 22h30',
      '16 juin 22h00',
      '20 juin 19h00',
      '21 juin 19h00',
      '22 juin 19h00',
      '23 juin 19h00',
      '29 juin 19h00',
    ];
    List<String> endDates = [
      '02 juin 03h00',
      '03 juin 03h00',
      '04 juin 22h00',
      '08 juin 04h45',
      '09 juin 04h45',
      '10 juin 07h00',
      '15 juin 01h30',
      '16 juin 01h30',
      '17 juin 06h15',
      '21 juin 03h00',
      '22 juin 03h00',
      '23 juin 03h00',
      '24 juin 03h00',
      '30 juin 03h00',
    ];
    List<DateTime> startDateTime = formatDate(startDates);
    List<DateTime> endDateTime = formatDate(endDates);
    List<Appointment> apps = [];
    for (int index = 0; index < startDates.length; index++) {
      apps.add(
        Appointment(
          id: 0,
          start: startDateTime[index],
          end: endDateTime[index],
          isOrderService: true,
        ),
      );
    }
    return apps;
  }

  List<Appointment> _fastJulyServices() {
    List<String> startDates = [
      '02 juillet 19h00',
      '03 juillet 19h00',
      '04 juillet 20h00',
      '05 juillet 19h00',
      '06 juillet 19h00',
      '07 juillet 19h00',
      '10 juillet 19h00',
      '11 juillet 19h00',
      '12 juillet 19h00',
      '13 juillet 19h00',
      '14 juillet 19h00',
      '15 juillet 19h00',
      '19 juillet 19h00',
      '20 juillet 19h00',
      '21 juillet 19h00',
      '22 juillet 19h00',
      '25 juillet 19h00',
      '26 juillet 19h00',
      '27 juillet 19h00',
      '28 juillet 19h00',
      '31 juillet 19h00',
    ];
    List<String> endDates = [
      '03 juillet 03h00',
      '04 juillet 03h00',
      '05 juillet 00h00',
      '06 juillet 03h00',
      '07 juillet 03h00',
      '08 juillet 03h00',
      '11 juillet 03h00',
      '12 juillet 03h00',
      '13 juillet 03h00',
      '14 juillet 03h00',
      '15 juillet 03h00',
      '16 juillet 03h00',
      '20 juillet 03h00',
      '21 juillet 03h00',
      '22 juillet 03h00',
      '23 juillet 03h00',
      '26 juillet 03h00',
      '27 juillet 03h00',
      '28 juillet 03h00',
      '29 juillet 03h00',
      '01 aout 3h00',
    ];
    List<DateTime> startDateTime = formatDate(startDates);
    List<DateTime> endDateTime = formatDate(endDates);
    List<Appointment> apps = [];
    for (int index = 0; index < startDates.length; index++) {
      apps.add(
        Appointment(
          id: 0,
          start: startDateTime[index],
          end: endDateTime[index],
          isOrderService: true,
        ),
      );
    }
    return apps;
  }

  List<Appointment> _fastAugustServices() {
    List<String> startDates = [
      '02 aout 21h00',
      '03 aout 21h00',
      '30 aout 19h00',
      '31 aout 19h00',
    ];
    List<String> endDates = [
      '03 aout 02h30',
      '04 aout 02h30',
      '31 aout 03h00',
      '01 septembre 03h00',
    ];
    List<DateTime> startDateTime = formatDate(startDates);
    List<DateTime> endDateTime = formatDate(endDates);
    List<Appointment> apps = [];
    for (int index = 0; index < startDates.length; index++) {
      apps.add(
        Appointment(
          id: 0,
          start: startDateTime[index],
          end: endDateTime[index],
          isOrderService: true,
        ),
      );
    }
    return apps;
  }
}
