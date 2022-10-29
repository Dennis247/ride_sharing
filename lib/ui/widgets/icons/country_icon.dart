import 'package:flutter/material.dart';
import 'package:ride_sharing/core/models/app_models.dart';
import 'package:ride_sharing/core/models/country.dart';
import 'package:ride_sharing/core/utils/navigator.dart';
import 'package:ride_sharing/ui/widgets/dialogues/country_dialogue.dart';
import 'package:ride_sharing/ui/widgets/dialogues/search_dialogues.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

class CountrIconWidget extends StatelessWidget {
  const CountrIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countryVm = context.read<CountrIconViewModel>();
    if (countryVm.selectedCountry == null) {
      final code = AppModels.allCountries
          .firstWhere((element) => element.dialCode == "+234");
      countryVm.initializeSelectedCountry(code);
    }
    return Consumer<CountrIconViewModel>(
      builder: (context, vm, child) => GestureDetector(
        onTap: () async {
          CountryCode? result = await Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const CountryDialogueWidget()));
          if (result != null) {
            vm.setSelectedCountry(result);
          }
        },
        child: SizedBox(
          width: 25.0.w,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Image.asset(
                  vm.selectedCountry!.flagUri!,
                  height: 4.0.h,
                  width: 4.0.h,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  size: 2.0.h,
                ),
                Text(
                  vm.selectedCountry!.dialCode!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CountrIconViewModel extends ChangeNotifier {
  CountryCode? _selectedCountry;
  CountryCode? get selectedCountry => _selectedCountry;

  setSelectedCountry(CountryCode code) {
    _selectedCountry = code;
    notifyListeners();
  }

  initializeSelectedCountry(CountryCode code) {
    _selectedCountry = code;
  }
}
