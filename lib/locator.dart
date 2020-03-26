import 'package:get_it/get_it.dart';
import 'package:notification_app/core/model/app_settings.dart';
import 'package:notification_app/core/model/user_login_model.dart';
import 'package:notification_app/core/repository/_remote_repository.dart';
import 'package:notification_app/core/viewmodel/login_viewmodel.dart';
import 'package:notification_app/core/viewmodel/otp_verification_viewmodel.dart';
import 'package:notification_app/core/viewmodel/registration_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AppSettings());
  locator.registerLazySingleton(() => RemoteRepository());
//  locator.registerLazySingleton(() => CommonRepository());
  locator.registerLazySingleton(() => UserLoginModel());
//  locator.registerLazySingleton(() => ContactInfo());

  locator.registerFactory(() => RegistrationViewModel());
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(()=> OTPVerificationViewModel());
}