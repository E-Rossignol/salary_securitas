/// Persistent model for a service row stored in SQLite.
///
/// @param id database id
/// @param start minutes offset from start of the year for the start
/// @param end minutes offset from start of the year for the end
/// @param isOrderService numeric flag (1 or 0)
class Service {
  final int id;
  final int start;
  final int end;
  final int isOrderService;

  Service({
    required this.id,
    required this.start,
    required this.end,
    required this.isOrderService,
  });

  /// Return a compact debug string for the service.
  /// @return String representation for logging/debug
  @override
  String toString() {
    return '$id , $start , $end , $isOrderService';
  }
}
