import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

class DayPicker extends StatelessWidget {
  DayPicker({super.key, required this.hint, required this.onChange});
  final String hint;
  final Function(String) onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
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
            // color: Color.fromARGB(64, 0, 0, 0),
            blurRadius: 8,
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        hint: Text(hint),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 0),
          ),
          // labelText: hint,
        ),
        items: daysOfTheWeak
            .map((day) => DropdownMenuItem(value: day, child: Text(day)))
            .toList(),
        onChanged: (value) {
          value == null ? null : onChange(value);
        },
      ),
    );
  }
}
