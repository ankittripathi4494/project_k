part of 'login_bloc.dart';

sealed class LoginEvent {}

class LoginFormSubmissionEvent extends LoginEvent {
  late final String usernameData;
  late final String passwordData;

  LoginFormSubmissionEvent({
    required this.usernameData,
    required this.passwordData,
  });
}
