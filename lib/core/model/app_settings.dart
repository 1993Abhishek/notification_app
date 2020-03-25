class AppSettings {
  String _deviceType;
  String _deviceUniqueKey;
  String _devicePushKey;
  String _userID;
  String _userPassword;
  bool _isRememberMe;

  AppSettings() {
    _deviceType = "";
    _deviceUniqueKey = "";
    _devicePushKey = "";
    _userID = "";
    _userPassword = "";
    _isRememberMe = false;
  }

  String get deviceType => _deviceType;

  set deviceType(String value) {
    _deviceType = value;
  }

  String get deviceUniqueKey => _deviceUniqueKey;

  String get devicePushKey => _devicePushKey;

  set devicePushKey(String value) {
    _devicePushKey = value;
  }

  set deviceUniqueKey(String value) {
    _deviceUniqueKey = value;
  }


  String get userID => _userID;

  set userID(String value) {
    _userID = value;
  }

  String get userPassword => _userPassword;

  set userPassword(String value) {
    _userPassword = value;
  }

  bool get isRememberMe => _isRememberMe;

  set isRememberMe(bool value) {
    _isRememberMe = value;
  }

  @override
  String toString() {
    return 'AppSettings{_deviceType: $_deviceType, _deviceUniqueKey: $_deviceUniqueKey, _devicePushKey: $_devicePushKey, _userID: $_userID, _userPassword: $_userPassword, _hasAutoLogin: $_isRememberMe}';
  }


}
