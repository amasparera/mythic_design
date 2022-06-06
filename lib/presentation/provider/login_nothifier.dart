import 'package:flutter/cupertino.dart';

class LoginNothifier extends ChangeNotifier {
  bool _isLogin = true;
  bool get isLogin => _isLogin;

  void swipLogin() {
    _isLogin = !isLogin;
    notifyListeners();
  }
}
