import 'package:tutapp/features/login/domain/login_result_status.dart';
import 'package:tutapp/features/login/login_page_params.dart';
import 'package:tutapp/validators/email_validator.dart';
import 'package:tutapp/validators/password_validator.dart';

class LoginPresentationModel implements LoginViewModel {
  LoginPresentationModel.initial(
    LoginPageParams params,
    this.emailValidator,
    this.passwordValidator,
  )   : emailValue = '',
        passwordValue = '',
        emailValidationResult = EmailValidationResult.initial,
        passwordValidationResult = PasswordValidationResult.initial,
        loginStatus = LoginResultStatus.initial;

  LoginPresentationModel._({
    required this.emailValue,
    required this.passwordValue,
    required this.emailValidator,
    required this.passwordValidator,
    required this.emailValidationResult,
    required this.passwordValidationResult,
    required this.loginStatus,
  });

  final EmailValidator emailValidator;

  final PasswordValidator passwordValidator;

  @override
  final LoginResultStatus loginStatus;

  @override
  final String emailValue;

  @override
  final String passwordValue;

  @override
  final EmailValidationResult emailValidationResult;

  @override
  final PasswordValidationResult passwordValidationResult;

  @override
  bool get enableLogin => emailValidationResult.isSuccess && passwordValidationResult.isSuccess;

  EmailValidationResult validateEmail(String value) => emailValidator.validate(value);

  PasswordValidationResult validatePassword(String value) => passwordValidator.validate(value);

  LoginViewModel validateFields() {
    return copyWith(
      emailValidationResult: emailValidator.validate(emailValue),
      passwordValidationResult: passwordValidator.validate(passwordValue),
    );
  }

  LoginPresentationModel copyWith({
    String? emailValue,
    String? passwordValue,
    EmailValidator? emailValidator,
    PasswordValidator? passwordValidator,
    EmailValidationResult? emailValidationResult,
    PasswordValidationResult? passwordValidationResult,
    LoginResultStatus? loginStatus,
  }) {
    return LoginPresentationModel._(
      emailValue: emailValue ?? this.emailValue,
      passwordValue: passwordValue ?? this.passwordValue,
      emailValidator: emailValidator ?? this.emailValidator,
      passwordValidator: passwordValidator ?? this.passwordValidator,
      emailValidationResult: emailValidationResult ?? this.emailValidationResult,
      passwordValidationResult: passwordValidationResult ?? this.passwordValidationResult,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }
}

abstract class LoginViewModel {
  String get emailValue;

  EmailValidationResult get emailValidationResult;

  String get passwordValue;

  PasswordValidationResult get passwordValidationResult;

  bool get enableLogin;

  LoginResultStatus get loginStatus;
}
