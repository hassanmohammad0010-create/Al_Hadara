import 'package:al_hadara/Constant/Const.dart';
import 'package:flutter/material.dart';

class FlowButton extends StatelessWidget {
  const FlowButton({
    super.key,
    required this.text,
    this.pBottom,
    this.pRight,
    this.height,
    this.width,
    this.textSize,
    this.onTap,
  });
  final String text;
  final double? pBottom;
  final double? pRight;
  final double? height;
  final double? width;
  final double? textSize;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: pBottom,
      right: pRight,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(bottom: 5),
          height: height ?? 50,
          width: width ?? 140,
          decoration: BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //       blurStyle: BlurStyle.normal,
            //       spreadRadius: 1,
            //       color: mainColor,
            //       blurRadius: 10),
            // ],
            color: mainColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: textSize ?? 30,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
