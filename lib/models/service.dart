class Service {
  final int id;
  final int start;
  final int end;
  final int isOrderService;

  Service(
      {required this.id,
      required this.start,
      required this.end,
      required this.isOrderService});

  @override
  String toString() {
    return '$id , $start , $end , $isOrderService';
  }
}
