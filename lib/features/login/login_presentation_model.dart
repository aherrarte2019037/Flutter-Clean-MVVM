class LoginPresentationModel implements LoginViewModel {
  LoginPresentationModel.initial()
      : emailValue = '',
        passwordValue = '';

  LoginPresentationModel._({
    required this.emailValue,
    required this.passwordValue,
  });

  @override
  final String emailValue;

  @override
  final String passwordValue;

  @override
  String get emailErrorText => '';

  @override
  String get passwordErrorText => '';

  @override
  bool get enableLogin => false;

  LoginPresentationModel copyWith({
    String? emailValue,
    String? passwordValue,
  }) {
    return LoginPresentationModel._(
      emailValue: emailValue ?? this.emailValue,
      passwordValue: passwordValue ?? this.passwordValue,
    );
  }
}

abstract class LoginViewModel {
  String get emailValue;

  String get emailErrorText;

  String get passwordValue;

  String get passwordErrorText;

  bool get enableLogin;
}
