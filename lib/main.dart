import 'package:flutter/material.dart';
import 'package:ride_sharing/ui/home/home_screen.dart';
import 'package:ride_sharing/ui/onboarding/email/enter_email_viewmodel.dart';
import 'package:ride_sharing/ui/onboarding/phoneNumber/enter_phone_number_screen.dart';
import 'package:ride_sharing/ui/onboarding/phoneNumber/enter_phone_number_viewmodel.dart';
import 'package:ride_sharing/ui/onboarding/signUp/sign_up_screen.dart';
import 'package:ride_sharing/ui/onboarding/signUp/sign_up_viewmodel.dart';
import 'package:ride_sharing/ui/widgets/dialogues/country_dialogue.dart';
import 'package:ride_sharing/ui/widgets/dialogues/search_dialogues.dart';
import 'package:ride_sharing/ui/widgets/icons/country_icon.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

import 'core/models/app_models.dart';
import 'core/models/country.dart';
import 'core/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    AppModels.allCountries = CountryCode.getCountryLIst();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SearchDialogueViewModel()),
          ChangeNotifierProvider(create: (_) => SignUpViewModel()),
          ChangeNotifierProvider(create: (_) => CountryDialogueViewModel()),
          ChangeNotifierProvider(create: (_) => EnterPhoneNumberViewModel()),
          ChangeNotifierProvider(create: (_) => EnterEmailViewModel()),
          ChangeNotifierProvider(create: (_) => CountrIconViewModel()),
        ],
        child: MaterialApp(
            title: 'Ride Sharing',
            theme: AppTheme.theme,
            home: const SignUpScreen()),
      );
    });
  }
}
