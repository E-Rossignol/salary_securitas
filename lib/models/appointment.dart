import 'service.dart';

class Appointment {
  final int id;
  final DateTime start;
  final DateTime end;
  final bool isOrderService;
  final String user;

  Appointment(
      {required this.id,
      required this.start,
      required this.end,
      required this.isOrderService,
      required this.user});

  @override
  String toString() {
    return '$id , $start , $end , $isOrderService , $user';
  }

  List<Appointment> toAppointmentList(List<Service> services) {
    List<Appointment> appointments = [];
    for (Service service in services) {
      appointments.add(Appointment(
          id: service.id,
          start: DateTime(2000).add(Duration(minutes: service.start)),
          end: DateTime(2000).add(Duration(minutes: service.end)),
          isOrderService: service.isOrderService == 1,
          user: service.user));
    }
    return appointments;
  }

  List<Service> toServiceList(List<Appointment> appointments) {
    List<Service> services = [];
    for (Appointment appointment in appointments) {
      services.add(Service(
          id: appointment.id,
          start: appointment.start.compareTo(DateTime(2000)),
          end: appointment.end.compareTo(DateTime(2000)),
          isOrderService: appointment.isOrderService ? 1 : 0,
          user: appointment.user));
    }
    return services;
  }
}
