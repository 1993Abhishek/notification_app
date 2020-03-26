import 'package:notification_app/core/enums/view_state.dart';
import 'package:notification_app/core/model/_notification_response_model.dart';
import 'package:notification_app/core/model/registration_model.dart';
import 'package:notification_app/core/repository/registration_repository.dart';
import 'package:notification_app/core/viewmodel/_base_model.dart';
import 'package:notification_app/core/helper/extension_helper.dart';

class RegistrationViewModel extends BaseModel {
  RegistrationRepository _repository = RegistrationRepository();
  RegistrationModel registrationModel = RegistrationModel();
  NotificationResponseModel response;
  bool isAddressCheckingOn = false;
  bool validateSignUp() {
    bool isValidationSuccess = false;
    isAddressCheckingOn = true;
    registrationModel.clearAllError();
    if (registrationModel.firstName.isEmpty) {
      registrationModel.firstNameError = "Please enter your first name";
    }
    else if (registrationModel.lastName.isEmpty) {
      registrationModel.lastNameError = "Please enter your last name";
    }
    else if (registrationModel.mobileNumber.isEmpty){
      registrationModel.mobileNumberError= "Please enter your phone number";
    }
    else if(registrationModel.password.isEmpty)
      {
        registrationModel.passwordError="Please enter a valid password";
      }
    else{
      isAddressCheckingOn = false;
      isValidationSuccess = true;
    }

    notifyListeners();
    return isValidationSuccess;
  }

  Future<NotificationResponseModel> registerUser() async {
    setState(ViewState.Busy);
    response = await _repository.registerUser(
        firstName: registrationModel.firstName,
        lastName: registrationModel.lastName,
        phoneNumber: registrationModel.mobileNumber,
        password: registrationModel.password,
        );
    setState(ViewState.Idle);
    return response;
  }
}