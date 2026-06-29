import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
    required this.libel,
    this.hint,
    this.hight,
    this.maxLine,
    this.birth = false,
    required this.fun,
  });
  final String libel;
  final String? hint;
  final double? hight;
  final int? maxLine;
  final bool birth;
  final Function(DateTime?) fun;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        height: hight,
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
              height: hight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(
                  10,
                )),
                boxShadow: [
                  BoxShadow(
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
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.calendar_today,
                    color: mainColor,
                  ),
                  hintText: hint,
                  hintStyle: TextStyle(
                      color: secondaryTextColor,
                      // fontSize: 20,
                      fontFamily: numberFont),
                  contentPadding: EdgeInsets.only(left: 10),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: mainColor, width: 0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: mainColor, width: 0)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: mainColor, width: 0),
                  ),
                ),
                onTap: () async {
                  DateTime now = DateTime.now();
                  DateTime? selectedDate = await showDialog<DateTime>(
                    context: context,
                    builder: (context) => DatePickerDialog(
                      initialDate: now,
                      firstDate: birth ? DateTime(now.year - 100, 1, 1) : now,
                      lastDate: birth ? now : now.add(Duration(days: 7)),
                    ),
                  );
                  print(selectedDate);
                  fun(selectedDate);
                  // if (selectedDate != null) {
                  //   setState(() {
                  //     _controller.text = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                  //   });
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
