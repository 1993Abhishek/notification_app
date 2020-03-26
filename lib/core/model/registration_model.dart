class RegistrationModel {
  String _firstName = "";
  String _lastName = "";
  String _mobileNumber = "";
  String _password = "";

  String _firstNameError = "";
  String _lastNameError = "";
  String _mobileNumberError = "";
  String _passwordError = "";

  void clearAllError() {
    _firstNameError = "";
    _lastNameError = "";
    _mobileNumberError = "";
    _passwordError = "";
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  String get lastName => _lastName;

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get mobileNumber => _mobileNumber;

  set mobileNumber(String value) {
    _mobileNumber = value;
  }

  set lastName(String value) {
    _lastName = value;
  }

  String get firstNameError => _firstNameError;

  set firstNameError(String value) {
    _firstNameError = value;
  }

  String get lastNameError => _lastNameError;

  set lastNameError(String value) {
    _lastNameError = value;
  }

  String get mobileNumberError => _mobileNumberError;

  set mobileNumberError(String value) {
    _mobileNumberError = value;
  }

  String get passwordError => _passwordError;

  set passwordError(String value) {
    _passwordError = value;
  }

  @override
  String toString() {
    return 'RegistrationModel{_firstName: $_firstName, _lastName: $_lastName, _mobileNumber: $_mobileNumber, _password: $_password, _firstNameError: $_firstNameError, _lastNameError: $_lastNameError, _mobileNumberError: $_mobileNumberError, _passwordError: $_passwordError,}';
  }
}
