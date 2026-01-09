import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    //! Save Data in Local Database
/*
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

    */

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: event.emailData,
            password: event.passwordData,
          );
        if (credential.user!=null) {
          emit(
        RegisterFormSubmissionSuccess(successMessage: "Register Successfully"),
      );
        }
        else{
          emit(RegisterFormSubmissionFailed(errorMessage: "Register Failed"));
        }
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFormSubmissionFailed(errorMessage: 'The password provided is too weak.'));
        
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFormSubmissionFailed(errorMessage: 'The account already exists for that email.'));
        
      }
      
    } catch (e) {
      print(e);
 emit(RegisterFormSubmissionFailed(errorMessage: e.toString()));
      
    }
  }
}
