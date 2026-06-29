import 'package:al_hadara/Constant/Const.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

// ignore: must_be_immutable
class CustomOtb extends StatelessWidget {
  CustomOtb({
    super.key,
    required this.onSubmit,
  });
  Function(String data) onSubmit;

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
        filled: true,
        fillColor: Colors.white,
        numberOfFields: 4,
        enabledBorderColor: constWhiteGreyColor,
        fieldWidth: 64,
        borderRadius: BorderRadius.circular(8),
        borderColor: constColor,
        //set to true to show as box or false to show as dash
        showFieldAsBox: true,
        //runs when a code is typed in
        // onCodeChanged: onChange,

        //runs when every textfield is filled
        onSubmit: onSubmit);
  }
}
