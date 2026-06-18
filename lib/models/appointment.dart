/// Model representing an appointment/service instance.
///
/// @param id unique identifier (DB id)
/// @param start start DateTime of the appointment
/// @param end end DateTime of the appointment
/// @param isOrderService whether the appointment is an order service
class Appointment {
  final int id;
  final DateTime start;
  final DateTime end;
  final bool isOrderService;

  Appointment({
    required this.id,
    required this.start,
    required this.end,
    required this.isOrderService,
  });

  /// Return a compact debug string for the appointment.
  /// @return String representation for logging/debug
  @override
  String toString() {
    return '$id , $start , $end , $isOrderService';
  }
}
