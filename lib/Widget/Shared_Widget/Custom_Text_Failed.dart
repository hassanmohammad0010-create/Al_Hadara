import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormFaild extends StatefulWidget {
  final String labelText;
  final Icon? icon;
  Function(String)? onChange;
  String? Function(String?)? validator;
  String? hintText;
  IconButton? suffixIcon;
  String? initialValue;
  int? maxLenght;

  TextInputType? textInputType = TextInputType.text;
  bool? obscureText = false;
  int? maxLine;

  CustomTextFormFaild(
      {super.key,
      this.maxLine,
      required this.labelText,
      this.icon,
      this.obscureText,
      this.hintText,
      this.maxLenght,
      required this.onChange,
      required this.validator,
      this.suffixIcon,
      this.initialValue,
      this.textInputType});

  @override
  State<CustomTextFormFaild> createState() => _CustomTextFormFaildState();
}

class _CustomTextFormFaildState extends State<CustomTextFormFaild> {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: TextFormField(
        maxLines: widget.obscureText == null ? widget.maxLine : 1,
        maxLength: widget.maxLenght,
        keyboardType: widget.textInputType,
        // inputFormatters: <TextInputFormatter>[
        //   FilteringTextInputFormatter.allow(RegExp(r'[a-z]')),
        //   // FilteringTextInputFormatter.digitsOnly
        // ],
        initialValue: widget.initialValue,
        obscureText: widget.obscureText ?? false,
        validator: widget.validator,

        onChanged: widget.onChange,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: widget.hintText,
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.icon,
            prefixIconColor: constColor,
            label: Text(
              widget.labelText,
              style: const TextStyle(fontFamily: abhayaLibre, fontSize: 22),
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.red, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: constColor, width: 2)),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            contentPadding: const EdgeInsets.all(25)),
      ),
    );
  }
}
