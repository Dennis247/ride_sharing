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

class ProfileOptionScreen extends StatelessWidget {
  const ProfileOptionScreen({Key? key}) : super(key: key);

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
                    "Set up your profile",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 2.0.h),
                  ),
                  SizedBox(
                    height: 5.0.h,
                  ),
                  AppButton(
                      title: "Continue with email",
                      onTap: () {
                        AppNavigator.to(context, const EnterEmailScreen());
                      }),
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
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.all(30.0),
        ),
      ),
    );
  }
}
