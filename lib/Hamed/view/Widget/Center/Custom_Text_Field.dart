import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';
import '';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.libel,
    this.hint,
    this.hight,
    this.explainText,
    this.maxLine,
    required this.onTap,
    required this.validator,
    this.number = false,
    this.email = false,
    this.init,
  });
  final String libel;
  final String? hint;
  final String? explainText;
  final double? hight;
  final int? maxLine;
  final Function(String?) onTap;
  final VoidCallback validator;
  final bool number;
  final bool email;
  final String? init;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            libel,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Container(
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
            height: hight,
            child: TextFormField(
              initialValue: init,
              keyboardType: number
                  ? TextInputType.phone
                  : email
                      ? TextInputType.emailAddress
                      : null,
              style: TextStyle(color: Colors.black, fontSize: 20),
              maxLines: maxLine,
              expands: false,
              onChanged: (value) {
                onTap(value);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor, width: 0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor, width: 0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor, width: 0),
                ),
              ),
              validator: (value) {
                validator();
                if (value == null) {
                  return 'empty';
                }
                return null;
              },
            ),
          ),
          explainText == null
              ? SizedBox()
              : Column(
                  children: [
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        explainText!,
                        style: TextStyle(color: secondaryTextColor),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
