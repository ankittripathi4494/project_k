import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_k/modules/auth/repositories/login_repository.dart';

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
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
        .authenticate(scopeHint: ['email']);
      
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
     
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
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
