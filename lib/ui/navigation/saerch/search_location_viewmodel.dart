import 'package:flutter/material.dart';
import 'package:ride_sharing/core/models/auto_sugesstion.dart';
import 'package:ride_sharing/core/services/map_services.dart';

class SearchLocationViewModel with ChangeNotifier {
  bool _isMylocationSelected = false;
  bool get isMylocationSelected {
    return _isMylocationSelected;
  }

  List<AutoSuggestion> _autoSuggestionsList = [];
  List<AutoSuggestion> get autoSuggestionsList {
    return _autoSuggestionsList;
  }

  AutoSuggestion? _mylocationAddress;
  AutoSuggestion? get ylocationAddress => _mylocationAddress;

  AutoSuggestion? _myDestinationAddress;
  AutoSuggestion? get myDestinationAddress => _myDestinationAddress;

  void setIsMyLocationSelected(bool value) {
    _isMylocationSelected = value;
  }

  void searchPlace(String query) async {
    _autoSuggestionsList.clear();
    _autoSuggestionsList = await MapServices.searchPlace(query);
    notifyListeners();
  }

  Future<void> setSugesstion(AutoSuggestion autoSuggestion,
      {bool notify = false}) async {
    if (_isMylocationSelected) {
      _mylocationAddress = autoSuggestion;
    } else {
      _myDestinationAddress = autoSuggestion;
    }
    if (notify) notifyListeners();
  }
}
