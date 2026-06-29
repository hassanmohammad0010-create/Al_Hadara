import 'package:al_hadara/Constant/Const.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatelessWidget {
  CustomDropDown(
      {super.key,
      required this.itemList,
      required this.hintText,
      required this.icon,
      this.selectedItem,
      this.enabled,
      this.label,
      required this.onChanched});
  List<String> itemList;
  String? selectedItem;
  Icon icon;
  String? label;
  bool? enabled;
  String hintText;
  Function(String? data) onChanched;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        value: selectedItem,
        validator: (value) {
          if (value == null && !itemList.contains(selectedItem)) {
            return 'Please choose';
          }
          return null;
        },
        iconEnabledColor: constColor,
        style: const TextStyle(
            fontFamily: abhayaLibre, fontSize: 22, color: Colors.black),
        decoration: InputDecoration(
          label: Text(
            label ?? '',
            style: const TextStyle(
                fontFamily: abhayaLibre, fontSize: 22, color: constColor),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: icon,
          prefixIconColor: constColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
          contentPadding: const EdgeInsets.all(24),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: constColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: constColor, width: 2),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: constColor, width: 2),
          ),
        ),
        hint: Text(
          hintText,
          style: const TextStyle(fontFamily: abhayaLibre, fontSize: 20),
        ),
        items: itemList
            .map(
              (item) => DropdownMenuItem(
                enabled: enabled ?? true,
                alignment: Alignment.center,
                value: item,
                child: Text(item,
                    style: const TextStyle(
                        fontFamily: abhayaLibre,
                        fontSize: 22,
                        color: Colors.black)),
              ),
            )
            .toList(),
        onChanged: onChanched,
      ),
    );
  }
}
