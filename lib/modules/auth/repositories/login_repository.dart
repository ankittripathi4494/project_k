class LoginRepository {
  LoginRepository._internal();
  static final LoginRepository instance = LoginRepository._internal();

  factory LoginRepository() => instance; // Factory Method

  getFormSubmissionForLocalData() {}

  getFormSubmissionForLocalDatabase() {}

  getFormSubmissionForAPIs() {}

  getFormSubmissionForFirebase() {}
}
