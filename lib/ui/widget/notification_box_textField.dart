import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notification_app/ui/helper/app_colors.dart';
import 'package:notification_app/ui/helper/app_dimen.dart';

class OieServicesBoxTextField extends StatefulWidget {
  final String hintText;
  final String valueText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool isObscureText;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function onSubmitted;
  final Function onChange;
  final Function onTap;
  final bool isReadOnly;
  final double height;
  final double width;
  final TextStyle textStyle;
  final double borderRadius;
  final bool hasError;

  const OieServicesBoxTextField(
      {Key key,
        this.valueText,
        this.hintText,
        this.textStyle,
        this.textInputAction = TextInputAction.done,
        this.textInputType = TextInputType.text,
        this.isObscureText = false,
        this.textEditingController,
        this.focusNode,
        this.onChange,
        this.onTap,
        this.height,
        this.width,
        this.hasError = false,
        this.isReadOnly = false,
        this.borderRadius,
        this.onSubmitted})
      : super(key: key);

  @override
  _OieServicesBoxTextField createState() => _OieServicesBoxTextField();
}

class _OieServicesBoxTextField extends State<OieServicesBoxTextField> {
  TextEditingController _textEditingController;
  FocusNode _focusNode;

  @override
  void initState() {
    _textEditingController = widget.textEditingController == null
        ? TextEditingController()
        : widget.textEditingController;
    if (widget.valueText != null)
      _textEditingController.text = widget.valueText;
    _focusNode = widget.focusNode == null ? FocusNode() : widget.focusNode;
    _focusNode.addListener(_focusChangeListener);
    super.initState();
  }

  void _focusChangeListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _focusNode.requestFocus(),
      child: Container(
        height: widget.height != null ? widget.height : AppDimen.H_DIMEN_50,
        width: widget.width != null ? widget.width : AppDimen.H_DIMEN_50,
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.hasError ? Colors.red : _focusNode.hasFocus
                    ? AppColor.colorTextFieldUnderLineActive
                    : AppColor.colorTextFieldUnderLine,
                width: _focusNode.hasFocus ? 2 : 1.8),
            borderRadius: BorderRadius.circular(
                widget.borderRadius != null ? widget.borderRadius : AppDimen
                    .H_DIMEN_10),
            color: AppColor.colorTextBoxColor),
        child: Center(
          child: TextField(
              textAlign: TextAlign.center,
              cursorColor: Colors.white,
              focusNode: _focusNode,
              controller: _textEditingController,
              textInputAction: widget.textInputAction,
              maxLength: 1,
              maxLines: 1,
              style: widget.textStyle != null
                  ? widget.textStyle
                  : TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: AppDimen.TEXT_SIZE_22,
              ),
              onSubmitted: (value) {
                if (widget.onSubmitted != null) widget.onSubmitted(value);
              },
              onChanged: (value) {
                if (widget.onChange != null) widget.onChange(value);
              },
              onTap: () {
                if (widget.onTap != null) widget.onTap();
              },
              keyboardType: widget.textInputType,
              obscureText: widget.isObscureText,
              readOnly: widget.isReadOnly,
              decoration: InputDecoration(
                counterText: "",
                contentPadding: EdgeInsets.all(0),
                border: InputBorder.none,
                hintText: widget.hintText == null ? "" : widget.hintText,
                hintStyle: TextStyle(
                    color: AppColor.colorHintText,
                    fontSize: AppDimen.TEXT_SIZE_18),
              )),
        ),
      ),
    );
  }
}
