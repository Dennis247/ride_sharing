import 'package:flutter/material.dart';
import 'package:ride_sharing/core/utils/colors.dart';
import 'package:ride_sharing/core/utils/navigator.dart';
import 'package:ride_sharing/ui/onboarding/email/enter_email_screen.dart';
import 'package:ride_sharing/ui/onboarding/phoneNumber/enter_phone_number_screen.dart';
import 'package:ride_sharing/ui/onboarding/phoneNumber/enter_phone_number_viewmodel.dart';
import 'package:ride_sharing/ui/onboarding/signUp/sign_up_viewmodel.dart';
import 'package:ride_sharing/ui/widgets/buttons/app_button.dart';
import 'package:ride_sharing/ui/widgets/dialogues/country_dialogue.dart';
import 'package:ride_sharing/ui/widgets/dialogues/search_dialogues.dart';
import 'package:ride_sharing/ui/widgets/icons/country_icon.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

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
                        fontSize: 2.5.h),
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
                            CountrIconWidget(),
                            Consumer<EnterPhoneNumberViewModel>(
                              builder: (context, phhnVm, child) => Text(
                                phhnVm.phoneNumber,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 2.0.h),
                              ),
                            )
                          ],
                        )),
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
      ),
    );
  }
}
