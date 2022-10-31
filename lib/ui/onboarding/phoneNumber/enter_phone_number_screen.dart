// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ride_sharing/core/models/country.dart';
import 'package:ride_sharing/core/utils/colors.dart';
import 'package:ride_sharing/core/utils/navigator.dart';
import 'package:ride_sharing/ui/onboarding/otp/otp_verification_screen.dart';
import 'package:ride_sharing/ui/onboarding/phoneNumber/enter_phone_number_viewmodel.dart';
import 'package:ride_sharing/ui/onboarding/signUp/sign_up_viewmodel.dart';
import 'package:ride_sharing/ui/widgets/appBar/app_bar.dart';
import 'package:ride_sharing/ui/widgets/buttons/app_button.dart';
import 'package:ride_sharing/ui/widgets/icons/country_icon.dart';
import 'package:ride_sharing/ui/widgets/textInputs/app_input_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class EnterPhoneNumberScreen extends StatefulWidget {
  const EnterPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<EnterPhoneNumberScreen> createState() => _EnterPhoneNumberScreenState();
}

class _EnterPhoneNumberScreenState extends State<EnterPhoneNumberScreen> {
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    _controller.text = context.read<EnterPhoneNumberViewModel>().phoneNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EnterPhoneNumberViewModel>(
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
                          lableText: "Phone number",
                          textEditingController: _controller,
                          suffixIcon: SuffixWidget(suffixACtion: () {
                            _controller.clear();
                            vm.validatePhoneNumber(_controller.text);
                          }),
                          onChanged: (text) {
                            vm.validatePhoneNumber(text);
                          },
                          prefix: const CountrIconWidget()),
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
                isDisabled: !vm.isPhoneNumberValid,
                onTap: () {
                  AppNavigator.to(context, const OtpVerificationScreen());
                }),
          ),
        ),
      ),
    );
  }
}
