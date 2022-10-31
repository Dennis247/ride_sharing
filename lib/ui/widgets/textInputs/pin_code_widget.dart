import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ride_sharing/core/utils/colors.dart';
import 'package:sizer/sizer.dart';

class PinCodeWidget extends StatefulWidget {
  final Function? onCompleted;

  const PinCodeWidget({
    super.key,
    this.onCompleted,
  });

  @override
  State<PinCodeWidget> createState() => _PinCodeWidgetState();
}

class _PinCodeWidgetState extends State<PinCodeWidget> {
  final textEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: TextStyle(
        color: Colors.green.shade600,
        fontWeight: FontWeight.bold,
      ),
      length: 4,
      errorTextSpace: 40,
      //   obscureText: true,
      obscuringCharacter: '*',

      // blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      validator: (v) {
        if (v != "5683") {
          return "Incorrect code";
        } else {
          return null;
        }
      },

      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 12.0.w,
          fieldWidth: 20.0.w,
          activeFillColor: Colors.white,
          selectedFillColor: Colors.transparent,
          inactiveFillColor: AppColors.grayLightest1,
          inactiveColor: Colors.transparent,
          errorBorderColor: AppColors.redColor),
      // cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      errorAnimationController: errorController,

      controller: textEditingController,
      keyboardType: TextInputType.number,
      enablePinAutofill: true,
      blinkWhenObscuring: false,
      showCursor: false,

      // boxShadows: const [
      //   BoxShadow(
      //     offset: Offset(0, 1),
      //     color: Colors.black12,
      //     blurRadius: 10,
      //   )
      // ],
      onCompleted: (v) {
        widget.onCompleted!();
      },
      // onTap: () {
      //   print("Pressed");
      // },
      onChanged: (value) {
        debugPrint(value);
        setState(() {
          //   currentText = value;
        });
      },
      beforeTextPaste: (text) {
        debugPrint("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
    );
  }
}
