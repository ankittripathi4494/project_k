import 'package:project_k/global/helpers/database_helper.dart';
import 'package:project_k/global/utils/extra_utilities.dart';
import 'package:project_k/modules/auth/blocs/login/login_bloc.dart';

class LoginRepository {
  LoginRepository._internal();
  static final LoginRepository instance = LoginRepository._internal();

  factory LoginRepository() => instance; // Factory Method

  bool getFormSubmissionForLocalData(LoginFormSubmissionEvent event) {
    const userName = 'demo@demo.com';
    const userPassword = 'Demo@12@34@56';
    if ((event.usernameData.forCompare() == userName.forCompare()) &&
        (event.passwordData.forCompare() == userPassword.forCompare())) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getFormSubmissionForLocalDatabase(LoginFormSubmissionEvent event) async {
    List<Map<String, dynamic>> list = await DatabaseHelper.queryAllRows(
      table: 'Users',
    );
    if ((list.any(
          (c) =>
              event.usernameData.forCompare().compareTo(
                c['email'].toString().forCompare(),
              ) ==
              0,
        )) &&
        (list.any(
          (c) =>
              event.passwordData.forCompare().compareTo(
                c['password'].toString().forCompare(),
              ) ==
              0,
        ))) {
      return true;
    } else {
      return false;
    }
  }

  getFormSubmissionForAPIs(LoginFormSubmissionEvent event) {}

  getFormSubmissionForFirebase(LoginFormSubmissionEvent event) {}
}
