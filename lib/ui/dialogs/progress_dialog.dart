import 'package:flutter/material.dart';
import 'package:notification_app/ui/helper/app_dimen.dart';
import 'package:notification_app/ui/helper/app_spacing.dart';

class ProgressDialog {
  //_Body _dialog;
  BuildContext context;
  final bool showLogs;
  String dialogMessage;
  BuildContext _dismissingContext;
  bool _isShowing = false;
  bool _barrierDismissible = false;

  ProgressDialog(
      {@required this.context,
        this.showLogs = false,
        this.dialogMessage = "Loading..."});

  bool isShowing() {
    return _isShowing;
  }

  void setDialog({
    BuildContext context,
    String dialogMessage,
  }) {
    this.dialogMessage = dialogMessage;
    this.context = context;
  }

  void dismiss() {
    if (_isShowing) {
      try {
        _isShowing = false;
        if (Navigator.of(_dismissingContext).canPop()) {
          Navigator.of(_dismissingContext).pop();
          if (showLogs) debugPrint('ProgressDialog dismissed');
        } else {
          if (showLogs) debugPrint('Cant pop ProgressDialog');
        }
      } catch (_) {}
    } else {
      if (showLogs) debugPrint('ProgressDialog already dismissed');
    }
  }

  void dismissProgress(BuildContext context) {
    if (_isShowing) {
      try {
        _isShowing = false;
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
          if (showLogs) debugPrint('ProgressDialog dismissed');
        } else {
          if (showLogs) debugPrint('Cant pop ProgressDialog');
        }
      } catch (_) {}
    } else {
      if (showLogs) debugPrint('ProgressDialog already dismissed');
    }
  }

  Future<bool> hide() {
    if (_isShowing) {
      try {
        _isShowing = false;
        Navigator.of(_dismissingContext).pop(true);
        if (showLogs) debugPrint('ProgressDialog dismissed');
        return Future.value(true);
      } catch (_) {
        return Future.value(false);
      }
    } else {
      if (showLogs) debugPrint('ProgressDialog already dismissed');
      return Future.value(false);
    }
  }

  void show() {
    if (!_isShowing) {
      Widget _dialog = _ProgressBody(
        dialogMessage: dialogMessage,
      );
      _isShowing = true;
      if (showLogs) debugPrint('ProgressDialog shown');
      showDialog<dynamic>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _dismissingContext = context;
          return WillPopScope(
            onWillPop: () {
              return Future.value(_barrierDismissible);
            },
            child: Dialog(
                backgroundColor: Colors.white,
                insetAnimationCurve: Curves.bounceOut,
                insetAnimationDuration: Duration(milliseconds: 100),
                elevation: AppDimen.H_DIMEN_8,
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(AppDimen.H_DIMEN_8))),
                child: _dialog),
          );
        },
      );
    } else {
      if (showLogs) debugPrint("ProgressDialog already shown/showing");
    }
  }
}

class _ProgressBody extends StatefulWidget {
  final String dialogMessage;

  _ProgressBody({@required this.dialogMessage});

  @override
  _ProgressBodyState createState() => _ProgressBodyState();
}

class _ProgressBodyState extends State<_ProgressBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimen.H_DIMEN_300,
      height: AppDimen.V_DIMEN_80,
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(AppDimen.H_DIMEN_5),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: AppDimen.H_DIMEN_20,
          right: AppDimen.H_DIMEN_20,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CircularProgressIndicator(),
            AppSpacing.horizontalSpace(AppDimen.H_DIMEN_20),
            Text(
              widget.dialogMessage,
              style: TextStyle(
                  fontSize: AppDimen.TEXT_SIZE_14, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
