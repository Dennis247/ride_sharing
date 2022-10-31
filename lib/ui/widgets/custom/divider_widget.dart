import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ride_sharing/core/utils/colors.dart';
import 'package:sizer/sizer.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38.0.w,
      height: 0.1.h,
      color: AppColors.grayLighter,
    );
  }
}
