import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ride_sharing/core/utils/colors.dart';
import 'package:sizer/sizer.dart';

class AppButton extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final double curveRadius;
  final Function onTap;
  final Color buttonColor;
  final bool isDisabled;
  final Color disabledColor;
  final bool isLoading;
  final TextStyle? textStyle;

  const AppButton({
    Key? key,
    required this.title,
    this.width,
    required this.onTap,
    this.isDisabled = false,
    this.disabledColor = const Color(0xffe6eefc),
    this.buttonColor = const Color(0xff1152FD),
    this.isLoading = false,
    this.height,
    this.curveRadius = 10.0,
    this.textStyle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: isDisabled ? AppColors.grayLightest2 : AppColors.primaryColor,
      minWidth: width ?? 90.0.w,
      height: height ?? 6.5.h,
      elevation: isDisabled ? 0 : 5,
      shape: const StadiumBorder(),
      onPressed: () {
        if (!isDisabled) {
          onTap();
        }
      },
      child: isLoading
          ? Lottie.asset("assets/lottie/loader.json")
          : Text(
              title,
              style: isDisabled
                  ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.grayDark,
                      fontSize: 2.3.h)
                  : Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                      fontSize: 2.3.h),
            ),
    );

    InkWell(
      onTap: isDisabled == false ? () => onTap() : null,
      child: Container(
        width: width ?? 80.0.w,
        height: height ?? 6.0.h,
        decoration: BoxDecoration(
          color: isDisabled == false ? buttonColor : disabledColor,
          borderRadius: BorderRadius.circular(curveRadius),
        ),
        child: Center(
          //  child: Text(title, style: AppStyles.appLightTextStyle),
          child: isLoading
              ? Lottie.asset("assets/lottie/loader.json")
              : Text(title,
                  style: textStyle ?? Theme.of(context).textTheme.bodyText1),
        ),
      ),
    );
  }
}
