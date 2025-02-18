class Appointment {
  final int id;
  final DateTime start;
  final DateTime end;
  final bool isOrderService;

  Appointment(
      {required this.id,
      required this.start,
      required this.end,
      required this.isOrderService});

  @override
  String toString() {
    return '$id , $start , $end , $isOrderService';
  }
}
