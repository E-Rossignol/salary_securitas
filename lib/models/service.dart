class Service {
  final int id;
  final int start;
  final int end;
  final int isOrderService;
  final String user;

  Service(
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
