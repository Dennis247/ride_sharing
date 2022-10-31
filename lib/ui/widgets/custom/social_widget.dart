import 'package:flutter/material.dart';
import 'package:ride_sharing/core/utils/colors.dart';
import 'package:sizer/sizer.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.5.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 0.7, color: AppColors.grayDefault)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            icon,
            color: AppColors.primaryColor,
          ),
          Text(title),
          const SizedBox()
        ],
      ),
    );
  }
}
