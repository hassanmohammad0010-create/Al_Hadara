import 'dart:ui';

import 'package:al_hadara/Widget/Shared_Widget/Custom_Loding_Indecator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomLoading extends StatelessWidget {
  CustomLoading({super.key, required this.load});
  bool load;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: load,
          child: Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 1.0, sigmaY: 1.0), // Adjust the blur intensity
              child: Container(
                color: Colors.black.withOpacity(
                    0.5), // Optional: Add a semi-transparent overlay
              ),
            ),
          ),
        ),
        Visibility(
            visible: load, child: const Center(child: CustomLoadingIndecator()))
      ],
    );
  }
}
