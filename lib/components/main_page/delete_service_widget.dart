import 'package:flutter/material.dart';
import '../../models/appointment.dart';

class DeleteServiceWidget extends StatefulWidget {
  final Function(Appointment) onDelete;
  final Appointment appointment;

  const DeleteServiceWidget({
    super.key,
    required this.onDelete,
    required this.appointment,
  });

  @override
  State<DeleteServiceWidget> createState() => _DeleteServiceWidget();
}

class _DeleteServiceWidget extends State<DeleteServiceWidget> {
  String? isOrderServiceValue;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Service'),
      content: const Text('Are you sure you want to delete this service?'),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Delete'),
          onPressed: () {
            setState(() {
              widget.onDelete(widget.appointment);
            });
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 1),
                content: Text('Service deleted'),
              ),
            );
          },
        ),
      ],
    );
  }
}
