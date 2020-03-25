import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notification_app/core/model/calender_item.dart';

class AppHelper {

  static String getDateFromDateTime(String dateFormat, DateTime dateTime) {
    var formatter = new DateFormat(dateFormat);
    return formatter.format(dateTime);
  }

  static DateTime getDateTimeFromStringDate(String strDate) {
    if (strDate.isEmpty) return null;
    return DateTime.parse(strDate);
  }

  static String getDateFromStringDate(String dateFormat, String strDate) {
    if (strDate.isEmpty || strDate == null) return strDate;
    debugPrint("strDate===>$strDate");
    var date = DateTime.parse(strDate);
    debugPrint("parse strDate===>$date");
    var formatter = new DateFormat(dateFormat);
    return formatter.format(date);
  }

  static List<CalenderItem> getWeekDayListFromDate(DateTime selectedDate) {
    List<CalenderItem> calenderItems = List();
    int weekDay = selectedDate.weekday;
    debugPrint("weekDay===>$weekDay");

    if (weekDay == 7)
      weekDay = 0;

    for (int i = weekDay; i > 0; i--) {
      DateTime newDateTime = selectedDate.add(Duration(days: -i));

      var calItem = CalenderItem(
          weekDay: newDateTime.weekday,
          weekDate: "${newDateTime.day}",
          date: AppHelper.getDateFromDateTime("yyyy-MM-dd", newDateTime));
      if (newDateTime.difference(DateTime.now()).inDays < 0) {
        calItem.isDisable = true;
      }
      calenderItems.add(calItem);
    }

    for (int i = 0; i < 7 - weekDay; i++) {
      DateTime newDateTime = selectedDate.add(Duration(days: i));
      var calItem = CalenderItem(
          weekDay: newDateTime.weekday,
          weekDate: "${newDateTime.day}",
          date: AppHelper.getDateFromDateTime("yyyy-MM-dd", newDateTime));
      if (i == 0) calItem.isSelected = true;
      calenderItems.add(calItem);
    }
    return calenderItems;
  }

  static Future<bool> isInternetConnectionAvailable() async {
    return await DataConnectionChecker().hasConnection;
  }

}

