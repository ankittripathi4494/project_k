import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_k/global/helpers/log_helper.dart';
import 'package:project_k/modules/myproject/auth/repositories/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

// Controller
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository repository;
  LoginBloc({required this.repository}) : super(LoginInitial()) {
    on<LoginFormSubmissionEventWithUsernameAndPassword>(
      _loginFormSubmissionMethod,
    );
    on<GoogleLoginEvent>(_googleLoginMethod);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    // Google Sign Instance
    GoogleSignIn googleSignIn = GoogleSignIn.instance;

    googleSignIn.initialize(
      clientId: _getClientID(),
      serverClientId: dotenv.get('SERVER_CLIENT_ID'),
    );

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        (await googleSignIn.authenticate(scopeHint: ['email'])).authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  String _getClientID() {
    String os = Platform.operatingSystem;
    switch (os) {
      case "android":
        return dotenv.get('ANDROID_CLIENT_ID');
      case "ios":
        return dotenv.get('IOS_CLIENT_ID');
      default:
        return dotenv.get('ANDROID_CLIENT_ID');
    }
  }

  _googleLoginMethod(GoogleLoginEvent event, Emitter<LoginState> emit) async {
    try {
      final credential = await signInWithGoogle();
      if (credential.user != null) {
        emit(LoginFormSubmissionSuccess(successMessage: "Login SuccessFull"));
      }
      emit(LoginFormSubmissionFailed(errorMessage: "Login Failed"));
    } catch (e) {
      print(e);
      emit(LoginFormSubmissionFailed(errorMessage: e.toString()));
    }
  }

  _loginFormSubmissionMethod(
    LoginFormSubmissionEventWithUsernameAndPassword event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginFormSubmissionProcession()); // Show Processing
    //! Local DataBase
    /*
    bool result = await LoginRepository.instance.getFormSubmissionForLocalDatabase(
      event,
    );
    if (result == true) {
      emit(
        LoginFormSubmissionSuccess(successMessage: "Login SuccessFull"),
      ); // replace Processing with success
    } else {
      emit(
        LoginFormSubmissionFailed(errorMessage: "Login Failed"),
      ); // replace Processing with failed
    }
*/

    //! Firebase Database
    Map<String, dynamic>? result = await LoginRepository.instance
        .getFormSubmissionForFirebase(event);
    if (result != null && result['isLogin'] == true) {
      LoggerHelper().logger.d("FCM Token :- ${result['fcmToken']}");
      emit(
        LoginFormSubmissionSuccess(successMessage: "Login SuccessFull"),
      ); // replace Processing with success
    } else {
      emit(
        LoginFormSubmissionFailed(errorMessage: "Login Failed"),
      ); // replace Processing with failed
    }
  }
}
