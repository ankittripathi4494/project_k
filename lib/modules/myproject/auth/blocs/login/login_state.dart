part of 'login_bloc.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginFormSubmissionProcession extends LoginState {}

final class LoginFormSubmissionSuccess extends LoginState {
  late final String successMessage;
  LoginFormSubmissionSuccess({required this.successMessage});
}

final class LoginFormSubmissionFailed extends LoginState {
  late final String errorMessage;
  LoginFormSubmissionFailed({required this.errorMessage});
}
