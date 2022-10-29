import 'package:flutter/material.dart';
import 'package:ride_sharing/core/utils/colors.dart';
import 'package:ride_sharing/ui/onboarding/email/enter_email_viewmodel.dart';
import 'package:ride_sharing/ui/widgets/appBar/app_bar.dart';
import 'package:ride_sharing/ui/widgets/buttons/app_button.dart';
import 'package:ride_sharing/ui/widgets/textInputs/app_input_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class EnterEmailScreen extends StatelessWidget {
  const EnterEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EnterEmailViewModel>(
      builder: (context, vm, child) => SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SizedBox(
            child: Column(
              children: [
                const AppBarWidget(
                  title: "Enter your phone number",
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(height: 3.5.h),
                      CustomTextField(
                        lableText: "Email",
                        onChanged: (text) {
                          vm.validateEmail(text);
                        },
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Icon(
                            Icons.mail,
                            color: AppColors.blackShade1,
                            size: 13.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 0.5.h),
                    ],
                  ),
                ))
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 5.0.h),
            child: AppButton(
              title: 'Continue',
              onTap: () {},
              isDisabled: !vm.isEmailValid,
            ),
          ),
        ),
      ),
    );
  }
}
