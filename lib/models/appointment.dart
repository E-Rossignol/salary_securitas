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
}
