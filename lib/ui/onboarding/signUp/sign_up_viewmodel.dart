import 'package:flutter/cupertino.dart';
import 'package:ride_sharing/core/models/app_models.dart';
import 'package:ride_sharing/core/models/country.dart';

import 'package:ride_sharing/core/models/key_value.dart';

class SignUpViewModel extends ChangeNotifier {
  CountryCode? _selectedCountry;
  CountryCode? get selectedCountry => _selectedCountry;

  setSelectedCountry() {
    _selectedCountry = AppModels.allCountries
        .firstWhere((element) => element.dialCode == "+234");
  }
}
