import 'package:flutter/material.dart';
import 'package:ride_sharing/core/models/key_value.dart';
import 'package:provider/provider.dart';
import 'package:ride_sharing/core/utils/colors.dart';
import 'package:ride_sharing/ui/widgets/textInputs/app_input_widget.dart';
import 'package:sizer/sizer.dart';

class SearchDialogueWidget extends StatefulWidget {
  final List<KeyValue> sourceList;
  final String title;
  final String label;
  const SearchDialogueWidget(
      {Key? key,
      required this.sourceList,
      required this.title,
      required this.label})
      : super(key: key);

  @override
  State<SearchDialogueWidget> createState() => _SearchDialogueWidgetState();
}

class _SearchDialogueWidgetState extends State<SearchDialogueWidget> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.read<SearchDialogueViewModel>();
    vm.setOriginalList(widget.sourceList);
    return Consumer<SearchDialogueViewModel>(
      builder: ((context, value, child) => Scaffold(
            body: SafeArea(
              child: SizedBox(
                height: 100.0.h,
                child: Column(
                  children: [
                    SizedBox(height: 2.5.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 3.0.h,
                                color: AppColors.blackShade1,
                              )),
                          SizedBox(
                            width: 2.0.w,
                          ),
                          Text(
                            widget.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 2.2.h,
                                    fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          SizedBox(height: 3.5.h),
                          CustomTextField(
                            textEditingController: _searchController,
                            lableText: widget.label,
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
  final KeyValue item;
  final bool isSelected;
  const SearchItemTile({Key? key, required this.item, required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.8.h),
      child: Row(
        children: [
          SizedBox(
            width: 70.0.w,
            child: Text(
              item.key,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 1.5.h),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchDialogueViewModel extends ChangeNotifier {
  KeyValue? _selectedItem = KeyValue(key: "", value: "");
  KeyValue get selectedItem => _selectedItem!;

  List<KeyValue> _filteredList = [];
  List<KeyValue> get filteredList => _filteredList;

  List<KeyValue> _originalList = [];
  List<KeyValue> get originalList => _originalList;

  setOriginalList(List<KeyValue> list) {
    _originalList = list;
    _filteredList = _originalList;
  }

  setSelectedItem(KeyValue value) {
    _selectedItem = value;
  }

  void clearSelectedItem() {
    _selectedItem = KeyValue(key: "", value: "");
  }

  void filterList(String value) {
    if (value.isEmpty) {
      _filteredList = _originalList;
    } else {
      _filteredList = _originalList
          .where((element) =>
              element.key.toLowerCase().contains(value.toLowerCase()) ||
              element.value
                  .toString()
                  .toLowerCase()
                  .contains(value.toLowerCase()))
          .toList();
    }

    notifyListeners();
  }
}
