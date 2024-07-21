import 'package:hive/hive.dart';

class AuthService {
  static const String _loginBox = 'loginBox';
  static const String _isLoggedInKey = 'isLoggedIn';

  // Method to set login state
  Future<void> setLoginState(bool isLoggedIn) async {
    var box = Hive.box(_loginBox);
    await box.put(_isLoggedInKey, isLoggedIn);
  }

  // Method to get login state
  bool getLoginState() {
    var box = Hive.box(_loginBox);
    return box.get(_isLoggedInKey, defaultValue: false);
  }
}
