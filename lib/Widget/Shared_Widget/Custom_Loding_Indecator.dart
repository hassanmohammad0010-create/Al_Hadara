import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:al_hadara/Constant/Const.dart';

class CustomLoadingIndecator extends StatelessWidget {
  const CustomLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoadingIndicator(
        indicatorType: Indicator.ballPulse,

        /// Required, The loading type of the widget
        colors: [constColor],

        /// Optional, The color collections
        strokeWidth: 2,

        /// Optional, The stroke of the line, only applicable to widget which contains line
        backgroundColor: Colors.transparent,

        /// Optional, Background of the widget
        pathBackgroundColor: Colors.transparent

        /// Optional, the stroke backgroundColor
        );
  }
}
