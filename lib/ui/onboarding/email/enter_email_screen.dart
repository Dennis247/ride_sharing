import 'package:flutter/material.dart';
import 'package:ride_sharing/core/utils/colors.dart';
import 'package:ride_sharing/core/utils/navigator.dart';
import 'package:ride_sharing/ui/onboarding/email/enter_email_viewmodel.dart';
import 'package:ride_sharing/ui/onboarding/profile/enter_name_screen.dart';
import 'package:ride_sharing/ui/widgets/appBar/app_bar.dart';
import 'package:ride_sharing/ui/widgets/buttons/app_button.dart';
import 'package:ride_sharing/ui/widgets/textInputs/app_input_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class EnterEmailScreen extends StatefulWidget {
  const EnterEmailScreen({Key? key}) : super(key: key);

  @override
  State<EnterEmailScreen> createState() => _EnterEmailScreenState();
}

class _EnterEmailScreenState extends State<EnterEmailScreen> {
  TextEditingController _textEditingController = new TextEditingController();
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
                  title: "Enter your email",
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(height: 3.5.h),
                      CustomTextField(
                        lableText: "Email",
                        textEditingController: _textEditingController,
                        onChanged: (text) {
                          vm.validateEmail(text);
                        },
                        suffixIcon: SuffixWidget(suffixACtion: () {
                          _textEditingController.clear();
                          vm.validateEmail(_textEditingController.text);
                        }),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Icon(
                            Icons.mail,
                            color: AppColors.primaryColor,
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
              onTap: () {
                AppNavigator.to(context, const EnterNameScreen());
              },
              isDisabled: !vm.isEmailValid,
            ),
          ),
        ),
      ),
    );
  }
}
