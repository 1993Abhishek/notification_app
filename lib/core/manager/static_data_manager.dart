import 'package:notification_app/core/model/left_menu_item.dart';

class StaticDataManager {


  ///ORDER STATUS
  static const int orderPlaced = 1;
  static const int orderAssignToServiceProvider = 2;
  static const int orderAcceptedByServiceProvider = 3;
  static const int orderRejectedByServiceProvider = 4;
  static const int orderCancelledByAdmin = 5;
  static const int orderCancelledByCustomer = 6;
  static const int orderRescheduledByUser = 7;
  static const int orderRescheduledByAdmin = 8;
  static const int orderInProgress = 9;
  static const int orderAwaitingForSpareParts = 10;
  static const int orderRequestClosedByServiceProvider = 11;
  static const int orderCompleted = 12;
  static const int orderFullyPaid = 13;

  ///FAQ Static Variables
  static const int otpResendForActivation = 1;
  static const int otpResendForMobileVerification = 2;
  static const int otpResendForForgotPassword = 3;

  ///NOTIFICATION TYPE
  static const int notificationScreenFirst = 1;
  static const int notificationScreenList = 2;
  static const int notificationTypeNew = 2;
  static const int notificationTypeOld = 1;

  static const int statusCodeOk = 200;
  static const int statusCodeFalse = 401;
  static const int statusCodeFailed = 403;
  static const int statusCodeRequestNotFound = 404;
  static const int statusCodeInternalServerError = 500;
  static const int statusCodeUnknownError = 900;
  static const int statusCodeNoInternet = 800;

  static const int LEFT_MENU_HOME = 1;
  static const int LEFT_MENU_MY_BOOKINGS = 2;
  static const int LEFT_MENU_MY_PROFILE = 3;
  static const int LEFT_MENU_FAQ = 4;
  static const int LEFT_MENU_CONTACT_US = 5;
  static const int LEFT_MENU_HELP_SUPPORT = 6;
  static const int LEFT_MENU_LOG_OUT = 7;
  static const int LEFT_MENU_NOTIFICATION = 8;

  static List<LeftMenuItem> getLeftMenuItems() {
    List<LeftMenuItem> _leftMenuItem = new List();
    _leftMenuItem.add(LeftMenuItem(
      menuID: LEFT_MENU_HOME,
      menuName: "Home",));
    _leftMenuItem.add(LeftMenuItem(
      menuID: LEFT_MENU_MY_BOOKINGS,
      menuName: "My Bookings",));
    _leftMenuItem.add(LeftMenuItem(
      menuID: LEFT_MENU_MY_PROFILE,
      menuName: "My Profile",));
    _leftMenuItem.add(LeftMenuItem(
      menuID: LEFT_MENU_NOTIFICATION,
      menuName: "Notification",));
    _leftMenuItem.add(LeftMenuItem(
      menuID: LEFT_MENU_FAQ,
      menuName: "FAQ",));
    _leftMenuItem.add(LeftMenuItem(
        menuID: LEFT_MENU_CONTACT_US,
        menuName: "Contact Us"));
    _leftMenuItem.add(LeftMenuItem(
        menuID: LEFT_MENU_HELP_SUPPORT,
        menuName: "Help & Support"));
    _leftMenuItem.add(LeftMenuItem(
      menuID: LEFT_MENU_LOG_OUT,
      menuName: "Log Out",));
    return _leftMenuItem;
  }

  static const int PAYMENT_TYPE_OFFLINE = 1;
  static const int PAYMENT_TYPE_ONLINE = 2;


}