import 'package:flutter/material.dart';
import 'package:notification_app/core/enums/view_state.dart';
import 'package:notification_app/core/model/_notification_response_model.dart';
import 'package:notification_app/core/repository/otp_verification_repository.dart';
import 'package:notification_app/core/viewmodel/_base_model.dart';

class OTPVerificationViewModel extends BaseModel {
  OTPVerificationRepository _repository = OTPVerificationRepository();
  NotificationResponseModel resendOTPResponse;

  Future<NotificationResponseModel> verifyOTP(
      {
        @required String phoneNo,
        @required String otpCode}) async {
    setState(ViewState.Busy);
    NotificationResponseModel responseModel = await _repository.verifyOTP(
        phoneNo: phoneNo,
        otpCode: otpCode);
    setState(ViewState.Idle);
    return responseModel;
  }
//  Future<NotificationResponseModel> resendOTP(
//      {@required String userName, @required String otpType}) async {
//    setState(ViewState.Busy);
//    resendOTPResponse =
//    await _repository.resendOTP(userName: userName, otpType: otpType);
//    setState(ViewState.Idle);
//    return resendOTPResponse;
//  }
}
