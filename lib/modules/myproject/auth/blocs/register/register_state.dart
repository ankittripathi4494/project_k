part of 'register_bloc.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}


final class RegisterFormSubmissionProcession extends RegisterState {}

final class RegisterFormSubmissionSuccess extends RegisterState {
  late final String successMessage;
  RegisterFormSubmissionSuccess({required this.successMessage});
}

final class RegisterFormSubmissionFailed extends RegisterState {
  late final String errorMessage;
  RegisterFormSubmissionFailed({required this.errorMessage});
}
