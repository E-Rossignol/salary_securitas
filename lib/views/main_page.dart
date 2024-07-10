import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:salary_securitas/components/settings/log_out_component.dart';
import 'package:salary_securitas/models/appointment.dart';
import 'package:flutter/material.dart';
import 'package:salary_securitas/auth/auth.dart';
import 'package:salary_securitas/views/create_service_page.dart';
import 'package:salary_securitas/views/settings_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import '../constants/helper.dart';
import '../database/service_db.dart';
import '../models/user_secu.dart';
import 'copy_service_page.dart';
import 'edit_service_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<SharedPreferences> prefs;
  Future<List<Appointment>>? futureAppointments;
  ServiceDB db = ServiceDB();
  late Future<UserSecu> futureUser;
  UserSecu user = UserSecu(id: 0, userID: '', firstName: '', lastName: '');
  late CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  late int _currentMonth = DateTime.now().month;
  late int _currentYear = DateTime.now().year;
  List<Appointment> _appointmentsForSelectedDay = [];

  @override
  void initState() {
    super.initState();
    setPrefs();
    getName();
    fetchServices();
  }

  void setPrefs(){
    setState(() {
      prefs = SharedPreferences.getInstance();
    });
  }
  void fetchServices() {
    setState(() {
      futureAppointments =
          db.fetchUserAppointments(FirebaseAuth.instance.currentUser!.uid);
    });
  }

  void getName() {
    setState(() {
      futureUser = db.getName(FirebaseAuth.instance.currentUser!.uid);
    });
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }

  void deleteService(Appointment appointment) async {
    await db.delete(appointment.id);
    setState(() {
      _appointmentsForSelectedDay.removeWhere((a) => a.id == appointment.id);
      fetchServices();
      futureAppointments = futureAppointments?.then((appointments) =>
          appointments.where((a) => a.id != appointment.id).toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateServicePage(day: _selectedDay)));
        },
        backgroundColor: colors.secondary,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: FutureBuilder<UserSecu>(
          future: futureUser,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('loading'.tr);
            } else if (snapshot.hasError) {
              return Text('${'error:'.tr}${snapshot.error}');
            } else {
              user = snapshot.data!;
              if (user.id == -1){
                return Center(
                  child: Text('no name registered'.tr),
                );
              }
              return Center(
                  child: Text('${user.firstName} ${user.lastName}',
                      style: TextStyle(color: colors.onPrimary)));
            }
          },
        ),
        actions: [
          Builder(
              builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: Icon(
                      color: colors.onPrimary,
                      Icons.settings,
                    ),
                  )),
        ],
        leading: const LogOutComponent(),
        backgroundColor: colors.primary,
      ),
      endDrawer: Drawer(
        shadowColor: colors.onBackground,
        backgroundColor: colors.background,
        child: FutureBuilder<SharedPreferences>(
          future: prefs,
          builder: (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Show a loading spinner while waiting
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // SharedPreferences instance is available here
              SharedPreferences prefs = snapshot.data!;
              bool isDebug = prefs.getBool('godMod') ?? false;
              return SettingsView(isLoginPage: false, isDebug: isDebug);
            }
          },
        )
      ),
      body: FutureBuilder<List<Appointment>>(
        future: futureAppointments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('${'error:'.tr}  ${snapshot.error.toString()}'));
          } else {
            return Column(mainAxisSize: MainAxisSize.max, children: [
              Container(
                decoration: BoxDecoration(
                  color: colors.secondaryContainer,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TableCalendar<Appointment>(
                  locale: Get.locale?.languageCode,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  calendarFormat: _calendarFormat,
                  eventLoader: (day) {
                    return Helper.getEventsFromAppointments(snapshot.data!)[
                            DateTime(day.year, day.month, day.day)] ??
                        [];
                  },
                  availableCalendarFormats: {
                    CalendarFormat.month: 'month'.tr,
                  },
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  selectedDayPredicate: (day) {
                    return isSameDay(
                        _selectedDay, DateTime(day.year, day.month, day.day));
                  },
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: colors.secondary,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: colors.primary,
                      shape: BoxShape.circle,
                    ),
                    markersAutoAligned: true,
                    markerDecoration: BoxDecoration(
                      color: colors.onBackground,
                      shape: BoxShape.rectangle,
                    ),
                  ),
                  rowHeight: MediaQuery.of(context).size.height / 12,
                  onPageChanged: (focusedDay) {
                    setState(() {
                      _currentMonth = focusedDay.month;
                      _currentYear = focusedDay.year;
                      _focusedDay = focusedDay;
                    });
                  },
                  onDayLongPressed: (selectedDay, focusedDay) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateServicePage(day: selectedDay)));
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = DateTime(
                          selectedDay.year, selectedDay.month, selectedDay.day);
                      _focusedDay = DateTime(
                          selectedDay.year, selectedDay.month, selectedDay.day);
                    });
                    List<Appointment> appointmentsForSelectedDay =
                        Helper.getEventsFromAppointments(
                                snapshot.data!)[_selectedDay] ??
                            [];
                    _appointmentsForSelectedDay = appointmentsForSelectedDay;
                  },
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: colors.onInverseSurface,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: _appointmentsForSelectedDay.isNotEmpty
                        ? Center(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: _appointmentsForSelectedDay.length,
                                itemBuilder: (context, index) {
                                  var appointment =
                                      _appointmentsForSelectedDay[index];
                                  return Center(
                                    child: Container(
                                        margin: const EdgeInsets.all(15.0),
                                        padding: const EdgeInsets.all(15.0),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              colors.primaryContainer,
                                              colors.secondaryContainer,
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: colors.onBackground,
                                            width: 1.0,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                      Helper.toNiceString(
                                                          appointment.start),
                                                      style: TextStyle(
                                                        color:
                                                            colors.onBackground,
                                                        fontSize: 18,
                                                      )),
                                                  Text(' - ',
                                                      style: TextStyle(
                                                        color:
                                                            colors.onBackground,
                                                        fontSize: 18,
                                                      )),
                                                  Text(
                                                      Helper.toNiceString(
                                                          appointment.end),
                                                      style: TextStyle(
                                                        color:
                                                            colors.onBackground,
                                                        fontSize: 18,
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Transform.scale(
                                                    scale: 0.8,
                                                    child: IconButton(
                                                      icon: const Icon(
                                                        Icons.edit,
                                                        size: 20,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(builder: (context) => EditServicePage(app: appointment,)));
                                                      },
                                                    ),
                                                  ),
                                                  Transform.scale(
                                                      scale: 0.8,
                                                      child: IconButton(
                                                        icon: const Icon(
                                                          Icons.copy_all,
                                                          size: 20,
                                                        ),
                                                        onPressed: () {
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return CopyServicePage(
                                                                    app:
                                                                        appointment);
                                                              });
                                                        },
                                                      )),
                                                  Transform.scale(
                                                    scale: 0.8,
                                                    child: IconButton(
                                                      icon: const Icon(
                                                          Icons.delete,
                                                          size: 20),
                                                      onPressed: () {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'delete_service'.tr),
                                                                content: Text(
                                                                    'sure_delete_service'.tr),
                                                                actions: <Widget>[
                                                                  TextButton(
                                                                    child: Text(
                                                                        'cancel'.tr),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                  ),
                                                                  TextButton(
                                                                    child: Text(
                                                                        'delete'.tr),
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                      setState(
                                                                          () {
                                                                        deleteService(
                                                                            appointment);
                                                                      });
                                                                    },
                                                                  ),
                                                                ],
                                                              );
                                                            });
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                  );
                                }),
                          )
                        : Center(child: Text('no_service'.tr)),
                  ),
                ),
              ),
              Center(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: FutureBuilder<List<double>>(
                    future: getMonthSalary(
                        snapshot.data!, _currentMonth, _currentYear),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('${'error'.tr} ${snapshot.error}'));
                      } else {
                        return Container(
                          margin: const EdgeInsets.all(15.0),
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${snapshot.data!.first.round()} .- (${snapshot.data!.last.round()}h)',
                                style: TextStyle(
                                  shadows: [
                                    Shadow(
                                      blurRadius: 20.0,
                                      color: colors.onSecondaryContainer,
                                      offset: const Offset(1.0, 1.0),
                                    ),
                                  ],
                                  color: colors.error,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              )
            ]);
          }
        },
      ),
    );
  }

  Future<List<double>> getMonthSalary(
      List<Appointment> list, int month, int year) async {
    list =
        list.where((appointment) => appointment.start.month == month).toList();
    list = list.where((appointment) => appointment.start.year == year).toList();
    return (await Helper.getNetSalary(list));
  }
}
