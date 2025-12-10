part of 'forget_password_bloc.dart';

@immutable
sealed class ForgetPasswordEvent {}

class ForgetPasswordFormSubmissionEvent extends ForgetPasswordEvent {
  late final String currentPasswordData;
  late final String newPasswordData;
  late final String confirmNewPasswordData;

  ForgetPasswordFormSubmissionEvent({
    required this.currentPasswordData,
    required this.newPasswordData,
    required this.confirmNewPasswordData,
  });
}
