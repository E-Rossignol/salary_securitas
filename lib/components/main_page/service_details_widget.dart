import 'package:flutter/material.dart';
import '../../models/appointment.dart';

class ServiceDetailsWidget extends StatefulWidget {
  final Appointment appointment;

  const ServiceDetailsWidget({super.key, required this.appointment});

  @override
  State<ServiceDetailsWidget> createState() => _ServiceDetailsWidgetState();
}

class _ServiceDetailsWidgetState extends State<ServiceDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Service from user ${widget.appointment.user}',
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Start: ${widget.appointment.start.toIso8601String()}')),
              Container(
                  margin: const EdgeInsets.only(left: 30),
                  alignment: Alignment.centerLeft,
                  child:
                      Text('End: ${widget.appointment.end.toIso8601String()}')),
              Container(
                  margin: const EdgeInsets.only(left: 30),
                  alignment: Alignment.centerLeft,
                  child: Text('Order: ${widget.appointment.isOrderService}')),
              Container(
                  margin: const EdgeInsets.fromLTRB(30, 0, 0, 30),
                  alignment: Alignment.centerLeft,
                  child: Text('User: ${widget.appointment.user}')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
