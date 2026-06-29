import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePickerTwo extends StatelessWidget {
  const TimePickerTwo({
    super.key,
    required this.hint,
    this.from = false,
    this.onChange,
  });
  final String hint;
  final bool from;
  final Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );

        if (picked != null) {
          final now = DateTime.now();
          final dateTime = DateTime(
            now.year,
            now.month,
            now.day,
            picked.hour,
            picked.minute,
          );
          String time = DateFormat("HH:mm").format(dateTime);
          if (onChange != null) onChange!(time);
        }
      },
      child: Container(
        width: 180,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurStyle: BlurStyle.normal,
              spreadRadius: 2,
              // color: mainColor,
              color: Color.fromARGB(64, 0, 0, 0),
              blurRadius: 10,
            ),
            BoxShadow(
              blurStyle: BlurStyle.inner,
              spreadRadius: 1.5,
              color: mainColor,
              blurRadius: 8,
            ),
          ],
        ),
        child: AbsorbPointer(
          child: TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(fontFamily: numberFont),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
