part of 'forget_password_bloc.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}


final class ForgetPasswordFormSubmissionProcession extends ForgetPasswordState {}

final class ForgetPasswordFormSubmissionSuccess extends ForgetPasswordState {
  late final String successMessage;
  ForgetPasswordFormSubmissionSuccess({required this.successMessage});
}

final class ForgetPasswordFormSubmissionFailed extends ForgetPasswordState {
  late final String errorMessage;
  ForgetPasswordFormSubmissionFailed({required this.errorMessage});
}
