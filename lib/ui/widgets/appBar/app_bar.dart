import 'package:flutter/material.dart';
import 'package:ride_sharing/core/utils/colors.dart';
import 'package:sizer/sizer.dart';

class AppBarWidget extends StatelessWidget {
  final String? title;
  const AppBarWidget({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.5.h),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 3.0.h,
                    color: AppColors.blackShade1,
                  )),
              SizedBox(
                width: 2.0.w,
              ),
              Text(
                title!,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 2.2.h, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
