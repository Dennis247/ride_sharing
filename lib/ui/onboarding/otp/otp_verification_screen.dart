import 'package:flutter/material.dart';
import 'package:ride_sharing/core/models/country.dart';
import 'package:ride_sharing/core/utils/colors.dart';
import 'package:ride_sharing/core/utils/navigator.dart';
import 'package:ride_sharing/ui/onboarding/phoneNumber/enter_phone_number_viewmodel.dart';
import 'package:ride_sharing/ui/onboarding/profile/profile_option_screen.dart';
import 'package:ride_sharing/ui/onboarding/signUp/sign_up_viewmodel.dart';
import 'package:ride_sharing/ui/widgets/appBar/app_bar.dart';
import 'package:ride_sharing/ui/widgets/buttons/app_button.dart';
import 'package:ride_sharing/ui/widgets/icons/country_icon.dart';
import 'package:ride_sharing/ui/widgets/notofocations/notification_widget.dart';
import 'package:ride_sharing/ui/widgets/textInputs/app_input_widget.dart';
import 'package:ride_sharing/ui/widgets/textInputs/pin_code_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarWidget(
                  title: "Enter code",
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 3.5.h),
                      Text(
                        "An SMS code was sent to",
                        style: TextStyle(
                            fontSize: 1.4.h, color: AppColors.grayDarker),
                      ),
                      Text(
                        context.read<EnterPhoneNumberViewModel>().phoneNumber,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 2.3.h),
                      ),
                      InkWell(
                        onTap: () {
                          NotificationWidgets.showSucessfulSnackBar(
                              context: context, message: "sucessful");
                        },
                        splashColor: AppColors.whiteShade,
                        child: Text(
                          "Edit phone number",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 1.4.h),
                        ),
                      ),
                      SizedBox(
                        height: 3.0.h,
                      ),
                      PinCodeWidget(
                        onCompleted: () {
                          AppNavigator.to(context, ProfileOptionScreen());
                        },
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 5.0.h),
            child: const Text(
              "Resend Code",
              style: TextStyle(
                  color: AppColors.primaryColor, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
