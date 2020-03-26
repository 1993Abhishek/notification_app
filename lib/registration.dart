//import 'package:device_info/device_info.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:notification_app/core/model/app_settings.dart';
//import 'package:notification_app/locator.dart';
//import 'package:notification_app/log_in.dart';
//import 'package:notification_app/ui/helper/app_colors.dart';
//import 'package:notification_app/ui/helper/app_dimen.dart';
//import 'dart:io';
//
//import 'package:notification_app/ui/helper/app_spacing.dart';
//import 'package:notification_app/ui/helper/size_config.dart';
//import 'package:notification_app/ui/helper/static_widget_helper.dart';
//import 'package:notification_app/ui/widget/notification_button.dart';
//import 'package:notification_app/ui/widget/notification_textField.dart';
//import 'package:notification_app/ui/views/toggle_switch.dart';
//
//class Registration extends StatefulWidget
//{
//  @override
//  _RegistrationState createState() => _RegistrationState();
//}
//
//class _RegistrationState extends State<Registration> {
//
//  AppSettings _appSettings = locator<AppSettings>();
//
//  TextEditingController _controllerName,
//      _controllerPhone,
//      _controllerConformPassword;
//  FocusNode _nodeFirstName, _nodePhone, _nodeConfirmPassword;
//
//  bool isChecked = false;
//
//  @override
//  void initState() {
//    _controllerName = TextEditingController();
//    _controllerPhone = TextEditingController();
//    _controllerConformPassword = TextEditingController();
//
//    _nodeFirstName = FocusNode();
//    _nodeConfirmPassword = FocusNode();
//    _nodePhone = FocusNode();
//    super.initState();
//  }
//
//  _unfocusAll() {
//    _nodeFirstName.unfocus();
//    _nodeConfirmPassword.unfocus();
//    _nodePhone.unfocus();
//  }
//
//  String _getDeviceType() {
//    ///Device Type 1=iOS 2=Android
//    if (Platform.isIOS) {
//      return "1";
//    }
//    return "2";
//  }
//
//  Future<String> _getId() async {
//    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//    if (Theme
//        .of(context)
//        .platform == TargetPlatform.iOS) {
//      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
//      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
//    } else {
//      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
//      return androidDeviceInfo.androidId; // unique ID on Android
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    SizeConfig().init(context);
////    NotificationTextField();
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Notification App'),
//      ),
//      backgroundColor: Colors.white38,
//      body: Stack(
//        children: <Widget>[
//          SingleChildScrollView(
//            padding: EdgeInsets.only(top: 90),
//            child: Center(
//              child: Column(
//                children: <Widget>[
//                  Container(
//                    decoration: BoxDecoration(
//                        border: Border.all(color: Colors.blueAccent),
//                        color: Colors.blueGrey,
//                        borderRadius: BorderRadius.circular(10.0),
//                        boxShadow: [
//                          BoxShadow(
//                            color: Colors.grey,
//                            blurRadius: 8.0,
//                            spreadRadius: 10.0,
//                            offset: Offset(10.0, 10.0),
//                          )
//                        ]),
////                    color: Colors.white,
//                    width: 400,
//                    height: 500,
////                    padding: EdgeInsets.all(15),
//                    child: Column(
//                      children: <Widget>[
//                        Text(
//                          'Sign Up',
//                          style: TextStyle(
//                              fontWeight: FontWeight.bold, fontSize: 25),
//                        ),
//                        AppSpacing.verticalSpace(AppDimen.V_DIMEN_15),
//                        Text(
//                          "Register for the app",
//                          style: TextStyle(color: Colors.grey, fontSize: 20),
//                        ),
//                        AppSpacing.verticalSpace(AppDimen.V_DIMEN_30),
//                        Align(
//                          alignment: Alignment.centerLeft,
//                          child: Text(
//                            "Name",
//                            style: TextStyle(color: Colors.blueGrey),
//                          ),
//                        ),
//                        AppSpacing.verticalSpace(AppDimen.V_DIMEN_15),
//                        NotificationTextField(
//                          hintText: "Andrew Clief",
//                          valueText: "",
////                      errorText: model.registrationModel.passwordError,
//                          textEditingController: _controllerName,
//                          focusNode: _nodeFirstName,
//                          textInputAction: TextInputAction.next,
//                          onChange: (value) {
////                        model.registrationModel.password = value;
//                          },
//                          onSubmitted: (value) {
//                            _nodeFirstName.unfocus();
//                            _nodePhone.requestFocus();
//                            _controllerName.text = value;
////                        if (model.isAddressCheckingOn) model.validateSignUpSecondPart();
//                          },
//                          isObscureText: true,
//                          textInputType: TextInputType.text,
//                          prefixWidget: Icon(
//                            Icons.face,
//                            size: AppDimen.ICON_SIZE_25,
//                            color: Colors.redAccent,
//                          ),
//                        ),
//                        AppSpacing.verticalSpace(AppDimen.V_DIMEN_30),
//                        Align(
//                          alignment: Alignment.centerLeft,
//                          child: Text(
//                            "Mobile",
//                            style: TextStyle(color: Colors.blueGrey),
//                          ),
//                        ),
//                        AppSpacing.verticalSpace(AppDimen.V_DIMEN_15),
//                        NotificationTextField(
//                          hintText: "+123 89562354 12",
//                          valueText: "",
//                          textInputAction: TextInputAction.next,
//                          textEditingController: _controllerPhone,
//                          focusNode: _nodePhone,
//                          inputFormatter: WidgetHelper.phoneNumberFormatter,
//                          textInputType: TextInputType.phone,
//                          errorText: "",
//                          onChange: (value) {
//                            _controllerPhone.text = value;
//                          },
//                          prefixWidget: Icon(
//                            Icons.mobile_screen_share,
//                            size: AppDimen.ICON_SIZE_25,
//                            color: Colors.brown,
//                          ),
//                          onSubmitted: (value) {
//                            _nodePhone.unfocus();
//                            _nodeConfirmPassword.requestFocus();
//                            _controllerPhone.text = value;
////                        if (model.isAddressCheckingOn) model.validateSignUpSecondPart();
//                          },
//                        ),
//                        AppSpacing.verticalSpace(AppDimen.V_DIMEN_30),
//                        Align(
//                          alignment: Alignment.centerLeft,
//                          child: Text(
//                            "Password",
//                            style: TextStyle(color: Colors.blueGrey),
//                          ),
//                        ),
//                        AppSpacing.verticalSpace(AppDimen.V_DIMEN_15),
//                        NotificationTextField(
//                          hintText: "Enter Password",
//                          valueText: "",
////                      errorText: model.registrationModel.confirmPasswordError,
//                          textEditingController: _controllerConformPassword,
//                          focusNode: _nodeConfirmPassword,
//                          isObscureText: true,
//                          onSubmitted: (value) {
//                            _nodeConfirmPassword.unfocus();
////                        if (model.isAddressCheckingOn) model.validateSignUpSecondPart();
//                          },
//                          onChange: (value) {
////                        model.registrationModel.confirmPassword = value;
//                          },
//                          textInputType: TextInputType.text,
//                          prefixWidget: Icon(
//                            Icons.lock,
//                            size: AppDimen.ICON_SIZE_25,
//                            color: Colors.brown,
//                          ),
//                        ),
//                        AppSpacing.verticalSpace(AppDimen.V_DIMEN_15),
//                        Row(
//                          children: <Widget>[
//                            Expanded(
//                              child: ToggleSwitch(
//                                activeColor: AppColor.colorFaqItem,
//                                switchText: "Remember Me",
//                                isClickable: true,
//                                separatorValue: AppDimen.H_DIMEN_5,
//                                isChecked: true,
//                                //model.isRememberMe,
//                                isExpanded: true,
//                                isLayoutClickable: true,
//                                isSwitchLeft: true,
//                                switchTextStyle: TextStyle(
//                                  fontSize: AppDimen.TEXT_SIZE_15,
//                                  color: AppColor.colorHintText,
//                                ),
//                                onCheckChange: (value) {
////                              model.isRememberMe = value;
//                                },
//                                inactiveThumbColor: Colors.blueAccent,
//                                activeTrackColor: Colors.green,
//                                inactiveTrackColor: Colors.grey[400],
//                              ),
//                            ),
//                          ],
//                        ),
//                      ],
//                    ),
//                  ),
//                  AppSpacing.verticalSpace(AppDimen.V_DIMEN_30),
//                  Container(
//                    width: 300,
//                    child: NotificationServicesButton(
//                      text: "Sign Up",
//                      buttonColor: Colors.black38,
//                      height: AppDimen.V_DIMEN_50,
//                      textStyle: TextStyle(
//                          fontWeight: FontWeight.w700,
//                          color: Colors.white,
//                          fontSize: AppDimen.TEXT_SIZE_17),
//                      onClick: () {
//                        _unfocusAll();
//                        FocusScope.of(context).requestFocus(new FocusNode());
//                      },
//                    ),
//                  ),
//                  AppSpacing.verticalSpace(AppDimen.V_DIMEN_15),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text(
//                        "Already have an account",
//                        style: TextStyle(color: Colors.black38),
//                      ),
//                      AppSpacing.horizontalSpace(AppDimen.H_DIMEN_10),
//                      GestureDetector(
//                        onTap: () {
//                          Navigator.of(context).push(
//                              MaterialPageRoute(builder: (context) => LogIn()));
//                        },
//                        child: Text(
//                          "Log In",
//                          style: TextStyle(
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                      )
//                    ],
//                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Checkbox(
//                          activeColor: Colors.brown,
//                          value: isChecked,
//                          onChanged: (value) {
//                            isChecked = value;
//                          }),
//                      Text(
//                        "I agree to the ",
//                        style: TextStyle(color: Colors.black38),
//                      ),
//                      GestureDetector(
//                        onTap: () {},
//                        child: Text(
//                          "Terms and Conditions ",
//                          style: TextStyle(
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                      ),
//                      Text(
//                        " of using the App ",
//                        style: TextStyle(color: Colors.black38),
//                      ),
//                    ],
//                  ),
//                ],
//              ),
//            ),
//          ),
//          AppSpacing.verticalSpace(AppDimen.V_DIMEN_15),
//          Align(
//            alignment: Alignment.topLeft,
//            heightFactor: 2.0,
//            widthFactor: 1.5,
//            child: Container(
//              padding: EdgeInsets.all(10),
//              margin: EdgeInsets.only(top: 5),
//              child: IconButton(
//                  padding: EdgeInsets.all(AppDimen.H_DIMEN_20),
//                  alignment: Alignment.topRight,
//                  icon: Icon(
//                    Icons.arrow_back,
//                    size: 30,
//                    color: Colors.black,
//                  ),
//                  onPressed: () {
////                      _onBackPress();
//                  }),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}