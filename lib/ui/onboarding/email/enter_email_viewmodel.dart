import 'package:flutter/cupertino.dart';

class EnterEmailViewModel extends ChangeNotifier {
  String _email = "";
  String get email => _email;

  bool _isEmailValid = false;
  bool get isEmailValid => _isEmailValid;

  validateEmail(String email) {
    //Todo validate Email
    _isEmailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    notifyListeners();
  }
}
