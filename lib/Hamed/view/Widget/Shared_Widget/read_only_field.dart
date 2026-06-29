import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

class ReadOnlyField extends StatelessWidget {
  const ReadOnlyField({
    super.key,
    required this.libel,
    this.hint,
    this.hight,
    this.width,
    this.explainText,
    required this.onTap,
  });
  final String libel;
  final String? hint;
  final String? explainText;
  final double? hight;
  final double? width;
  final Function(String?) onTap;
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
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(
                10,
              )),
              boxShadow: [
                const BoxShadow(
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 2,
                    // color: mainColor,
                    color: Color.fromARGB(64, 0, 0, 0),
                    blurRadius: 10),
                BoxShadow(
                    blurStyle: BlurStyle.inner,
                    spreadRadius: 1.5,
                    color: mainColor,
                    // color: Color.fromARGB(64, 0, 0, 0),
                    blurRadius: 8)
              ],
            ),
            height: hight,
            width: width,
            child: TextFormField(
              style: TextStyle(color: Colors.black, fontSize: 20),
              expands: false,
              readOnly: true,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                    fontFamily: numberFont, color: secondaryTextColor),
                contentPadding: EdgeInsets.only(left: 10),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: mainColor, width: 0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: mainColor, width: 0)),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor, width: 0),
                ),
              ),
            ),
          ),
          explainText == null
              ? SizedBox()
              : Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        explainText!,
                        style: TextStyle(
                          color: secondaryTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
