import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ride_sharing/core/utils/colors.dart';

import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final String? lableText;
  final String? hintText;
  final TextInputType? textInputType;
  final bool obscure;
  final bool? isPasswordTextField;
  final TextEditingController? textEditingController;
  final int? inputLimit;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final int maxLines;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? suffixText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final Function()? onTap;
  final AutovalidateMode? autovalidateMode;
  final String? errorText;
  final bool? filled;
  final Color? fillColor;
  final bool isMultipleLine;

  const CustomTextField({
    Key? key,
    this.lableText,
    this.hintText,
    this.textInputType,
    this.obscure = false,
    this.isPasswordTextField,
    this.textEditingController,
    this.inputLimit,
    this.inputFormatters,
    this.readOnly = false,
    this.maxLines = 1,
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixText,
    this.validator,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.onTap,
    this.autovalidateMode,
    this.errorText,
    this.filled,
    this.fillColor,
    this.isMultipleLine = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //autofocus: true,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 2.0.h),
      keyboardType: textInputType,
      obscureText: obscure,
      maxLength: inputLimit,
      textInputAction: textInputAction,
      onTap: onTap,
      maxLines: (obscure == true) ? 1 : maxLines,
      controller: textEditingController,
      validator: validator,
      onChanged: onChanged,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        isDense: true,
        counterText: "",
        filled: filled,
        fillColor: fillColor,
        errorText: errorText,
        errorStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontSize: 1.4.h, color: Colors.red),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColors.grayDarker, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 0.5),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
        labelText: lableText,
        hintText: hintText,
        prefix: prefix,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 20,
          minHeight: 20,
        ),
        suffixText: suffixText,
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 25,
          minHeight: 25,
        ),
        suffixStyle:
            Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 1.9.h),
        hintStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontSize: 1.7.h, color: const Color(0xFF918D8D)),
        labelStyle: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: const Color(0xFF918D8D), fontSize: 8.sp),
      ),
    );
  }
}
