import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return (Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(
                  10,
                )),
                boxShadow: [
                  BoxShadow(
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 1,
                      color: mainColor,
                      blurRadius: 10)
                ],
              ),
              child: const Center(
                  child: Icon(
                Icons.add,
                color: mainColor,
              ))),
        )));
  }
}
