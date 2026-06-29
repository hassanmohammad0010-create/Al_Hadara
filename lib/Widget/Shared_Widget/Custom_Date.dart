import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDate extends StatefulWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final Icon? icon;
  String? initialValue;
  String? hintText;
  IconButton? suffixIcon;
  CustomDate({
    Key? key,
    required this.textEditingController,
    this.icon,
    this.initialValue,
    required this.labelText,
    this.hintText,
    this.suffixIcon,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomDateState createState() => _CustomDateState();
}

class _CustomDateState extends State<CustomDate> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      widget.textEditingController.text = widget.initialValue!;
    }
  }

  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(
        1980,
      ),
      lastDate: DateTime(2025, 12),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: constColor, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: constColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        // Format the date as you want, here: yyyy-MM-dd
        widget.textEditingController.text =
            "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: TextFormField(
        controller: widget.textEditingController,
        readOnly: true, // Prevent keyboard from showing
        onTap: _pickDate,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please choose a date';
          }
          return null;
        },
        style: const TextStyle(fontFamily: abhayaLibre, fontSize: 20),
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: widget.hintText,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.icon,
            prefixIconColor: constColor,
            label: Text(
              widget.labelText,
              style: const TextStyle(
                  fontFamily: abhayaLibre, fontSize: 22, color: constColor),
            ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: constColor, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: constColor, width: 2)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: constColor, width: 2)),
            border: const OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            contentPadding: const EdgeInsets.all(25)),
      ),
    );
  }
}
