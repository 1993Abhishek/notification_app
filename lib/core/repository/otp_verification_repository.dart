import 'package:flutter/material.dart';
import 'package:notification_app/core/manager/notification_app_URLS.dart';
import 'package:notification_app/core/model/_notification_response_model.dart';
import 'package:notification_app/core/model/app_settings.dart';
import 'package:notification_app/core/repository/_remote_repository.dart';
import 'package:notification_app/locator.dart';

class OTPVerificationRepository {
  RemoteRepository _remoteRepository = locator<RemoteRepository>();

  Future<NotificationResponseModel> verifyOTP(
      {
        @required String phoneNo,
        @required String otpCode}) async {
    Map<String, dynamic> params = {
      "phone": phoneNo,
      "OTP": otpCode
    };
    return await _remoteRepository.NotificationPostRequest(
      apiEndPoint: NotificationAppURLS.otp_verify,
      params: params,
    );
  }

//  Future<NotificationResponseModel> resendOTP(
//      {@required String userName, @required String otpType}) async {
//    Map<String, dynamic> params = {
//      "phone": userName,
//      "OTP": otpCode,
//    };
//    return await _remoteRepository.NotificationPostRequest(
//      apiEndPoint: NotificationAppURLS.otp_verify,
//      params: params,
//    );
//  }

}
