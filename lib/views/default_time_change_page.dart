import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Page to change default start/end times (placeholder).
///
/// This simple page is a placeholder that can be extended later to provide
/// a full-screen alternative to the small settings component.
/// @return Widget
class DefaultTimeChangePage extends StatelessWidget {
  const DefaultTimeChangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('change_default_service'.tr)),
      body: Center(child: Text('change_default_service'.tr)),
    );
  }
}
