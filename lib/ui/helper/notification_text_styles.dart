import 'package:flutter/material.dart';
import 'package:notification_app/ui/helper/app_colors.dart';
import 'package:notification_app/ui/helper/app_dimen.dart';

class NotificationServicesTextStyles {
  static final TextStyle defaultButtonTextStyle = TextStyle(
      fontStyle: FontStyle.normal,
      color: AppColor.colorPrimary,
      fontWeight: FontWeight.w600,
      fontSize: AppDimen.TEXT_SIZE_16);

  static final TextStyle defaultButtonTextStyleWhite = TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: AppDimen.TEXT_SIZE_16);

  static final TextStyle buttonTextStyleWhite = TextStyle(
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: AppDimen.TEXT_SIZE_14);


}
