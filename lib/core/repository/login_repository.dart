import 'package:flutter/material.dart';
import 'package:notification_app/core/manager/notification_app_URLS.dart';
import 'package:notification_app/core/model/_notification_response_model.dart';
import 'package:notification_app/core/model/app_settings.dart';
import 'package:notification_app/core/repository/_remote_repository.dart';
import 'package:notification_app/locator.dart';

class LoginRepository {
  RemoteRepository _remoteRepository = locator<RemoteRepository>();
  AppSettings _appSettings = locator<AppSettings>();

  Future<NotificationResponseModel> authenticatingUser(
      {@required String userName,
        @required String password,
        @required String latitude,
        @required String longitude}) async {
    Map<String, dynamic> params = {
      "device_type": _appSettings.deviceType,
      "device_unique_key": _appSettings.deviceUniqueKey,
      "username": userName,
      "password": password,
    };
    return await _remoteRepository.OieServPostRequest(
        apiEndPoint: NotificationAppURLS.log_in,
        params: params,
        dataResponseKey: "user_info");
  }

//  Future<OieServicesResponseModel> loginFacebook({@required String emailID,
//    @required String fbUserID,
//    @required String latitude,
//    @required String longitude,
//    @required String userType}) async {
//    Map<String, dynamic> params = {
//      "device_type": _appSettings.deviceType,
//      "device_unique_key": _appSettings.deviceUniqueKey,
//      "fb_email": emailID,
//      "fb_userid": fbUserID,
//      "latitude": latitude,
//      "longitude": longitude,
//      "user_type": userType,
//    };
//    return await _remoteRepository.OieServPostRequest(
//      apiEndPoint: OieServUrls.facebook_login,
//      params: params,
//    );
//  }
}
