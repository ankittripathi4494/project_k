import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_k/modules/auth/repositories/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

// Controller
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository repository;
  LoginBloc({required this.repository}) : super(LoginInitial()) {
    on<LoginFormSubmissionEvent>(_loginFormSubmissionMethod);
  }

  _loginFormSubmissionMethod(
    LoginFormSubmissionEvent event,
    Emitter<LoginState> emit,
  ) async {
   
    emit(LoginFormSubmissionProcession()); // Show Processing

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
  }
}
