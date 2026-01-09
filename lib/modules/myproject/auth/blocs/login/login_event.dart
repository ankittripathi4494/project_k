part of 'login_bloc.dart';

sealed class LoginEvent {}

class LoginFormSubmissionEventWithUsernameAndPassword extends LoginEvent {
  late final String usernameData;
  late final String passwordData;

  LoginFormSubmissionEventWithUsernameAndPassword({
    required this.usernameData,
    required this.passwordData,
  });
}

class GoogleLoginEvent extends LoginEvent {}

class GithubLoginEvent extends LoginEvent {}

class FacebookLoginEvent extends LoginEvent {}

class AppleLoginEvent extends LoginEvent {}