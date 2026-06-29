import 'package:al_hadara/Constant/Const.dart';

import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({super.key, @required this.dotsIndex});
  final dynamic dotsIndex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      decorator: DotsDecorator(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(color: consttwisColor)),
          activeColor: consttwisColor,
          color: Colors.transparent),
      dotsCount: 3,
      position: dotsIndex.toInt(),
    );
  }
}
