import 'package:flutter/cupertino.dart';

class EnterPhoneNumberViewModel extends ChangeNotifier {
  String _phoneNumber = "";
  String get phoneNumber => _phoneNumber;

  bool _isPhoneNumberValid = false;
  bool get isPhoneNumberValid => _isPhoneNumberValid;

  validatePhoneNumber(String phoneNumber) {
    _phoneNumber = phoneNumber;
    _isPhoneNumberValid =
        RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
            .hasMatch(phoneNumber);
    notifyListeners();
  }
}
