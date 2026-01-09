import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:project_k/global/helpers/database_helper.dart';
import 'package:project_k/global/utils/extra_utilities.dart';
import 'package:project_k/modules/myproject/auth/blocs/login/login_bloc.dart';

class LoginRepository {
  LoginRepository._internal();
  static final LoginRepository instance = LoginRepository._internal();

  factory LoginRepository() => instance; // Factory Method

  bool getFormSubmissionForLocalData(
    LoginFormSubmissionEventWithUsernameAndPassword event,
  ) {
    const userName = 'demo@demo.com';
    const userPassword = 'Demo@12@34@56';
    if ((event.usernameData.forCompare() == userName.forCompare()) &&
        (event.passwordData.forCompare() == userPassword.forCompare())) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getFormSubmissionForLocalDatabase(
    LoginFormSubmissionEventWithUsernameAndPassword event,
  ) async {
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

  getFormSubmissionForAPIs(
    LoginFormSubmissionEventWithUsernameAndPassword event,
  ) {}

  Future<Map<String, dynamic>?> getFormSubmissionForFirebase(
    LoginFormSubmissionEventWithUsernameAndPassword event,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.usernameData,
        password: event.passwordData,
      );
      // 🔑 Get FCM token
      final fcmToken = await FirebaseMessaging.instance.getToken();

      print("FCM Token: $fcmToken");

      return {
        "code": credential.user,
        "fcmToken": fcmToken,
        "isLogin": true,
        "reason": 'Login Successful',
      };
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return {
          "code": 'user-not-found',
          "isLogin": false,
          "reason": 'No user found for that email.',
        };
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return {
          "code": 'wrong-password',
          "isLogin": false,
          "reason": 'Wrong password provided for that user.',
        };
      }
    } catch (e) {
      print(e);

      return {"code": e.toString(), "isLogin": false, "reason": e.toString()};
    }
    return null;
  }
}
