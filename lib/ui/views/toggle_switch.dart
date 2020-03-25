import 'package:flutter/material.dart';
import 'package:notification_app/ui/helper/app_dimen.dart';

class ToggleSwitch extends StatefulWidget {
  final bool isChecked;
  final String switchText;
  final TextStyle switchTextStyle;
  final Function onCheckChange;
  final Color inactiveThumbColor,
      activeColor,
      activeTrackColor,
      inactiveTrackColor;
  bool isExpanded = false;
  bool isSwitchLeft = true;
  bool isLayoutClickable;
  double separatorValue = 0;
  bool isClickable = true;

  ToggleSwitch(
      {@required this.switchText,
        this.switchTextStyle,
        @required this.onCheckChange,
        this.isChecked,
        @required this.inactiveThumbColor,
        @required this.activeColor,
        @required this.activeTrackColor,
        @required this.inactiveTrackColor,
        this.isExpanded,
        this.isSwitchLeft,
        this.isLayoutClickable,
        this.separatorValue,
        this.isClickable});

  @override
  _ToggleSwitchState createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  bool _switchChange = false;

  @override
  void initState() {
    _switchChange = widget.isChecked;
    super.initState();
  }

  Widget getSwitchWidget() {
    return Switch(
        value: _switchChange,
        inactiveThumbColor: widget.inactiveThumbColor,
        activeColor: widget.activeColor,
        activeTrackColor: widget.activeTrackColor,
        inactiveTrackColor: widget.inactiveTrackColor,
        onChanged: (value) {
          if (widget.isClickable) {
            widget.onCheckChange(value);
            setState(() {
              _switchChange = value;
            });
          }
        });
  }

  Widget getTextWidget() {
    return Text(
      widget.switchText,
      style: widget.switchTextStyle != null
          ? widget.switchTextStyle
          : TextStyle(fontSize: AppDimen.TEXT_SIZE_17, color: Colors.black),
    );
  }

  Widget widgetController() {
    List<Widget> _list = List();
    Widget textWidget =
    widget.isExpanded ? Expanded(child: getTextWidget()) : getTextWidget();
    if (widget.isSwitchLeft) {
      _list.add(getSwitchWidget());
      _list.add(SizedBox(
        width: widget.separatorValue,
      ));
      _list.add(textWidget);
    } else {
      _list.add(textWidget);
      _list.add(SizedBox(
        width: widget.separatorValue,
      ));
      _list.add(getSwitchWidget());
    }

    if (widget.isLayoutClickable) {
      return GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: _list,
        ),
        onTap: () {
          setState(() {
            _switchChange = !_switchChange;
            widget.onCheckChange(_switchChange);
          });
        },
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: _list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widgetController();
  }
}
