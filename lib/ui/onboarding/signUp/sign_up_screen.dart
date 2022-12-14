import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ride_sharing/core/utils/colors.dart';
import 'package:ride_sharing/core/utils/navigator.dart';
import 'package:ride_sharing/ui/onboarding/email/enter_email_screen.dart';
import 'package:ride_sharing/ui/onboarding/phoneNumber/enter_phone_number_screen.dart';
import 'package:ride_sharing/ui/onboarding/phoneNumber/enter_phone_number_viewmodel.dart';
import 'package:ride_sharing/ui/onboarding/signUp/sign_up_viewmodel.dart';
import 'package:ride_sharing/ui/widgets/buttons/app_button.dart';
import 'package:ride_sharing/ui/widgets/custom/divider_widget.dart';
import 'package:ride_sharing/ui/widgets/custom/social_widget.dart';
import 'package:ride_sharing/ui/widgets/dialogues/country_dialogue.dart';
import 'package:ride_sharing/ui/widgets/dialogues/search_dialogues.dart';
import 'package:ride_sharing/ui/widgets/icons/country_icon.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SizedBox(
          height: 100.0.h,
          width: 100.0.h,
          child: Consumer<SignUpViewModel>(
            builder: (context, vm, child) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.0.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Enter your number",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 2.0.h),
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  GestureDetector(
                    onTap: () => AppNavigator.to(
                        context, const EnterPhoneNumberScreen()),
                    child: Container(
                        width: 100.0.w,
                        height: 7.0.h,
                        decoration: const BoxDecoration(
                            color: AppColors.whiteShade,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          children: [
                            const CountrIconWidget(),
                            Consumer<EnterPhoneNumberViewModel>(
                              builder: (context, phhnVm, child) => Text(
                                phhnVm.phoneNumber,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 1.8.h),
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const DividerWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Text(
                          "OR",
                          style: TextStyle(
                              color: AppColors.grayDarker, fontSize: 1.8.h),
                        ),
                      ),
                      const DividerWidget()
                    ],
                  ),
                  SizedBox(
                    height: 2.5.h,
                  ),
                  const SocialWidget(
                      title: 'Sign in with Google',
                      icon: FontAwesomeIcons.google),
                  SizedBox(
                    height: 2.0.h,
                  ),
                  const SocialWidget(
                      title: 'Sign in with facebook',
                      icon: FontAwesomeIcons.facebookF),
                  SizedBox(
                    height: 5.0.h,
                  ),

                  // SizedBox(
                  //   width: 100.0.w,
                  //   height: 10.0.h,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       AppButton(
                  //           title: "Goto",
                  //           onTap: () {
                  //             AppNavigator.to(
                  //                 context,
                  //                 CountryDialogueWidget(
                  //                     sourceList: vm.countries,
                  //                     title: "Select your country",
                  //                     label: 'search for a country'));
                  //           })
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            "By creating a new account, You have accepted our Terms & Conditions and Privacy policy.",
            style: TextStyle(color: AppColors.grayDarker, fontSize: 1.5.h),
          ),
        ),
      ),
    );
  }
}
