part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}


class RegisterFormSubmissionEvent extends RegisterEvent {
  late final String fullNameData;
  late final String emailData;
  late final String phoneData;
  late final String dobData;
  late final String passwordData;

  RegisterFormSubmissionEvent({
    required this.fullNameData,
    required this.emailData,
    required this.phoneData,
    required this.dobData,
    required this.passwordData,
  });
}
