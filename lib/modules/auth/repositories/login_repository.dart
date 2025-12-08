import 'package:project_k/global/utils/extra_utilities.dart';
import 'package:project_k/modules/auth/blocs/login/login_bloc.dart';

const userName = 'demo@demo.com';
const userPassword = 'Demo@12@34@56';

class LoginRepository {
  LoginRepository._internal();
  static final LoginRepository instance = LoginRepository._internal();

  factory LoginRepository() => instance; // Factory Method

  bool getFormSubmissionForLocalData(LoginFormSubmissionEvent event) {
    if ((event.usernameData.forCompare() == userName.forCompare()) &&
        (event.passwordData.forCompare() == userPassword.forCompare())) {
          return true;
    } else {
       return false;
    }
  }

  getFormSubmissionForLocalDatabase(LoginFormSubmissionEvent event) {}

  getFormSubmissionForAPIs(LoginFormSubmissionEvent event) {}

  getFormSubmissionForFirebase(LoginFormSubmissionEvent event) {}
}
