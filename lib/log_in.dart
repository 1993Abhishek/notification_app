import 'package:flutter/material.dart';
import 'package:notification_app/core/viewmodel/login_viewmodel.dart';
import 'package:notification_app/main.dart';
import 'package:notification_app/notification.dart';
import 'package:notification_app/registration.dart';
import 'package:notification_app/ui/helper/app_colors.dart';
import 'package:notification_app/ui/helper/app_dimen.dart';
import 'package:notification_app/ui/helper/app_spacing.dart';
import 'package:notification_app/ui/helper/static_widget_helper.dart';
import 'package:notification_app/ui/views/base_view.dart';
import 'package:notification_app/ui/widget/notification_button.dart';
import 'package:notification_app/ui/widget/notification_textField.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController _controllerPassword, _controllerPhone;
  FocusNode _nodePhone, _nodeConfirmPassword;

  @override
  void initState() {
    _controllerPhone = TextEditingController();
    _controllerPassword = TextEditingController();

    _nodeConfirmPassword = FocusNode();
    _nodePhone = FocusNode();
    super.initState();
  }

  _unfocusAll() {
    _nodeConfirmPassword.unfocus();
    _nodePhone.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseView<LoginViewModel>(
      onModelReady: (model){

      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Notification App'),
        ),
        backgroundColor: Colors.white38,
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 90),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      width: 400,
                      height: 400,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'HEY THERE!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          AppSpacing.verticalSpace(AppDimen.V_DIMEN_15),
                          Text(
                            "Please Signup to your account",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          AppSpacing.verticalSpace(AppDimen.V_DIMEN_30),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Phone",
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ),
                          AppSpacing.verticalSpace(AppDimen.V_DIMEN_15),
                          NotificationTextField(
                            hintText: "+123 89562354 12",
                            valueText: "",
                            textInputAction: TextInputAction.next,
                            textEditingController: _controllerPhone,
                            focusNode: _nodePhone,
                            inputFormatter: WidgetHelper.phoneNumberFormatter,
                            textInputType: TextInputType.phone,
                            errorText: "",
                            onChange: (value) {
                              _controllerPhone.text = value;
                            },
                            prefixWidget: Icon(
                              Icons.mobile_screen_share,
                              size: AppDimen.ICON_SIZE_25,
                              color: Colors.brown,
                            ),
                            onSubmitted: (value) {
                              _nodePhone.unfocus();
                              _nodeConfirmPassword.requestFocus();
                              _controllerPhone.text = value;
//                        if (model.isAddressCheckingOn) model.validateSignUpSecondPart();
                            },
                          ),
                          AppSpacing.verticalSpace(AppDimen.V_DIMEN_30),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Password",
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ),
                          AppSpacing.verticalSpace(AppDimen.V_DIMEN_15),
                          NotificationTextField(
                            hintText: "Enter Password",
                            valueText: "",
//                      errorText: model.registrationModel.confirmPasswordError,
                            textEditingController: _controllerPassword,
                            focusNode: _nodeConfirmPassword,
                            isObscureText: true,
                            onSubmitted: (value) {
                              _nodeConfirmPassword.unfocus();
//                        if (model.isAddressCheckingOn) model.validateSignUpSecondPart();
                            },
                            onChange: (value) {
//                        model.registrationModel.confirmPassword = value;
                            },
                            textInputType: TextInputType.text,
                            prefixWidget: Icon(
                              Icons.lock,
                              size: AppDimen.ICON_SIZE_25,
                              color: Colors.brown,
                            ),
                          ),
                          Row(
                            children: <Widget>[],
                          ),
                        ],
                      ),
                    ),
                    AppSpacing.verticalSpace(AppDimen.V_DIMEN_15),
                    Container(
                      width: 300,
                      child: NotificationServicesButton(
                        text: "Log In",
                        buttonColor: Colors.black38,
                        height: AppDimen.V_DIMEN_50,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: AppDimen.TEXT_SIZE_17),
                        onClick: () {

//                          model.authenticatingUser(latitude: null, longitude: null);
                          _unfocusAll();
                          FocusScope.of(context).requestFocus(new FocusNode());
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => App_Notification()));
                        },
                      ),
                    ),
                    AppSpacing.verticalSpace(AppDimen.V_DIMEN_15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Dont have an account",
                          style: TextStyle(color: Colors.black38),
                        ),
                        AppSpacing.horizontalSpace(AppDimen.H_DIMEN_10),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Registration()));
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            AppSpacing.verticalSpace(AppDimen.V_DIMEN_15),
            Align(
              alignment: Alignment.topLeft,
              heightFactor: 2.0,
              widthFactor: 1.5,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 5),
                child: IconButton(
                    padding: EdgeInsets.all(AppDimen.H_DIMEN_20),
                    alignment: Alignment.topRight,
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: () {
//                      _onBackPress();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
