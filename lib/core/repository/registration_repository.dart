import 'package:flutter/cupertino.dart';
import 'package:notification_app/core/manager/notification_app_URLS.dart';
import 'package:notification_app/core/model/_notification_response_model.dart';
import 'package:notification_app/core/model/app_settings.dart';
import 'package:notification_app/core/repository/_remote_repository.dart';
import 'package:notification_app/locator.dart';

class RegistrationRepository {
  RemoteRepository _remoteRepository = locator<RemoteRepository>();
  AppSettings _appSettings = locator<AppSettings>();

  Future<NotificationResponseModel> registerUser({
    @required String firstName,
    @required String lastName,
    @required String phoneNumber,
    @required String password,
  }) async {
    Map<String, dynamic> params = {
      "device_type": _appSettings.deviceType,
      "device_id": _appSettings.deviceUniqueKey,
      "first_name": firstName,
      "last_name": lastName,
      "phone": phoneNumber,
      "password": password,
    };
    return await _remoteRepository.NotificationPostRequest(
      apiEndPoint: NotificationAppURLS.registration,
      params: params,
    );
  }
}
