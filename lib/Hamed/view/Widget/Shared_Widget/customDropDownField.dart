import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/model/centerModel/drop_down_model.dart';
import 'package:flutter/material.dart';

class CustomDropDownField extends StatelessWidget {
  const CustomDropDownField({
    super.key,
    this.height = 70,
    this.width = double.maxFinite,
    required this.label,
    required this.list,
    required this.onChange,
    this.onTap,
  });
  final String label;
  final double height;
  final double width;
  final List<DropDownModel> list;
  final Function(DropDownModel) onChange;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Container(
            width: width,
            height: height,
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
            child: DropdownButtonFormField<DropDownModel>(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, right: 10),
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
              items: list
                  .map(
                    (name) =>
                        DropdownMenuItem(value: name, child: Text(name.option)),
                  )
                  .toList(),
              onChanged: (value) {
                value == null ? null : onChange(value);
              },
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
