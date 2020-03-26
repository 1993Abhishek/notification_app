import 'dart:io';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:notification_app/core/manager/static_data_manager.dart';
import 'package:notification_app/core/model/_notification_response_model.dart';
import 'package:notification_app/router.dart';
import 'package:notification_app/ui/dialogs/action_alert_dialog.dart';
import 'package:notification_app/ui/helper/app_colors.dart';
import 'package:notification_app/ui/helper/assets_path.dart';
import 'package:notification_app/ui/helper/phone_number_formatter.dart';
import 'package:notification_app/ui/widget/assets_icon.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_dimen.dart';

class WidgetHelper {
  static Future<Address> getFinalAddress({@required LatLng mLatLang}) async {
    List<Address> address = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(mLatLang.latitude, mLatLang.longitude));

    print("address lat =>${mLatLang.latitude}");
    print("addres lang =>${mLatLang.longitude}");

    for (int i = 0; i < address.length; i++) {
      print("addressLine $i==>${address[i].addressLine}");
      print("countryCode $i==>${address[i].countryCode}");
    }
    return address.length > 0 ? address[0] : null;
  }

  static List<TextInputFormatter> phoneNumberFormatter = [
    LengthLimitingTextInputFormatter(13),
    PhoneNumberTextInputFormatter(),
  ];


  static String removeUSAPhoneFormat(String phoneNumber) {
    String rawPhoneNumber = phoneNumber
        .replaceAll("+1", "")
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll(" ", "")
        .replaceAll("-", "");
    debugPrint("rawPhoneNumber===>$rawPhoneNumber");
    return rawPhoneNumber;
  }

  static String generatePhoneFormat(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return "(" +
          phoneNumber.substring(0, 3) +
          ") " +
          phoneNumber.substring(3, 6) +
          "-" +
          phoneNumber.substring(6, 10);
    }
    return phoneNumber;
  }

  static Widget getNotificationWidget(BuildContext context,
      {Function onClick}) {
    return GestureDetector(
      onTap: () {
        if (onClick != null)
          onClick();
        else
          Navigator.of(context).pushNamed(Router.ROUTE_NOTIFICATION_VIEW);
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: AppDimen.H_DIMEN_10,
          right: AppDimen.H_DIMEN_10,
        ),
        child: AssetIcon(
            imageAssetPath: AssetsPath.notificationIcon,
            width: AppDimen.ICON_SIZE_22,
            boxFit: BoxFit.scaleDown,
            height: AppDimen.ICON_SIZE_22),
      ),
    );
  }

  static Future<DateTime> openDatePicker(BuildContext context,
      {DateTime initialDate, DateTime firstDate, DateTime lastDate}) async {
    DateTime current = DateTime.now();
    final DateTime pickedDateTime = await showDatePicker(
        context: context,
        initialDate: initialDate != null ? initialDate : DateTime.now(),
        firstDate:
        firstDate != null ? firstDate : DateTime(current.year - 100, 1),
        lastDate:
        lastDate != null ? lastDate : DateTime(current.year + 100, 1));
    return pickedDateTime;
  }

  static Future<T> showDialog<T>(
      {@required BuildContext context, @required Widget dialogChild}) {
    return showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.easeInOutSine.transform(a1.value) - 1.0;

          return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: dialogChild,
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 700),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }

  static Future<bool> call(String phoneNumber) {
    return launch("tel:$phoneNumber");
  }

  static Flushbar showNoInternetSnackBar({@required BuildContext context}) {
    return Flushbar(
      title: "Connection Failed",
      message: "No Internet. Check your internet and try again.",
      leftBarIndicatorColor: Colors.grey,
      shouldIconPulse: true,
      icon: Icon(
        Icons.perm_scan_wifi,
        color: Colors.grey,
      ),
      duration: Duration(seconds: 4),
    )
      ..show(context);
  }

  static Flushbar showSnackBar(
      {@required BuildContext context, @required String message}) {
    return Flushbar(
      message: message,
      leftBarIndicatorColor: Colors.grey,
      shouldIconPulse: true,
      icon: Icon(
        Icons.info_outline,
        color: Colors.grey,
      ),
      duration: Duration(seconds: 3),
    )
      ..show(context);
  }

  static showToastMessage(String message, {Color backgroundColor}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor:
        backgroundColor != null ? backgroundColor : Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Future showInfoAlertDialog({BuildContext context,
    Widget headerWidget,
    String title,
    String content,
    Widget contentWidget,
    bool isActionAvailable = false,
    bool dismissible = true,
    List<Widget> actionChild}) {
    return showDialog(
        context: context,
        dialogChild: AlertDialog(
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.all(0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              dismissible
                  ? Container(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: EdgeInsets.all(AppDimen.H_DIMEN_10),
                    child: Icon(
                      Icons.clear,
                      color: Colors.black45,
                      size: AppDimen.ICON_SIZE_22,
                    ),
                  ),
                ),
              )
                  : Container(
                height: AppDimen.H_DIMEN_35,
              ),
              headerWidget != null ? headerWidget : Container(),
              Padding(
                padding: EdgeInsets.only(
                    left: AppDimen.H_DIMEN_30,
                    right: AppDimen.H_DIMEN_30,
                    bottom: AppDimen.H_DIMEN_20),
                child: Column(
                  children: <Widget>[
                    title.isNotEmpty
                        ? Padding(
                      padding: EdgeInsets.all(AppDimen.H_DIMEN_5),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: AppDimen.TEXT_SIZE_16,
                            color: AppColor.colorPrimary,
                            fontWeight: FontWeight.w700,
                            height: 1.6),
                      ),
                    )
                        : Container(
                      margin: EdgeInsets.only(top: AppDimen.H_DIMEN_10),
                    ),
                    contentWidget != null
                        ? contentWidget
                        : Text(
                      content,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: AppDimen.TEXT_SIZE_16,
                          color: Colors.black,
                          height: 1.2),
                    ),
                    isActionAvailable
                        ? Padding(
                      padding: EdgeInsets.only(top: AppDimen.H_DIMEN_15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: actionChild,
                      ),
                    )
                        : Container()
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
              ),
            ],
          ),
        ));
  }

  static void showResponseErrorDialog({@required BuildContext context,
    @required String description,
    String title,
    IconData errorIcon,
    Function onActionClick}) {
    WidgetHelper.showDialog(
        context: context,
        dialogChild: ActionAlertDialog(
          title: title != null ? title : "",
          backgroundColor: AppColor.colorBackgroundLightRed,
          message: description,
          isMultiAction: false,
          topIcon: errorIcon != null ? errorIcon : Icons.error,
          actionColor: Colors.red,
          actionText: "Cancel",
          topIconColor: Colors.red,
          onActionClick: () {
            if (onActionClick != null)
              onActionClick();
            else
              Navigator.pop(context);
          },
        ));
  }

  static void showResponseSuccessDialog({@required BuildContext context,
    @required String description,
    String title,
    IconData successIcon,
    Function onActionClick}) {
    WidgetHelper.showDialog(
        context: context,
        dialogChild: ActionAlertDialog(
          title: title != null ? title : "Success!",
          backgroundColor: AppColor.colorBackgroundLightGreen,
          message: description,
          isMultiAction: false,
          topIcon: successIcon != null ? successIcon : Icons.check_circle,
          actionColor: Colors.green,
          actionText: "Cancel",
          topIconColor: Colors.green,
          onActionClick: () {
            if (onActionClick != null)
              onActionClick();
            else
              Navigator.pop(context);
          },
        ));
  }

  static processResponseData({@required BuildContext context,
    @required NotificationResponseModel response,
    Function onSuccess,
    Function onFailure,
    String errorTitle}) {
    if (response.responseStatus == StaticDataManager.statusCodeNoInternet) {
      WidgetHelper.showNoInternetSnackBar(context: context);
    } else if (response.result) {
      if (onSuccess != null) onSuccess();
    } else {
      if (onFailure != null)
        onFailure();
      else
        showResponseErrorDialog(
          context: context,
          description: response.responseMessage,
          title: errorTitle,
        );
    }
  }

  static String generateNameLetter(
      {@required String firstName, @required String lastName}) {
    if (firstName.isNotEmpty && lastName.isNotEmpty) {
      return firstName[0] + lastName[0];
    } else {
      return "";
    }
  }

  static Future<String> generateImageFile() async {
    final directory = await (Platform.isAndroid
        ? getExternalStorageDirectory()
        : getApplicationDocumentsDirectory());
    final filePath = directory.path + "/oieServ_${DateTime.now()}.jpg";
    return filePath;
  }

  static Future<File> compressFile(File file) async {
    debugPrint("path ==>${file.path}");
    String targetPath = await generateImageFile();
    debugPrint("targetPath ==>$targetPath");
    var result = await FlutterImageCompress.compressAndGetFile(
      file.path,
      targetPath,
      quality: 60,
      rotate: 0,
    );
    debugPrint("Original File length==>${file.lengthSync()}");
    debugPrint("compressed File length==>${result.lengthSync()}");
    return result;
  }
}
