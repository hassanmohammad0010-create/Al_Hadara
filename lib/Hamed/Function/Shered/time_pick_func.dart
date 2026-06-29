import 'package:flutter/material.dart';

Future<String?> pickTime(context) async {
  final TimeOfDay? picked =
      await showTimePicker(context: context, initialTime: TimeOfDay.now());
  String? time = picked?.format(context);
  print(time);
  return time;
}
