import 'package:flutter/material.dart';
import 'package:notification_app/ui/helper/app_dimen.dart';
import 'package:notification_app/ui/helper/notification_text_styles.dart';

class NotificationServicesButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double height;
  final double width;
  final Color buttonColor;
  final double buttonRadius;
  final Function onClick;
  final double elevation;
  final Color borderSideColor;


  const NotificationServicesButton(
      {@required this.text,
        @required this.buttonColor,
        @required this.onClick,
        this.textStyle,
        this.height,
        this.width,
        this.elevation = 5,
        this.borderSideColor,
        this.buttonRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height == null ? AppDimen.V_DIMEN_50 : height,
      width: width == null ? double.infinity : width,
      child: RaisedButton(
        elevation: elevation,
        padding: EdgeInsets.all(0),
        color: buttonColor,
        onPressed: () => onClick(),
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: borderSideColor != null ? borderSideColor : Colors
                  .transparent, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(
              buttonRadius != null ? buttonRadius : AppDimen.H_DIMEN_5)),
        ),
        child: Text(
          text,
          style: textStyle == null
              ? NotificationServicesTextStyles.defaultButtonTextStyle
              : textStyle,
        ),
      ),
    );
  }
}
