import 'package:flutter/material.dart';
import 'package:ride_sharing/core/models/app_models.dart';
import 'package:ride_sharing/core/models/country.dart';
import 'package:ride_sharing/core/models/key_value.dart';
import 'package:provider/provider.dart';
import 'package:ride_sharing/core/utils/colors.dart';
import 'package:ride_sharing/ui/widgets/appBar/app_bar.dart';
import 'package:ride_sharing/ui/widgets/textInputs/app_input_widget.dart';
import 'package:sizer/sizer.dart';

class CountryDialogueWidget extends StatelessWidget {
  const CountryDialogueWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CountryDialogueViewModel>().setOriginalList();
    return Consumer<CountryDialogueViewModel>(
      builder: ((context, value, child) => Scaffold(
            body: SafeArea(
              child: SizedBox(
                height: 100.0.h,
                child: Column(
                  children: [
                    const AppBarWidget(title: "Select your country"),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          SizedBox(height: 3.5.h),
                          CustomTextField(
                            lableText: "Search for a country",
                            onChanged: (text) {
                              value.filterList(text);
                            },
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              child: Icon(
                                Icons.search,
                                color: AppColors.blackShade1,
                                size: 13.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 0.5.h),
                          Expanded(
                            child: ListView.separated(
                              itemCount: value.filteredList.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    value.setSelectedItem(
                                        value.filteredList[index]);
                                    Navigator.of(context)
                                        .pop(value.filteredList[index]);
                                  },
                                  child: SearchItemTile(
                                      item: value.filteredList[index],
                                      isSelected: false
                                      //    value.filteredList[index] == value.selectedItem,
                                      ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Container(
                                  color: AppColors.grayLight,
                                  height: 1,
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 2.5.h),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class SearchItemTile extends StatelessWidget {
  final CountryCode item;
  final bool isSelected;
  const SearchItemTile({Key? key, required this.item, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                item.flagUri!,
                height: 2.0.h,
                width: 6.0.w,
              ),
              SizedBox(
                width: 3.0.w,
              ),
              Text(
                item.name!,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 1.4.h),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Text(
            item.dialCode!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class CountryDialogueViewModel extends ChangeNotifier {
  CountryCode? _selectedItem = CountryCode();
  CountryCode get selectedItem => _selectedItem!;

  List<CountryCode> _filteredList = AppModels.allCountries;
  List<CountryCode> get filteredList => _filteredList;

  List<CountryCode> _originalList = AppModels.allCountries;
  List<CountryCode> get originalList => _originalList;

  setOriginalList() {
    _originalList = AppModels.allCountries;
    _filteredList = _originalList;
  }

  setSelectedItem(CountryCode value) {
    _selectedItem = value;
  }

  void clearSelectedItem() {
    _selectedItem = CountryCode();
  }

  void filterList(String value) {
    if (value.isEmpty) {
      _filteredList = _originalList;
    } else {
      _filteredList = _originalList
          .where((CountryCode element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()) ||
              element.dialCode!
                  .toString()
                  .toLowerCase()
                  .contains(value.toLowerCase()))
          .toList();
    }

    notifyListeners();
  }
}
