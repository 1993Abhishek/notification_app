import 'package:flutter/material.dart';

class AppColor {
  static final Color colorPrimary = hexToColor("#0C4884");
  static final Color colorSecondary = hexToColor("#1870c9");
  static final Color colorHintText = hexToColor("#9ecefc");
  static final Color colorTextFieldUnderLine = hexToColor("#78b5f3");
  static final Color colorTextFieldUnderLineActive = hexToColor("#c2dcf7");
  static final Color colorTextBoxColor = hexToColor("#458bd3");
  static final Color colorBackground = hexToColor("#f6f7f9");
  static final Color colorBackgroundLightGreen = hexToColor("#f2fff8");
  static final Color colorBackgroundLightRed = hexToColor("#fff3f2");
  static final Color colorBackgroundLightBlue = hexToColor("#e9e6ff");
  static final Color colorBookingStatus = hexToColor("#33d5bd");
  static final Color colorBookingCall = hexToColor("#33d5bd");
  static final Color colorBookingTrack = hexToColor("#fad168");
  static final Color colorBookingCancel = hexToColor("#d2723f");
  static final Color colorBookingContactSupport = hexToColor("#ffd05a");
  static final Color colorBookingSpareRate = hexToColor("#e66a2a");
  static final Color colorBookingViewDetails = hexToColor("#33d5bd");
  static final Color colorBookingRateTechnician = hexToColor("#ffd05a");
  static final Color colorBookingInvoice = hexToColor("#e66a2a");
  static final Color colorLightGray = hexToColor("#f7f7f7");
  static final Color colorFaqItem = hexToColor("#3380ce");
  static final Color colorOrderSummaryBalance = hexToColor("#33d5bd");
  static final Color colorItemSelect = hexToColor("#b9d9f8");

  static final Color colorOrderPlaced = hexToColor("#33d5bd");
  static final Color colorOrderAssigned = Colors.black;
  static final Color colorOrderAccepted = Colors.green;
  static final Color colorOrderPending = Colors.black45;
  static final Color colorOrderCancel = Colors.red;
  static final Color colorOrderReschedule = Colors.blue;

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
