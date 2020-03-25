import 'package:flutter/cupertino.dart';
import 'package:geocoder/model.dart';

extension StringOperation on String {
  bool isValidEmail() {
    String emailRegEx =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(emailRegEx);
    debugPrint("email id ==>$this");
    return regExp.hasMatch(this);
  }

  String generateRawPhoneNumber() {
    return this.replaceAll("+975-", "");
  }


  String formatPhoneNumberWithCountryCode() {
    return "+975-" + this;
  }

  bool isValidPassword() {
    return this.length >= 8;
  }

  bool isValidPhoneNumber() {
    return this.length == 8;
  }

  bool isPhoneNumber() {
    return this.isNumeric();
  }

  bool isNumeric() {
    if (this == null || this.isEmpty) return false;
    try {
      double.parse(this);
      return true;
    } on Exception {
      return false;
    }
  }

  double toDouble() {
    try {
      var value = double.parse(this);
      return value;
    } on Exception {
      return 0.0;
    }
  }

  int toInt() {
    try {
      var value = int.parse(this);
      return value;
    } on Exception {
      return 0;
    }
  }

}

extension GeoCodingAddress on Address{

  String generateAddress() {


  }
}
