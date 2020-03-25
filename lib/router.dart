import 'package:flutter/cupertino.dart';
import 'package:notification_app/core/enums/otp_verification_type.dart';
import 'package:notification_app/log_in.dart';
import 'package:notification_app/ui/helper/route_animation.dart';
import 'package:notification_app/ui/helper/static_widget_helper.dart';

class Router
{
  static const String ROUTE_INITIAL = "/";
  static const String ROUTE_LOGIN = "login";
  static const String ROUTE_REGISTRATION = "registration";
  static const String ROUTE_NOTIFICATION_VIEW = "notification_view";
  static const String ROUTE_NOTIFICATION_LIST = "notification_list";
  static const String ROUTE_OTP_VERIFICATION = "otp_verification";
  static String ROUTE_CURRENT = "/";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    ROUTE_CURRENT = settings.name;
    Widget currentWidget;
    switch (settings.name) {
      case ROUTE_INITIAL:
//        currentWidget = SplashScreenView();
        break;
      case ROUTE_LOGIN:
        currentWidget = LogIn();
        break;
      case ROUTE_REGISTRATION:
//        currentWidget = RegistrationView();
        break;

      case ROUTE_NOTIFICATION_VIEW:
//        currentWidget = NotificationView();
        break;
      case ROUTE_NOTIFICATION_LIST:
        var notificationType = settings.arguments;
//        currentWidget = NotificationListView(
//          notificationType: notificationType,
//        );
        break;
      case ROUTE_OTP_VERIFICATION:
        var otpVerification = settings.arguments as dynamic;
        String phoneNumber = otpVerification['phone_number'];
        String userName = otpVerification['user_name'];
        OTPVerificationType type = otpVerification['verification_type'];
//        currentWidget = OTPVerificationView(
//          phoneNumber: phoneNumber,
//          userName: userName,
//          verificationType: type,
//        );
        break;
        return FadeRoute(page: currentWidget, settings: settings);
    }
  }
}
