import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_k/global/helpers/database_helper.dart';
import 'package:project_k/global/utils/extra_utilities.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterFormSubmissionEvent>(_registerFormSubmissionMethod);
  }

  Future<void> _registerFormSubmissionMethod(
    RegisterFormSubmissionEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterFormSubmissionProcession()); // Show Processing

    int insertId = await DatabaseHelper.insert(
      table: 'Users',
      values: {
        'fullname': event.fullNameData.forCompare(),
        'phone': event.phoneData.forCompare(),
        'email': event.emailData.forCompare(),
        'password': event.passwordData.forCompare(),
        'dob': event.dobData.forCompare(),
        'status': 1,
      },
    );
    if (insertId > 0) {
      emit(
        RegisterFormSubmissionSuccess(successMessage: "Register Successfully"),
      );
    } else {
      emit(RegisterFormSubmissionFailed(errorMessage: "Register Failed"));
    }
  }
}
