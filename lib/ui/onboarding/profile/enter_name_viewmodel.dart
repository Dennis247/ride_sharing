import 'package:flutter/cupertino.dart';

class EnterNameViewModel extends ChangeNotifier {
  String _firstName = "";
  String get firstName => _firstName;

  String _lastName = "";
  String get lastName => _lastName;

  bool _isFirstNameLastNameValid = false;
  bool get isFirstNameLastNameValid => _isFirstNameLastNameValid;

  void setFirstName(String value) {
    _firstName = value;
    istNameValid();
  }

  void setLasttName(String value) {
    _lastName = value;
    istNameValid();
  }

  istNameValid() {
    _isFirstNameLastNameValid = _firstName.isNotEmpty && _lastName.isNotEmpty;
    notifyListeners();
  }
}
