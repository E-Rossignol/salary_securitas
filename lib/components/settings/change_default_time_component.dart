import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../../constants/theme/theme_provider.dart';

class ChangeDefaultTimeComponent extends StatefulWidget {
  const ChangeDefaultTimeComponent({super.key});

  @override
  State<ChangeDefaultTimeComponent> createState() =>
      _ChangeDefaultTimeComponentState();
}

class _ChangeDefaultTimeComponentState
    extends State<ChangeDefaultTimeComponent> {
  int startHour = 6;
  int startMinute = 0;
  int endHour = 14;
  int endMinute = 0;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      startHour = prefs.getInt('default_start_hour') ?? startHour;
      startMinute = prefs.getInt('default_start_minute') ?? startMinute;
      endHour = prefs.getInt('default_end_hour') ?? endHour;
      endMinute = prefs.getInt('default_end_minute') ?? endMinute;
    });
  }

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  Future<void> _openDialog() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => const EditDefaultTimeDialog(),
    );
    if (result == true) {
      await _loadPreferences();
    }
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
    );
    return ListTile(
      leading:
      Icon(Icons.schedule, color: Theme.of(context).colorScheme.onPrimaryContainer),
      title: Text('change_default_service'.tr, style: titleStyle),
      onTap: _openDialog,
    );
  }
}


class EditDefaultTimeDialog extends StatefulWidget {
  const EditDefaultTimeDialog({super.key});

  @override
  State<EditDefaultTimeDialog> createState() => _EditDefaultTimeDialogState();
}

class _EditDefaultTimeDialogState extends State<EditDefaultTimeDialog> {
  int startHour = 6;
  int startMinute = 0;
  int endHour = 14;
  int endMinute = 0;
  final timeFormat = DateFormat("HH:mm");

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      startHour = prefs.getInt('default_start_hour') ?? startHour;
      startMinute = prefs.getInt('default_start_minute') ?? startMinute;
      endHour = prefs.getInt('default_end_hour') ?? endHour;
      endMinute = prefs.getInt('default_end_minute') ?? endMinute;
    });
  }

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  int _getClosestValidMinute(int minute) {
    if (minute >= 0 && minute < 7) return 0;
    if (minute >= 7 && minute < 22) return 15;
    if (minute >= 22 && minute < 37) return 30;
    if (minute >= 37 && minute < 52) return 45;
    return 60;
  }

  Future<void> _pickStartTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: startHour, minute: startMinute),
    );
    if (picked != null) {
      int rounded = _getClosestValidMinute(picked.minute);
      int hour = picked.hour;
      if (rounded == 60) {
        rounded = 0;
        hour = (hour + 1) % 24;
      }
      setState(() {
        startHour = hour;
        startMinute = rounded;
      });
    }
  }

  Future<void> _pickEndTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: endHour, minute: endMinute),
    );
    if (picked != null) {
      int rounded = _getClosestValidMinute(picked.minute);
      int hour = picked.hour;
      if (rounded == 60) {
        rounded = 0;
        hour = (hour + 1) % 24;
      }
      setState(() {
        endHour = hour;
        endMinute = rounded;
      });
    }
  }

  Future<void> _saveAndClose() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('default_start_hour', startHour);
    await prefs.setInt('default_start_minute', startMinute);
    await prefs.setInt('default_end_hour', endHour);
    await prefs.setInt('default_end_minute', endMinute);
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Text('change_default_service'.tr),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.schedule),
                  title: Text('start_time'.tr),
                  subtitle: Text('${twoDigits(startHour)}:${twoDigits(startMinute)}'),
                  onTap: _pickStartTime,
                ),
                const SizedBox(height: 8),
                ListTile(
                  leading: const Icon(Icons.schedule),
                  title: Text('end_time'.tr),
                  subtitle: Text('${twoDigits(endHour)}:${twoDigits(endMinute)}'),
                  onTap: _pickEndTime,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('cancel'.tr),
            ),
            ElevatedButton(
              onPressed: _saveAndClose,
              child: Text('validate'.tr),
            ),
          ],
        );
      },
    );
  }
}