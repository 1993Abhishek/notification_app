import 'package:flutter/cupertino.dart';
import 'package:notification_app/core/enums/view_state.dart';
import 'package:notification_app/core/model/_notification_response_model.dart';
import 'package:notification_app/core/model/user_login_model.dart';
import 'package:notification_app/core/repository/login_repository.dart';
import 'package:notification_app/core/viewmodel/_base_model.dart';
import 'package:notification_app/core/helper/extension_helper.dart';
import 'package:notification_app/locator.dart';

class LoginViewModel extends BaseModel {
  LoginRepository _repository = LoginRepository();
//  OTPVerificationRepository _repositoryOTPVerification =
//  OTPVerificationRepository();
  UserLoginModel loginModel = locator<UserLoginModel>();
//  ContactInfo contactInfo = locator<ContactInfo>();
  String errorPhoneNumber = "";
  String errorPassword = "";
  bool isCheckingOn = false;
  bool isRememberMe = false;

  bool checkValidation() {
    bool isValidationSuccess = false;
    errorPhoneNumber = "";
    errorPassword = "";
    isCheckingOn = true;
    if (loginModel.userLoginID.isEmpty) {
      errorPhoneNumber = "Please enter your phone number.";
    } else if (!loginModel.userLoginID
        .generateRawPhoneNumber()
        .isValidPhoneNumber()) {
      errorPhoneNumber = "Please enter a valid phone number.";
    }
    /*else
    if (!loginModel.userLoginID.generateRawPhoneNumber().isPhoneNumber() &&
        !loginModel.userLoginID.isValidEmail()) {
      errorEmailPhoneNumber = "Please enter a valid email Id.";
    }*/
    else if (loginModel.userLoginPassword.isEmpty) {
      errorPassword = "Please enter your password.";
    } else {
      isCheckingOn = false;
      isValidationSuccess = true;
    }
    notifyListeners();
    return isValidationSuccess;
  }

  Future<NotificationResponseModel> authenticatingUser({
    @required String userName,
    @required String password,
  }) async {
    setState(ViewState.Busy);
    NotificationResponseModel response = await _repository.authenticatingUser(
        userName: userName,
        password: loginModel.userLoginPassword.trim(),
    );
    setState(ViewState.Idle);
    return response;
  }


//  Future<NotificationResponseModel> resendOTP(
//      {@required String userID, @required String otpType}) async {
//    setState(ViewState.Busy);
//    NotificationResponseModel resendOTPResponse =
//    await _repositoryOTPVerification.resendOTP(
//        userName: userID.generateRawPhoneNumber(), otpType: otpType);
//    setState(ViewState.Idle);
//    return resendOTPResponse;
//  }
}