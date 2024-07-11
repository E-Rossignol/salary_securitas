import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salary_securitas/constants/helper.dart';
import '../../database/service_db.dart';
import '../../models/appointment.dart';
import '../../views/main_page.dart';

/// The `LogOutComponent` class represents a widget that allows the user to log out of the application.
///
/// It extends `StatefulWidget`, meaning it can maintain state that might change during the lifetime of the widget.
///
/// The class provides a `build` method that returns a `ListTile` widget. When this `ListTile` is tapped, it shows a dialog asking the user to confirm if they want to leave the app.
class FastServicesComponent extends StatefulWidget {
  const FastServicesComponent({super.key});

  @override
  FastServicesComponentState createState() => FastServicesComponentState();
}

/// The `_LogOutComponent` class represents the state of the `LogOutComponent` widget.
///
/// It extends `State<LogOutComponent>`, meaning it holds the mutable state for the `LogOutComponent` widget.
///
/// The class provides a `build` method that returns a `ListTile` widget. When this `ListTile` is tapped, it shows a dialog asking the user to confirm if they want to leave the app.
class FastServicesComponentState extends State<FastServicesComponent> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          Icons.fast_forward_outlined),
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
                  'Display example calendar ?'),
              actions: <Widget>[
                ElevatedButton(
                    onPressed: () async {
                      await _fastServices();
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()));
                      Helper.snackbar('Default calendar', 'Default calendar displayed for may, june and july');
                    },
                    child: Text('yes'.tr)),
                ElevatedButton(
                  child: Text('no'.tr),
                  onPressed: () {
                    Navigator.of(context).pop(); // Dismiss the dialog
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

  List<DateTime> formatDate(List<String> dates) {
    List<DateTime> formattedDates = [];
    for (String date in dates) {
      DateTime formattedDate = DateTime(2024);
      List<String> words = date.split(' ');
      int days = int.parse(words[0]);
      int month = 0;
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
      int hours = int.parse(words[2].split('h')[0]);
      int minutes = int.parse(words[2].split('h')[1]);
      formattedDate = DateTime(2024, month, days, hours, minutes);
      formattedDates.add(formattedDate);
    }
    return formattedDates;
  }

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
    Appointment mayApp1 = Appointment(
        id: 0,
        start: startDateTime[0],
        end: endDateTime[0],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment mayApp2 = Appointment(
        id: 0,
        start: startDateTime[1],
        end: endDateTime[1],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment mayApp3 = Appointment(
        id: 0,
        start: startDateTime[2],
        end: endDateTime[2],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment mayApp4 = Appointment(
        id: 0,
        start: startDateTime[3],
        end: endDateTime[3],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment mayApp5 = Appointment(
        id: 0,
        start: startDateTime[4],
        end: endDateTime[4],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment mayApp6 = Appointment(
        id: 0,
        start: startDateTime[5],
        end: endDateTime[5],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment mayApp7 = Appointment(
        id: 0,
        start: startDateTime[6],
        end: endDateTime[6],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment mayApp8 = Appointment(
        id: 0,
        start: startDateTime[7],
        end: endDateTime[7],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment mayApp9 = Appointment(
        id: 0,
        start: startDateTime[8],
        end: endDateTime[8],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    apps.add(mayApp1);
    apps.add(mayApp2);
    apps.add(mayApp3);
    apps.add(mayApp4);
    apps.add(mayApp5);
    apps.add(mayApp6);
    apps.add(mayApp7);
    apps.add(mayApp8);
    apps.add(mayApp9);
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
    Appointment juneApp1 = Appointment(
        id: 0,
        start: startDateTime[0],
        end: endDateTime[0],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment juneApp2 = Appointment(
        id: 0,
        start: startDateTime[1],
        end: endDateTime[1],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment juneApp3 = Appointment(
        id: 0,
        start: startDateTime[2],
        end: endDateTime[2],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment juneApp4 = Appointment(
        id: 0,
        start: startDateTime[3],
        end: endDateTime[3],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment juneApp5 = Appointment(
        id: 0,
        start: startDateTime[4],
        end: endDateTime[4],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment juneApp6 = Appointment(
        id: 0,
        start: startDateTime[5],
        end: endDateTime[5],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment juneApp7 = Appointment(
        id: 0,
        start: startDateTime[6],
        end: endDateTime[6],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment juneApp8 = Appointment(
        id: 0,
        start: startDateTime[7],
        end: endDateTime[7],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment juneApp9 = Appointment(
        id: 0,
        start: startDateTime[8],
        end: endDateTime[8],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment juneApp10 = Appointment(
        id: 0,
        start: startDateTime[9],
        end: endDateTime[9],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment juneApp11 = Appointment(
        id: 0,
        start: startDateTime[10],
        end: endDateTime[10],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment juneApp12 = Appointment(
        id: 0,
        start: startDateTime[11],
        end: endDateTime[11],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment juneApp13 = Appointment(
        id: 0,
        start: startDateTime[12],
        end: endDateTime[12],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment juneApp14 = Appointment(
        id: 0,
        start: startDateTime[13],
        end: endDateTime[13],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    apps.add(juneApp1);
    apps.add(juneApp2);
    apps.add(juneApp3);
    apps.add(juneApp4);
    apps.add(juneApp5);
    apps.add(juneApp6);
    apps.add(juneApp7);
    apps.add(juneApp8);
    apps.add(juneApp9);
    apps.add(juneApp10);
    apps.add(juneApp11);
    apps.add(juneApp12);
    apps.add(juneApp13);
    apps.add(juneApp14);
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
    Appointment julyApp1 = Appointment(
        id: 0,
        start: startDateTime[0],
        end: endDateTime[0],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp2 = Appointment(
        id: 0,
        start: startDateTime[1],
        end: endDateTime[1],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp3 = Appointment(
        id: 0,
        start: startDateTime[2],
        end: endDateTime[2],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp4 = Appointment(
        id: 0,
        start: startDateTime[3],
        end: endDateTime[3],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp5 = Appointment(
        id: 0,
        start: startDateTime[4],
        end: endDateTime[4],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp6 = Appointment(
        id: 0,
        start: startDateTime[5],
        end: endDateTime[5],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp7 = Appointment(
        id: 0,
        start: startDateTime[6],
        end: endDateTime[6],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp8 = Appointment(
        id: 0,
        start: startDateTime[7],
        end: endDateTime[7],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp9 = Appointment(
        id: 0,
        start: startDateTime[8],
        end: endDateTime[8],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp10 = Appointment(
        id: 0,
        start: startDateTime[9],
        end: endDateTime[9],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp11 = Appointment(
        id: 0,
        start: startDateTime[10],
        end: endDateTime[10],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp12 = Appointment(
        id: 0,
        start: startDateTime[11],
        end: endDateTime[11],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp13 = Appointment(
        id: 0,
        start: startDateTime[12],
        end: endDateTime[12],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp14 = Appointment(
        id: 0,
        start: startDateTime[13],
        end: endDateTime[13],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp15 = Appointment(
        id: 0,
        start: startDateTime[14],
        end: endDateTime[14],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp16 = Appointment(
        id: 0,
        start: startDateTime[15],
        end: endDateTime[15],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp17 = Appointment(
        id: 0,
        start: startDateTime[16],
        end: endDateTime[16],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp18 = Appointment(
        id: 0,
        start: startDateTime[17],
        end: endDateTime[17],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp19 = Appointment(
        id: 0,
        start: startDateTime[18],
        end: endDateTime[18],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp20 = Appointment(
        id: 0,
        start: startDateTime[19],
        end: endDateTime[19],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment julyApp21 = Appointment(
        id: 0,
        start: startDateTime[20],
        end: endDateTime[20],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    apps.add(julyApp1);
    apps.add(julyApp2);
    apps.add(julyApp3);
    apps.add(julyApp4);
    apps.add(julyApp5);
    apps.add(julyApp6);
    apps.add(julyApp7);
    apps.add(julyApp8);
    apps.add(julyApp9);
    apps.add(julyApp10);
    apps.add(julyApp11);
    apps.add(julyApp12);
    apps.add(julyApp13);
    apps.add(julyApp14);
    apps.add(julyApp15);
    apps.add(julyApp16);
    apps.add(julyApp17);
    apps.add(julyApp18);
    apps.add(julyApp19);
    apps.add(julyApp20);
    apps.add(julyApp21);
    return apps;
  }

  List<Appointment> _fastAugustServices(){
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
    Appointment mayApp1 = Appointment(
        id: 0,
        start: startDateTime[0],
        end: endDateTime[0],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment mayApp2 = Appointment(
        id: 0,
        start: startDateTime[1],
        end: endDateTime[1],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment mayApp3 = Appointment(
        id: 0,
        start: startDateTime[2],
        end: endDateTime[2],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    Appointment mayApp4 = Appointment(
        id: 0,
        start: startDateTime[3],
        end: endDateTime[3],
        isOrderService: true,
        user: FirebaseAuth.instance.currentUser!.uid);
    apps.add(mayApp1);
    apps.add(mayApp2);
    apps.add(mayApp3);
    apps.add(mayApp4);
    return apps;
  }
}
