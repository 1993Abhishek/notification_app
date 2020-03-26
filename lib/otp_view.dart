import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notification_app/core/enums/otp_verification_type.dart';
import 'package:notification_app/core/helper/extension_helper.dart';
import 'package:notification_app/core/manager/static_data_manager.dart';
import 'package:notification_app/core/model/_notification_response_model.dart';
import 'package:notification_app/core/viewmodel/otp_verification_viewmodel.dart';
import 'package:notification_app/router.dart';
import 'package:notification_app/ui/dialogs/progress_dialog.dart';
import 'package:notification_app/ui/helper/app_colors.dart';
import 'package:notification_app/ui/helper/app_dimen.dart';
import 'package:notification_app/ui/helper/app_spacing.dart';
import 'package:notification_app/ui/helper/static_widget_helper.dart';
import 'package:notification_app/ui/views/base_view.dart';
import 'package:notification_app/ui/widget/notification_box_textField.dart';
import 'package:notification_app/ui/widget/notification_button.dart';

class OTPVerificationView extends StatefulWidget {
  final String phoneNumber;
//  final String userName;
//  final OTPVerificationType verificationType;

  OTPVerificationView({Key key,
    @required this.phoneNumber,
//    @required this.userName,
    })
      : super(key: key);

  @override
  _OTPVerificationViewState createState() => _OTPVerificationViewState();
}

class _OTPVerificationViewState extends State<OTPVerificationView> {
  TextEditingController _controllerBlock1,
      _controllerBlock2,
      _controllerBlock3,
      _controllerBlock4,
      _controllerBlock5;
  FocusNode _focusNodeBlock1,
      _focusNodeBlock2,
      _focusNodeBlock3,
      _focusNodeBlock4,
      _focusNodeBlock5;
  String otpText1 = "",
      otpText2 = "",
      otpText3 = "",
      otpText4 = "",
      otpText5 = "";
  bool isErrorCheckingOn = false;

  @override
  void initState() {
    _controllerBlock1 = TextEditingController();
    _controllerBlock2 = TextEditingController();
    _controllerBlock3 = TextEditingController();
    _controllerBlock4 = TextEditingController();
    _controllerBlock5 = TextEditingController();

    _focusNodeBlock1 = FocusNode();
    _focusNodeBlock2 = FocusNode();
    _focusNodeBlock3 = FocusNode();
    _focusNodeBlock4 = FocusNode();
    _focusNodeBlock4 = FocusNode();
    _focusNodeBlock5 = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<OTPVerificationViewModel>(
      onModelReady: (model) {},
      builder: (context, model, child) =>
          Scaffold(
            body: Stack(
              children: <Widget>[
                Container(
                  color: AppColor.colorPrimary,
                  padding: EdgeInsets.all(AppDimen.H_DIMEN_30),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      AppSpacing.verticalSpace(AppDimen.V_DIMEN_100),
                      Text(
                        "Verification Code",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppDimen.TEXT_SIZE_40,
                            fontWeight: FontWeight.w500),
                      ),
                      AppSpacing.verticalSpace(AppDimen.V_DIMEN_8),
                      Text(
                        "Please type the verification code \nsend to ${widget
                            .phoneNumber.formatPhoneNumberWithCountryCode()}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppDimen.TEXT_SIZE_16,
                            fontWeight: FontWeight.w500),
                      ),
                      AppSpacing.verticalSpace(AppDimen.V_DIMEN_50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          OieServicesBoxTextField(
                            textEditingController: _controllerBlock1,
                            focusNode: _focusNodeBlock1,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.number,
                            hasError: isErrorCheckingOn && otpText1.isEmpty,
                            onChange: (value) {
                              otpText1 = value;
                              if (value
                                  .toString()
                                  .length > 0) {
                                _focusNodeBlock1.unfocus();
                                _focusNodeBlock2.requestFocus();
                              }
                            },
                          ),
                          AppSpacing.horizontalSpace(AppDimen.H_DIMEN_10),
                          OieServicesBoxTextField(
                            textEditingController: _controllerBlock2,
                            focusNode: _focusNodeBlock2,
                            hasError: isErrorCheckingOn && otpText2.isEmpty,
                            onChange: (value) {
                              otpText2 = value;
                              if (value
                                  .toString()
                                  .length > 0) {
                                _focusNodeBlock2.unfocus();
                                _focusNodeBlock3.requestFocus();
                              } else {
                                _focusNodeBlock2.unfocus();
                                _focusNodeBlock1.requestFocus();
                              }
                            },
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.number,
                          ),
                          AppSpacing.horizontalSpace(AppDimen.H_DIMEN_10),
                          OieServicesBoxTextField(
                            textEditingController: _controllerBlock3,
                            focusNode: _focusNodeBlock3,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.number,
                            hasError: isErrorCheckingOn && otpText3.isEmpty,
                            onChange: (value) {
                              otpText3 = value;
                              if (value
                                  .toString()
                                  .length > 0) {
                                _focusNodeBlock3.unfocus();
                                _focusNodeBlock4.requestFocus();
                              } else {
                                _focusNodeBlock3.unfocus();
                                _focusNodeBlock2.requestFocus();
                              }
                            },
                          ),
                          AppSpacing.horizontalSpace(AppDimen.H_DIMEN_10),
                          OieServicesBoxTextField(
                            textEditingController: _controllerBlock4,
                            focusNode: _focusNodeBlock4,
                            hasError: isErrorCheckingOn && otpText4.isEmpty,
                            textInputType: TextInputType.number,
                            onChange: (value) {
                              otpText4 = value;
                              if (value
                                  .toString()
                                  .length > 0) {
                                _focusNodeBlock4.unfocus();
                                _focusNodeBlock5.requestFocus();
                              } else {
                                _focusNodeBlock3.requestFocus();
                              }
                              /*Timer(Duration(milliseconds: 600), () =>
                            Navigator.popUntil(context,
                                ModalRoute.withName(Router.ROUTE_LOGIN)));*/
                            },
                          ),
                          AppSpacing.horizontalSpace(AppDimen.H_DIMEN_10),
                          OieServicesBoxTextField(
                            textEditingController: _controllerBlock5,
                            focusNode: _focusNodeBlock5,
                            hasError: isErrorCheckingOn && otpText5.isEmpty,
                            textInputType: TextInputType.number,
                            onChange: (value) {
                              otpText5 = value;
                              if (value
                                  .toString()
                                  .length > 0) {
                                _focusNodeBlock5.unfocus();
                              } else {
                                _focusNodeBlock4.requestFocus();
                              }
                            },
                          ),
                        ],
                      ),
                      AppSpacing.verticalSpace(AppDimen.V_DIMEN_50),
                      /* Text(
                  "00.60 Sec",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: AppDimen.TEXT_SIZE_18,
                      fontWeight: FontWeight.w500),
                ),*/
                      GestureDetector(
                        onTap: () {
//                          _verifyLoginOTP(model: model);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(AppDimen.H_DIMEN_10),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Didn't receive OTP?",
                                    style: TextStyle(
                                        color: AppColor.colorHintText,
                                        fontSize: AppDimen.TEXT_SIZE_17)),
                                TextSpan(
                                  text: "    ",
                                ),
                                TextSpan(
                                    text: "Resend OTP",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppDimen.TEXT_SIZE_17))
                              ])),
                        ),
                      ),
                      AppSpacing.verticalSpace(AppDimen.V_DIMEN_50),
                      NotificationServicesButton(
                        text: "Verify",
                        buttonColor: Colors.white,
                        height: AppDimen.V_DIMEN_50,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColor.colorPrimary,
                            fontSize: AppDimen.TEXT_SIZE_17),
                        onClick: () {
                          FocusScope.of(context).unfocus();
                          isErrorCheckingOn = true;
                          if (otpText1.isEmpty ||
                              otpText2.isEmpty ||
                              otpText3.isEmpty ||
                              otpText4.isEmpty ||
                              otpText5.isEmpty) {
                            FlushbarHelper.createError(
                                message: "Please enter your OTP",
                                duration: Duration(seconds: 3))
                                .show(context);
                            setState(() {});
                          } else {
                            String otpCode =
                                "$otpText1$otpText2$otpText3$otpText4$otpText5";
                            _verifyRegistrationOTP(
                                model: model, otpCode: otpCode);

//                            if (widget.verificationType ==
//                                OTPVerificationType.REGISTRATION)
//                              _verifyRegistrationOTP(
//                                  model: model, otpCode: otpCode);
//                            else
//                              _verifyLoginOTP(model: model, otpCode: otpCode);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: AppDimen.V_DIMEN_25),
                    child: IconButton(
                        padding: EdgeInsets.all(AppDimen.H_DIMEN_20),
                        alignment: Alignment.topRight,
                        icon: Icon(
                          Icons.close,
                          size: AppDimen.ICON_SIZE_25,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.pop(context)),
                  ),
                ),
              ],
            ),
          ),
    );
  }

//  _resendOTP({@required OTPVerificationViewModel model}) async {
//    ProgressDialog progressDialog =
//    ProgressDialog(context: context, dialogMessage: "Sending OTP..");
//    progressDialog.show();
//    NotificationResponseModel response = await model.resendOTP(
//        userName: widget.userName,
//        otpType: "${StaticDataManager.otpResendForActivation}");
//    progressDialog.dismiss();
//    WidgetHelper.processResponseData(
//      context: context,
//      response: response,
//      onSuccess: () {
//        FlushbarHelper.createSuccess(
//            message: response.responseMessage,
//            duration: Duration(seconds: 3))
//            .show(context);
//      },
//      errorTitle: "Resend OTP Failed",
//    );
//  }

//  _verifyLoginOTP({
//    @required OTPVerificationViewModel model,
//    @required String otpCode,
//  }) async {
//    ProgressDialog progressDialog =
//    ProgressDialog(context: context, dialogMessage: "Verifying OTP..");
//    progressDialog.show();
//    NotificationResponseModel response = await model.verifyOTP(
//        phoneNo: ,
////        otpType: "${StaticDataManager.otpResendForActivation
////        }",
//        otpCode: otpCode);
//    progressDialog.dismiss();
//    WidgetHelper.processResponseData(
//      context: context,
//      response: response,
//      onSuccess: () {
//        WidgetHelper.showResponseSuccessDialog(
//            context: context,
//            description: response.responseMessage,
//            successIcon: Icons.thumb_up,
//            onActionClick: () {
//              Navigator.popUntil(
//                  context, ModalRoute.withName(Router.ROUTE_LOGIN));
//            });
//      },
//      errorTitle: "Verification Failed",
//    );
//  }

  _verifyRegistrationOTP({
    @required OTPVerificationViewModel model,
    @required String otpCode,
  }) async {
    ProgressDialog progressDialog =
    ProgressDialog(context: context, dialogMessage: "Verifying OTP..");
    progressDialog.show();
    NotificationResponseModel response = await model.verifyOTP(
        phoneNo: widget.phoneNumber,
//        otpType: "${StaticDataManager.otpResendForActivation}",
        otpCode: otpCode);
    progressDialog.dismiss();
    WidgetHelper.processResponseData(
      context: context,
      response: response,
      onSuccess: () {
        WidgetHelper.showResponseSuccessDialog(
            context: context,
            description: response.responseMessage,
            successIcon: Icons.thumb_up,
            onActionClick: () {
              Navigator.popUntil(
                  context, ModalRoute.withName(Router.ROUTE_LOGIN));
              Navigator.pushReplacementNamed(context, Router.ROUTE_LOGIN);
            });
      },
      errorTitle: "Verification Failed",
    );
  }
}
