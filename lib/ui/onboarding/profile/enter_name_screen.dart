import 'package:flutter/material.dart';
import 'package:ride_sharing/core/utils/colors.dart';
import 'package:ride_sharing/ui/onboarding/email/enter_email_viewmodel.dart';
import 'package:ride_sharing/ui/onboarding/profile/enter_name_viewmodel.dart';
import 'package:ride_sharing/ui/widgets/appBar/app_bar.dart';
import 'package:ride_sharing/ui/widgets/buttons/app_button.dart';
import 'package:ride_sharing/ui/widgets/textInputs/app_input_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EnterNameScreen extends StatefulWidget {
  const EnterNameScreen({Key? key}) : super(key: key);

  @override
  State<EnterNameScreen> createState() => _EnterNameScreenState();
}

class _EnterNameScreenState extends State<EnterNameScreen> {
  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<EnterNameViewModel>(
      builder: (context, vm, child) => SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarWidget(
                  title: "What's your name",
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 3.5.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              lableText: "First Name",
                              textEditingController: _firstNameController,
                              onChanged: (text) {
                                vm.setFirstName(text);
                              },
                              suffixIcon: SuffixWidget(suffixACtion: () {
                                _firstNameController.clear();
                                vm.setFirstName(_firstNameController.text);
                              }),
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                child: Icon(
                                  Icons.person_outline,
                                  color: AppColors.primaryColor,
                                  size: 13.sp,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.0.w,
                          ),
                          Expanded(
                            child: CustomTextField(
                              lableText: "Last Name",
                              textEditingController: _lastNameController,
                              onChanged: (text) {
                                vm.setLasttName(text);
                              },
                              suffixIcon: SuffixWidget(suffixACtion: () {
                                _lastNameController.clear();
                                vm.setLasttName(_lastNameController.text);
                              }),
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                child: Icon(
                                  Icons.person_outline,
                                  color: AppColors.primaryColor,
                                  size: 13.sp,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 3.5.h),
                      Text(
                          "You will be identified by your first name and last name.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: AppColors.grayDarker, fontSize: 1.5.h))
                    ],
                  ),
                ))
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 5.0.h),
            child: AppButton(
              title: 'Done',
              onTap: () {},
              isDisabled: !vm.isFirstNameLastNameValid,
            ),
          ),
        ),
      ),
    );
  }
}
