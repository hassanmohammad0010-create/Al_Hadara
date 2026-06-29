import 'package:al_hadara/Constant/Const.dart';
import 'package:al_hadara/Hamed/view/Widget/Shared_Widget/arrowBackButton.dart';
import 'package:flutter/material.dart';

class TopColoredSection extends StatelessWidget {
  const TopColoredSection({super.key, this.height = 100});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: mainColor,
      child: const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(left: 25),
            child: ArrowBackButton(
              blue: false,
            )),
      ),
    );
  }
}
