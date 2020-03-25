import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notification_app/ui/helper/app_colors.dart';
import 'package:notification_app/ui/helper/app_dimen.dart';
import 'package:notification_app/ui/helper/app_spacing.dart';
import 'package:notification_app/ui/widget/info_dialog_clipper.dart';
import 'package:notification_app/ui/widget/notification_button.dart';

class ActionAlertDialog extends StatefulWidget {
  final bool barrierDismissible;
  final String title;
  final String message;
  final Function onActionClick;
  final String actionText;
  final Color actionColor;
  final Function onNegativeActionClick;
  final Function onPositiveActionClick;
  final String positiveActionText;
  final String negativeActionText;
  final Color positiveActionColor;
  final Color negativeActionColor;
  final Color backgroundColor;
  final bool isMultiAction;
  final IconData topIcon;
  final Color topIconColor;
  final String actionPositiveText;
  final String actionNegativeText;

  ActionAlertDialog(
      {this.barrierDismissible = false,
        @required this.title,
        @required this.message,
        this.topIcon,
        this.topIconColor,
        this.actionText,
        this.actionColor = Colors.black,
        this.onActionClick,
        this.positiveActionText,
        this.negativeActionText,
        this.onPositiveActionClick,
        this.onNegativeActionClick,
        this.positiveActionColor,
        this.negativeActionColor,
        this.backgroundColor,
        this.isMultiAction = false,
        this.actionPositiveText,
        this.actionNegativeText});

  @override
  _ActionAlertDialogState createState() => _ActionAlertDialogState();
}

class _ActionAlertDialogState extends State<ActionAlertDialog> {
  @override
  Widget build(BuildContext context) {
    Widget dialogContent(BuildContext context) {
      return Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimen.H_DIMEN_15)),
          color: Colors.white,
          child: Container(
            //height: AppDimen.V_DIMEN_350,
            width: AppDimen.H_DIMEN_300,
            child: Column(
              mainAxisSize: MainAxisSize.max, // To make the card compact
              children: <Widget>[
                ClipPath(
                  child: Container(
                    decoration: new BoxDecoration(
                      color: widget.backgroundColor != null
                          ? widget.backgroundColor
                          : AppColor.colorBackground,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(AppDimen.H_DIMEN_15),
                    ),
                    height: AppDimen.V_DIMEN_150,
                    child: Center(
                      child: Icon(
                        widget.topIcon != null
                            ? widget.topIcon
                            : Icons.info_outline,
                        color: widget.topIconColor != null
                            ? widget.topIconColor
                            : Colors.black,
                        size: AppDimen.H_DIMEN_60,
                      ),
                    ),
                  ),
                  clipper: InfoDialogClipper(),
                ),
                AppSpacing.verticalSpace(AppDimen.H_DIMEN_5),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: AppDimen.TEXT_SIZE_17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(AppDimen.H_DIMEN_10),
                  child: Text(
                    widget.message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: AppDimen.TEXT_SIZE_16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: AppDimen.V_DIMEN_10),
                  child: widget.isMultiAction
                      ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      NotificationServicesButton(
                        width: AppDimen.H_DIMEN_120,
                        height: AppDimen.V_DIMEN_40,
                        buttonRadius: AppDimen.H_DIMEN_30,
                        text: widget.negativeActionText != null
                            ? widget.negativeActionText
                            : "No",
                        elevation: 2,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimen.TEXT_SIZE_14,
                          fontWeight: FontWeight.bold,
                        ),
                        buttonColor: widget.negativeActionColor != null
                            ? widget.negativeActionColor
                            : Colors.black54,
                        onClick: () {
                          if (widget.onNegativeActionClick != null) {
                            widget.onNegativeActionClick();
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      ),
                      AppSpacing.horizontalSpace(AppDimen.H_DIMEN_20),
                      NotificationServicesButton(
                        width: AppDimen.H_DIMEN_120,
                        height: AppDimen.V_DIMEN_40,
                        buttonRadius: AppDimen.H_DIMEN_30,
                        text: widget.positiveActionText != null
                            ? widget.positiveActionText
                            : "Yes",
                        elevation: 2,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: AppDimen.TEXT_SIZE_14,
                          fontWeight: FontWeight.bold,
                        ),
                        buttonColor: widget.positiveActionColor != null
                            ? widget.positiveActionColor
                            : AppColor.colorPrimary,
                        onClick: () {
                          if (widget.onPositiveActionClick != null) {
                            widget.onPositiveActionClick();
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ],
                  )
                      : NotificationServicesButton(
                    width: AppDimen.H_DIMEN_120,
                    height: AppDimen.V_DIMEN_35,
                    text: widget.actionText != null
                        ? widget.actionText
                        : "OK",
                    buttonRadius: AppDimen.H_DIMEN_20,
                    borderSideColor: Colors.black45,
                    elevation: 1.5,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: AppDimen.TEXT_SIZE_14,
                      fontWeight: FontWeight.w700,
                    ),
                    buttonColor: widget.actionColor,
                    onClick: () {
                      if (widget.onActionClick != null) {
                        widget.onActionClick();
                      } else {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                AppSpacing.verticalSpace(AppDimen.V_DIMEN_30)
              ],
            ),
          ));
    }

    return WillPopScope(
      onWillPop: () => Future.value(widget.barrierDismissible),
      child: Dialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: SingleChildScrollView(
          child: dialogContent(context),
        ),
      ),
    );
  }
}
