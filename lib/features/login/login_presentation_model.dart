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
        emailErrorText = '',
        passwordErrorText = '',
        isLoading = false;

  LoginPresentationModel._({
    required this.emailValue,
    required this.passwordValue,
    required this.emailValidator,
    required this.passwordValidator,
    required this.emailErrorText,
    required this.passwordErrorText,
    required this.isLoading,
  });

  final EmailValidator emailValidator;

  final PasswordValidator passwordValidator;

  @override
  final bool isLoading;

  @override
  final String emailValue;

  @override
  final String passwordValue;

  @override
  final String emailErrorText;

  @override
  final String passwordErrorText;

  @override
  bool get enableLogin => validateEmail(emailValue).isSuccess && validatePassword(passwordValue).isSuccess;

  EmailValidatorResult validateEmail(String value) => emailValidator.validate(value);

  PasswordValidatorResult validatePassword(String value) => passwordValidator.validate(value);

  LoginViewModel validateFields() {
    return copyWith(
      emailErrorText: emailValidator.validate(emailValue).message,
      passwordErrorText: passwordValidator.validate(passwordValue).message,
    );
  }

  LoginPresentationModel copyWith({
    String? emailValue,
    String? passwordValue,
    EmailValidator? emailValidator,
    PasswordValidator? passwordValidator,
    String? emailErrorText,
    String? passwordErrorText,
    bool? isLoading,
  }) {
    return LoginPresentationModel._(
      emailValue: emailValue ?? this.emailValue,
      passwordValue: passwordValue ?? this.passwordValue,
      emailValidator: emailValidator ?? this.emailValidator,
      passwordValidator: passwordValidator ?? this.passwordValidator,
      emailErrorText: emailErrorText ?? this.emailErrorText,
      passwordErrorText: passwordErrorText ?? this.passwordErrorText,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

abstract class LoginViewModel {
  String get emailValue;

  String get emailErrorText;

  String get passwordValue;

  String get passwordErrorText;

  bool get enableLogin;

  bool get isLoading;
}
